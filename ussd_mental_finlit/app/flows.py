from flask import request, make_response
from app.content import LANG_MAP, pick_random_message
from app.africastalking import send_sms
from app.models import db, UserSession, USSDSession, UserProgress, Subscriber, Feedback
from datetime import datetime, date
import re
import logging

logger = logging.getLogger(__name__)

LANG_PROMPT = "Hitamo ururimi / Select Language:\n1. Kinyarwanda\n2. Icyongereza (English)"
LANG_KEY_MAP = {'1': 'rw', '2': 'en'}

FAQ_PATH_MARKER = '__faq__'

def validate_phone_number(phone):
    """Validate Rwanda phone number format."""
    if not phone:
        return False
    # Rwanda format: +250XXXXXXXXX or 250XXXXXXXXX
    pattern = r'^(\+?250)?\d{9}$'
    return bool(re.match(pattern, phone))

def get_or_create_user_session(phone_number):
    """Get or create user session from database."""
    try:
        user_session = UserSession.query.filter_by(phone_number=phone_number).first()
        if not user_session:
            user_session = UserSession(phone_number=phone_number, language='rw')
            db.session.add(user_session)
            db.session.commit()
        return user_session
    except Exception as e:
        logger.error(f"Error getting user session: {e}")
        db.session.rollback()
        return None

def log_ussd_action(session_id, phone_number, language, menu_path):
    """Log USSD session for analytics."""
    try:
        log_entry = USSDSession(
            session_id=session_id,
            phone_number=phone_number,
            language=language,
            menu_path=menu_path
        )
        db.session.add(log_entry)
        db.session.commit()
    except Exception as e:
        logger.error(f"Error logging USSD session: {e}")
        db.session.rollback()

def update_user_progress(phone_number, menu_path):
    """Update user progress and award points/badges."""
    try:
        progress = UserProgress.query.filter_by(phone_number=phone_number).first()
        if not progress:
            progress = UserProgress(phone_number=phone_number)
            db.session.add(progress)
        
        # Update visit counts based on menu path
        if menu_path.startswith('1'):
            progress.mental_health_visits += 1
            progress.points += 5
        elif menu_path.startswith('2'):
            progress.financial_literacy_visits += 1
            progress.points += 5
        elif menu_path.startswith('3'):
            progress.safety_visits += 1
            progress.points += 5
        
        # Update streak
        today = date.today()
        if progress.last_visit_date:
            days_diff = (today - progress.last_visit_date).days
            if days_diff == 1:
                progress.streak_days += 1
            elif days_diff > 1:
                progress.streak_days = 1
        else:
            progress.streak_days = 1
        
        progress.last_visit_date = today
        
        # Award badges
        total_visits = (progress.mental_health_visits + 
                       progress.financial_literacy_visits + 
                       progress.safety_visits)
        
        if total_visits >= 10:
            progress.add_badge('regular_learner')
        if progress.streak_days >= 7:
            progress.add_badge('week_warrior')
        if progress.mental_health_visits >= 5:
            progress.add_badge('mental_health_champion')
        if progress.financial_literacy_visits >= 5:
            progress.add_badge('financial_guru')
        
        db.session.commit()
    except Exception as e:
        logger.error(f"Error updating user progress: {e}")
        db.session.rollback()

def handle_ussd_session(request):
    try:
        session_id = request.values.get('sessionId', '')
        phone_number = request.values.get('phoneNumber', '')
        text = request.values.get('text', '').strip()
        menu_level = text.split('*') if text else []

        # Get or create user session from database
        user_session = get_or_create_user_session(phone_number)
        lang = user_session.language if user_session else 'rw'
        
        # Log this USSD action
        try:
            log_ussd_action(session_id, phone_number, lang, text)
        except:
            pass
        
        # Handle language selection
        if text == '#':
            return _response(f"CON {LANG_PROMPT}")
        
        if text in LANG_KEY_MAP:
            if user_session:
                try:
                    user_session.language = LANG_KEY_MAP[text]
                    db.session.commit()
                    lang = user_session.language
                except:
                    lang = LANG_KEY_MAP[text]
            return _response(f"CON {LANG_MAP[lang]['MAIN_MENU']}")
        
        lang_dict = LANG_MAP.get(lang, LANG_MAP['rw'])

        # Welcome screen (first interaction)
        if text == '':
            welcome_msg_rw = (
                "Murakaza neza kuri Real Works!\n\n"
                "Twite ku Buzima n'Imibereho\n\n"
                "Dufasha urubyiruko ruri mu bucukuzi kubaka ubuzima bwiza, "
                "imibereho myiza n'ubumenyi bw'imari.\n\n"
                "Mwifuza gukomeza?\n"
                "1. Yego\n"
                "2. Oya"
            )
            welcome_msg_en = (
                "Welcome to Real Works!\n\n"
                "Focus on Wellbeing & Life\n\n"
                "Supporting young mining workers with mental health, "
                "financial literacy and life skills.\n\n"
                "Continue?\n"
                "1. Yes\n"
                "2. No"
            )
            welcome_msg = welcome_msg_rw if lang == 'rw' else welcome_msg_en
            return _response(f"CON {welcome_msg}")
        
        # Welcome response - Yes (Continue to main menu)
        elif text == '1':
            return _response(f"CON {lang_dict['MAIN_MENU']}")
        
        # Welcome response - No (Exit)
        elif text == '2':
            exit_msg = "Murakoze! Muze undi musi." if lang == 'rw' else "Thank you! Come back anytime."
            return _response(f"END {exit_msg}")
        
        # Main Menu - Mental Health (after welcome, pressing 1 gives text='1*1')
        elif text == '1*1':
            return _response(f"CON {lang_dict['MH_MENU']}")
        elif text == '1*1*1':
            update_user_progress(phone_number, text)
            return _response(f"CON {pick_random_message(lang_dict['MH_STRESS'])}\n0. Garuka")
        elif text == '1*1*2':
            update_user_progress(phone_number, text)
            return _response(f"CON {pick_random_message(lang_dict['MH_LOSS_FEAR'])}\n0. Garuka")
        elif text == '1*1*3':
            update_user_progress(phone_number, text)
            return _response(f"CON {pick_random_message(lang_dict['MH_CONFIDENCE'])}\n0. Garuka")
        elif text == '1*1*4':
            update_user_progress(phone_number, text)
            return _response(f"CON {pick_random_message(lang_dict['MH_RELATIONSHIPS'])}\n0. Garuka")
        
        # Main Menu - Financial Literacy
        elif text == '1*2':
            return _response(f"CON {lang_dict['FL_MENU']}")
        elif text == '1*2*1':
            update_user_progress(phone_number, text)
            return _response(f"CON {pick_random_message(lang_dict['FL_SAVINGS'])}\n0. Garuka")
        elif text == '1*2*2':
            update_user_progress(phone_number, text)
            return _response(f"CON {pick_random_message(lang_dict['FL_BUDGETING'])}\n0. Garuka")
        elif text == '1*2*3':
            update_user_progress(phone_number, text)
            return _response(f"CON {pick_random_message(lang_dict['FL_LOANS'])}\n0. Garuka")
        elif text == '1*2*4':
            update_user_progress(phone_number, text)
            return _response(f"CON {pick_random_message(lang_dict['FL_DEBT'])}\n0. Garuka")
        
        # Main Menu - Safety
        elif text == '1*3':
            return _response(f"CON {lang_dict['SAFETY_MENU']}")
        elif text == '1*3*1':
            update_user_progress(phone_number, text)
            return _response(f"CON {pick_random_message(lang_dict['SAFETY_BEHAVIOR'])}\n0. Garuka")
        elif text == '1*3*2':
            update_user_progress(phone_number, text)
            return _response(f"CON {pick_random_message(lang_dict['SAFETY_TEAMWORK'])}\n0. Garuka")
        elif text == '1*3*3':
            update_user_progress(phone_number, text)
            return _response(f"CON {pick_random_message(lang_dict['SAFETY_COMMUNICATION'])}\n0. Garuka")
        elif text == '1*3*4':
            update_user_progress(phone_number, text)
            return _response(f"CON {pick_random_message(lang_dict['SAFETY_GOALS'])}\n0. Garuka")
        
        # Main Menu - Support Info
        elif text == '1*4':
            return _response(f"CON {lang_dict['SUPPORT_INFO']}")
        
        # Main Menu - About/FAQ
        elif text == '1*5':
            return _response(f"CON {lang_dict['ABOUT']}\n0. Garuka")
        
        # Main Menu - Exit
        elif text == '1*6':
            exit_msg = "Murakoze gukoresha Real Works. Twigire imbere hamwe!" if lang == 'rw' else "Thank you for using Real Works!"
            return _response(f"END {exit_msg}")
        
        # Main Menu - SMS Subscription
        elif text == '1*7':
            try:
                subscriber = Subscriber.query.filter_by(phone_number=phone_number).first()
                if subscriber and subscriber.active:
                    response = "Urasanzwe wanditse kuri SMS. Murakoze!\n0. Garuka"
                else:
                    response = "Kwandikisha kuri SMS:\n1. Yego - Weekly tips\n2. Oya\n0. Garuka"
            except:
                response = "Kwandikisha kuri SMS:\n1. Yego - Weekly tips\n2. Oya\n0. Garuka"
            return _response(f"CON {response}")
        
        elif text == '1*7*1':
            try:
                subscriber = Subscriber.query.filter_by(phone_number=phone_number).first()
                if not subscriber:
                    subscriber = Subscriber(phone_number=phone_number, language=lang)
                    db.session.add(subscriber)
                else:
                    subscriber.active = True
                db.session.commit()
                response = "Mwiyandikishije neza!\n0. Garuka"
            except:
                response = "Hari ikosa.\n0. Garuka"
            return _response(f"CON {response}")
        
        elif text == '1*7*2':
            return _response(f"CON {lang_dict['MAIN_MENU']}")
        
        # Main Menu - Feedback
        elif text == '1*8':
            response = "Ohereza ubutumwa:\n1. Ikibazo\n2. Ubufasha\n3. Icyo uvuga\n0. Garuka"
            return _response(f"CON {response}")
        
        elif text == '1*8*1':
            return _response("END Twohereze ikibazo cyawe via SMS")
        
        elif text == '1*8*2':
            try:
                feedback = Feedback(phone_number=phone_number, category='help_request', message='Help requested')
                db.session.add(feedback)
                db.session.commit()
                response = "Tuzakuvugisha vuba."
            except:
                response = "Hari ikosa."
            return _response(f"END {response}")
        
        elif text == '1*8*3':
            return _response("END Twohereze icyo uvuga via SMS")
        
        # Main Menu - View Progress
        elif text == '1*9':
            try:
                progress = UserProgress.query.filter_by(phone_number=phone_number).first()
                if progress:
                    badges = progress.get_badges()
                    badge_str = ', '.join(badges) if badges else 'None'
                    response = f"Points: {progress.points}\nStreak: {progress.streak_days} days\nBadges: {badge_str}\n0. Garuka"
                else:
                    response = "Start exploring to track progress!\n0. Garuka"
            except:
                response = "Progress not available.\n0. Garuka"
            return _response(f"CON {response}")
        
        # Back to main menu (pressing 0 from any submenu)
        elif text.endswith('*0'):
            return _response(f"CON {lang_dict['MAIN_MENU']}")
        
        # Handle selections after going back (e.g., "1*1*1*0*2" -> treat as "1*2")
        elif '*0*' in text:
            # Extract the part after the last *0*
            after_back = text.split('*0*')[-1]
            # Reconstruct as if coming from main menu (after welcome screen which is '1')
            new_text = '1*' + after_back
            
            # Mental Health after back
            if new_text == '1*1':
                return _response(f"CON {lang_dict['MH_MENU']}")
            # Financial Literacy after back
            elif new_text == '1*2':
                return _response(f"CON {lang_dict['FL_MENU']}")
            # Safety after back
            elif new_text == '1*3':
                return _response(f"CON {lang_dict['SAFETY_MENU']}")
            # Support Info after back
            elif new_text == '1*4':
                return _response(f"CON {lang_dict['SUPPORT_INFO']}")
            # About/FAQ after back
            elif new_text == '1*5':
                return _response(f"CON {lang_dict['ABOUT']}\n0. Garuka")
            # Exit after back
            elif new_text == '1*6':
                exit_msg = "Murakoze gukoresha Real Works. Twigire imbere hamwe!" if lang == 'rw' else "Thank you for using Real Works!"
                return _response(f"END {exit_msg}")
            # SMS Subscription after back
            elif new_text == '1*7':
                try:
                    subscriber = Subscriber.query.filter_by(phone_number=phone_number).first()
                    if subscriber and subscriber.active:
                        response = "Urasanzwe wanditse kuri SMS. Murakoze!\n0. Garuka"
                    else:
                        response = "Kwandikisha kuri SMS:\n1. Yego - Weekly tips\n2. Oya\n0. Garuka"
                except:
                    response = "Kwandikisha kuri SMS:\n1. Yego - Weekly tips\n2. Oya\n0. Garuka"
                return _response(f"CON {response}")
            # Feedback after back
            elif new_text == '1*8':
                response = "Ohereza ubutumwa:\n1. Ikibazo\n2. Ubufasha\n3. Icyo uvuga\n0. Garuka"
                return _response(f"CON {response}")
            # Progress after back
            elif new_text == '1*9':
                try:
                    progress = UserProgress.query.filter_by(phone_number=phone_number).first()
                    if progress:
                        badges = progress.get_badges()
                        badge_str = ', '.join(badges) if badges else 'None'
                        response = f"Points: {progress.points}\nStreak: {progress.streak_days} days\nBadges: {badge_str}\n0. Garuka"
                    else:
                        response = "Start exploring to track progress!\n0. Garuka"
                except:
                    response = "Progress not available.\n0. Garuka"
                return _response(f"CON {response}")
            # Handle deeper navigation after back (e.g., "1*1*1" from "1*0*1*1")
            elif '*' in after_back:
                parts = after_back.split('*')
                if len(parts) == 2:  # e.g., "1*1" -> Mental Health submenu content
                    main_option = parts[0]
                    sub_option = parts[1]
                    
                    if main_option == '1':  # Mental Health content
                        if sub_option == '1':
                            update_user_progress(phone_number, new_text)
                            return _response(f"CON {pick_random_message(lang_dict['MH_STRESS'])}\n0. Garuka")
                        elif sub_option == '2':
                            update_user_progress(phone_number, new_text)
                            return _response(f"CON {pick_random_message(lang_dict['MH_LOSS_FEAR'])}\n0. Garuka")
                        elif sub_option == '3':
                            update_user_progress(phone_number, new_text)
                            return _response(f"CON {pick_random_message(lang_dict['MH_CONFIDENCE'])}\n0. Garuka")
                        elif sub_option == '4':
                            update_user_progress(phone_number, new_text)
                            return _response(f"CON {pick_random_message(lang_dict['MH_RELATIONSHIPS'])}\n0. Garuka")
                    
                    elif main_option == '2':  # Financial Literacy content
                        if sub_option == '1':
                            update_user_progress(phone_number, new_text)
                            return _response(f"CON {pick_random_message(lang_dict['FL_SAVINGS'])}\n0. Garuka")
                        elif sub_option == '2':
                            update_user_progress(phone_number, new_text)
                            return _response(f"CON {pick_random_message(lang_dict['FL_BUDGETING'])}\n0. Garuka")
                        elif sub_option == '3':
                            update_user_progress(phone_number, new_text)
                            return _response(f"CON {pick_random_message(lang_dict['FL_LOANS'])}\n0. Garuka")
                        elif sub_option == '4':
                            update_user_progress(phone_number, new_text)
                            return _response(f"CON {pick_random_message(lang_dict['FL_DEBT'])}\n0. Garuka")
                    
                    elif main_option == '3':  # Safety content
                        if sub_option == '1':
                            update_user_progress(phone_number, new_text)
                            return _response(f"CON {pick_random_message(lang_dict['SAFETY_BEHAVIOR'])}\n0. Garuka")
                        elif sub_option == '2':
                            update_user_progress(phone_number, new_text)
                            return _response(f"CON {pick_random_message(lang_dict['SAFETY_TEAMWORK'])}\n0. Garuka")
                        elif sub_option == '3':
                            update_user_progress(phone_number, new_text)
                            return _response(f"CON {pick_random_message(lang_dict['SAFETY_COMMUNICATION'])}\n0. Garuka")
                        elif sub_option == '4':
                            update_user_progress(phone_number, new_text)
                            return _response(f"CON {pick_random_message(lang_dict['SAFETY_GOALS'])}\n0. Garuka")
        
        # Invalid
        else:
            error_msg = "Umubare mwanditse ntuhwanye na menu.\n" if lang == 'rw' else "Invalid option.\n"
            return _response(f"CON {error_msg}{lang_dict['MAIN_MENU']}")
    
    except Exception as e:
        logger.error(f"Critical error: {e}", exc_info=True)
        return _response("END Hari ikosa. Mwongere mugerageze.")

def _response(at_format):
    flask_resp = make_response(at_format, 200)
    flask_resp.headers["Content-Type"] = "text/plain"
    return flask_resp

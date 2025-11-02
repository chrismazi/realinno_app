from flask import request, make_response
from app.content import LANG_MAP, LANGS, pick_random_message
from app.africastalking import send_sms

# In-memory phone->lang cache for MVP (would use something persistent in prod)
LANG_STATE = {}

LANG_PROMPT = "Select Language:\n1. English\n2. Kiswahili"

LANG_KEY_MAP = {'1': 'en', '2': 'sw'}

# Helper: main handler

def handle_ussd_session(request):
    session_id = request.values.get('sessionId', '')
    service_code = request.values.get('serviceCode', '')
    phone_number = request.values.get('phoneNumber', '')
    text = request.values.get('text', '').strip()

    menu_level = text.split('*') if text else []
    # Determine or update language selection
    lang = LANG_STATE.get(phone_number, 'en')
    # Language entry logic (handles explicit # or level 0 with no stored lang)
    if text == '#' or (text == '' and phone_number not in LANG_STATE):
        LANG_STATE[phone_number] = 'en'  # default
        at_format = f"CON {LANG_PROMPT}"
        return _response(at_format)
    if text.startswith('#*') or (menu_level and menu_level[0] == '#'):
        # Pick language based on input after #*, e.g. #*2
        lang_pick = menu_level[1] if len(menu_level) > 1 else ''
        if lang_pick in LANG_KEY_MAP:
            LANG_STATE[phone_number] = LANG_KEY_MAP[lang_pick]
            lang = LANG_KEY_MAP[lang_pick]
            at_format = f"CON {LANG_MAP[lang]['MAIN_MENU']}"
        else:
            at_format = f"CON {LANG_PROMPT}"
        return _response(at_format)
    if text in LANG_KEY_MAP and (phone_number not in LANG_STATE or (menu_level and menu_level[0] == '#')):
        # Language chosen
        LANG_STATE[phone_number] = LANG_KEY_MAP[text]
        lang = LANG_KEY_MAP[text]
        at_format = f"CON {LANG_MAP[lang]['MAIN_MENU']}"
        return _response(at_format)
    # menu navigation as per selected lang
    lang_dict = LANG_MAP.get(lang, LANG_MAP['en'])
    if text == '':
        response = lang_dict['MAIN_MENU']
        at_format = f"CON {response}"
    elif text == '1':
        response = lang_dict['MH_MENU']
        at_format = f"CON {response}"
    elif text == '1*1':
        response = f"{pick_random_message(lang_dict['MH_COPING_STRATEGIES'])}\n0. Back"
        at_format = f"CON {response}"
    elif text == '1*2':
        response = f"{pick_random_message(lang_dict['MH_MINDFULNESS'])}\n0. Back"
        at_format = f"CON {response}"
    elif text == '1*3':
        response = lang_dict['SUPPORT_INFO']
        at_format = f"CON {response}"
    elif text == '2':
        response = lang_dict['FL_MENU']
        at_format = f"CON {response}"
    elif text == '2*1':
        response = f"{pick_random_message(lang_dict['FL_SAVINGS_TIPS'])}\n0. Back"
        at_format = f"CON {response}"
    elif text == '2*2':
        response = f"{pick_random_message(lang_dict['FL_BUDGETING'])}\n0. Back"
        at_format = f"CON {response}"
    elif text == '2*3':
        response = f"{pick_random_message(lang_dict['FL_SMALL_BIZ'])}\n0. Back"
        at_format = f"CON {response}"
    elif text == '3':
        if lang == 'en':
          tip_message = "Daily Tip: Practice gratitude. Write down one thing you're thankful for today."
        else:
          tip_message = "Kidokezo: Shukuru. Andika jambo moja unalothamini leo."
        sms_result = send_sms(phone_number, tip_message)
        if sms_result.get('error'):
            response = ("Sorry, we couldn't send your tip right now. Please try again later.\n0. Back" 
                        if lang == 'en' else 
                        "Samahani, hatujaweza kutuma ujumbe. Tafadhali jaribu tena baadaye.\n0. Rudi Nyuma")
        else:
            response = ("A daily tip has been sent to your phone via SMS!\n0. Back" if lang == 'en' else "Kidokezo kimepelekwa kupitia SMS!\n0. Rudi Nyuma")
        at_format = f"CON {response}"
    elif text == '4':
        response = lang_dict['SUPPORT_INFO']
        at_format = f"END {response}"
    elif text.endswith('*0') or text == '0':
        response = lang_dict['MAIN_MENU']
        at_format = f"CON {response}"
    else:
        # fallback: return to main menu in current language
        response = ("Invalid input. Please use the menu options.\n" if lang == 'en' else "Chaguo batili. Tafadhali tumia orodha.\n") + lang_dict['MAIN_MENU']
        at_format = f"CON {response}"
    return _response(at_format)

def _response(at_format):
    flask_resp = make_response(at_format, 200)
    flask_resp.headers["Content-Type"] = "text/plain"
    return flask_resp

from flask import request, make_response
from app.content import LANG_MAP, pick_random_message
from app.africastalking import send_sms

LANG_STATE, ABOUT_PAGE_STATE, FEEDBACKS = {}, {}, {}

LANG_PROMPT = "Hitamo ururimi / Select Language:\n1.Kinyarwanda 2.Icyongereza 3.Kiswahili"
LANG_KEY_MAP = {'1': 'rw', '2': 'en', '3': 'sw'}

def handle_ussd_session(request):
    session_id = request.values.get('sessionId', '')
    phone = request.values.get('phoneNumber', '')
    text = request.values.get('text', '').strip()
    menu = text.split('*') if text else []
    lang = LANG_STATE.get(phone, 'rw')
    lang_dict = LANG_MAP.get(lang, LANG_MAP['rw'])

    # Language selector logic
    if text == '#' or (text == '' and phone not in LANG_STATE):
        LANG_STATE[phone] = 'rw'
        return _resp(f"CON {LANG_PROMPT}")
    if text.startswith('#*') or (menu and menu[0] == '#'):
        choice = menu[1] if len(menu) > 1 else ''
        if choice in LANG_KEY_MAP:
            LANG_STATE[phone] = LANG_KEY_MAP[choice]
            return _resp(f"CON {LANG_MAP[LANG_KEY_MAP[choice]]['MAIN_MENU']}")
        return _resp(f"CON {LANG_PROMPT}")
    if text in LANG_KEY_MAP and (phone not in LANG_STATE or (menu and menu[0] == '#')):
        LANG_STATE[phone] = LANG_KEY_MAP[text]
        return _resp(f"CON {LANG_MAP[LANG_KEY_MAP[text]]['MAIN_MENU']}")

    # MAIN MENU
    if text == '':
        return _resp(f"CON {lang_dict['MAIN_MENU']}")
    if text == '1':
        return _resp(f"CON {lang_dict['MH_MENU']}")
    if text == '1*1':
        return _resp(f"CON {pick_random_message(lang_dict['MH_STRESS'])}\n0.Garuka #.Ururimi")
    if text == '1*2':
        return _resp(f"CON {pick_random_message(lang_dict['MH_LOSS_FEAR'])}\n0.Garuka #.Ururimi")
    if text == '1*3':
        return _resp(f"CON {pick_random_message(lang_dict['MH_CONFIDENCE'])}\n0.Garuka #.Ururimi")
    if text == '1*4':
        return _resp(f"CON {pick_random_message(lang_dict['MH_RELATIONSHIPS'])}\n0.Garuka #.Ururimi")
    if text == '2':
        return _resp(f"CON {lang_dict['FL_MENU']}")
    # Similar for 2* submenus (omitted for brevity, see above patterns)
    if text == '3':
        return _resp(f"CON {lang_dict['SAFETY_MENU']}")
    # ... More mapping for safety
    if text == '4':
        return _resp(f"CON {lang_dict['SUPPORT_INFO']}")
    if text == '5': # OTHER menu
        return _resp(f"CON {lang_dict['OTHER_MENU']}")
    if text == '5*1': # Paginated About/Vision/Mission/FAQ
        p = ABOUT_PAGE_STATE.get(phone, 0)
        pages = lang_dict['ABOUT_PAGES']
        msg = pages[p]
        if p < len(pages)-1:
            ABOUT_PAGE_STATE[phone] = p+1
            return _resp(f"CON {msg}")
        ABOUT_PAGE_STATE[phone] = 0
        return _resp(f"CON {msg}")
    if text == '5*1*9': # Next page in About
        p = ABOUT_PAGE_STATE.get(phone, 1)
        pages = lang_dict['ABOUT_PAGES']
        if p < len(pages):
            msg = pages[p]
            if p < len(pages)-1:
                ABOUT_PAGE_STATE[phone] = p+1
                return _resp(f"CON {msg}")
            else:
                ABOUT_PAGE_STATE[phone] = 0
                return _resp(f"CON {msg}")
        ABOUT_PAGE_STATE[phone] = 0
        return _resp(f"CON {pages[0]}")
    if text == '5*2':
        FEEDBACKS.setdefault(phone, [])
        return _resp(f"CON {lang_dict['FEEDBACK_PROMPT']}")
    # Collect the user's feedback as any arbitrary string after 5*2*
    if len(menu) > 2 and menu[0] == '5' and menu[1] == '2':
        feedback = '*'.join(menu[2:])
        FEEDBACKS[phone].append(feedback)
        print(f"FEEDBACK from {phone}: {feedback}")
        return _resp(f"CON {lang_dict['FEEDBACK_DONE']}")
    if text == '6':
        return _resp("END Murakoze gukoresha Real Works. Twigire imbere hamwe!")
    if text == '0':
        return _resp(f"CON {lang_dict['MAIN_MENU']}")
    return _resp(f"CON Hitamo uburyo bunoze kuri menu.\n{lang_dict['MAIN_MENU']}")

def _resp(msg):
    r = make_response(msg, 200)
    r.headers["Content-Type"] = "text/plain"
    return r

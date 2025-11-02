from flask import request, make_response
from app.content import LANG_MAP, pick_random_message
from app.africastalking import send_sms

# In-memory phone->lang cache for MVP (would use something persistent in prod)
LANG_STATE = {}

LANG_PROMPT = "Hitamo ururimi / Select Language:\n1. Kinyarwanda\n2. Icyongereza (English)\n3. Kiswahili"
LANG_KEY_MAP = {'1': 'rw', '2': 'en', '3': 'sw'}

FAQ_PATH_MARKER = '__faq__'

# Helper to check if user is viewing FAQ/About

def handle_ussd_session(request):
    session_id = request.values.get('sessionId', '')
    phone_number = request.values.get('phoneNumber', '')
    text = request.values.get('text', '').strip()
    menu_level = text.split('*') if text else []

    # --- Default language is RW ---
    lang = LANG_STATE.get(phone_number, 'rw')
    if text == '#' or (text == '' and phone_number not in LANG_STATE):
        LANG_STATE[phone_number] = 'rw'
        at_format = f"CON {LANG_PROMPT}"
        return _response(at_format)
    if text.startswith('#*') or (menu_level and menu_level[0] == '#'):
        lang_pick = menu_level[1] if len(menu_level) > 1 else ''
        if lang_pick in LANG_KEY_MAP:
            LANG_STATE[phone_number] = LANG_KEY_MAP[lang_pick]
            lang = LANG_KEY_MAP[lang_pick]
            at_format = f"CON {LANG_MAP[lang]['MAIN_MENU']}"
        else:
            at_format = f"CON {LANG_PROMPT}"
        return _response(at_format)
    if text in LANG_KEY_MAP and (phone_number not in LANG_STATE or (menu_level and menu_level[0] == '#')):
        LANG_STATE[phone_number] = LANG_KEY_MAP[text]
        lang = LANG_KEY_MAP[text]
        at_format = f"CON {LANG_MAP[lang]['MAIN_MENU']}"
        return _response(at_format)
    lang_dict = LANG_MAP.get(lang, LANG_MAP['rw'])

    if text == '':
        response = lang_dict['MAIN_MENU']
        at_format = f"CON {response}"
    elif text == '1':
        response = lang_dict['MH_MENU']
        at_format = f"CON {response}"
    elif text == '1*1':
        response = pick_random_message(lang_dict['MH_STRESS']) + "\n0. Garuka"
        at_format = f"CON {response}"
    elif text == '1*2':
        response = pick_random_message(lang_dict['MH_LOSS_FEAR']) + "\n0. Garuka"
        at_format = f"CON {response}"
    elif text == '1*3':
        response = pick_random_message(lang_dict['MH_CONFIDENCE']) + "\n0. Garuka"
        at_format = f"CON {response}"
    elif text == '1*4':
        response = pick_random_message(lang_dict['MH_RELATIONSHIPS']) + "\n0. Garuka"
        at_format = f"CON {response}"
    elif text == '2':
        response = lang_dict['FL_MENU']
        at_format = f"CON {response}"
    elif text == '2*1':
        response = pick_random_message(lang_dict['FL_SAVINGS']) + "\n0. Garuka"
        at_format = f"CON {response}"
    elif text == '2*2':
        response = pick_random_message(lang_dict['FL_BUDGETING']) + "\n0. Garuka"
        at_format = f"CON {response}"
    elif text == '2*3':
        response = pick_random_message(lang_dict['FL_LOANS']) + "\n0. Garuka"
        at_format = f"CON {response}"
    elif text == '2*4':
        response = pick_random_message(lang_dict['FL_DEBT']) + "\n0. Garuka"
        at_format = f"CON {response}"
    elif text == '3':
        response = lang_dict['SAFETY_MENU']
        at_format = f"CON {response}"
    elif text == '3*1':
        response = pick_random_message(lang_dict['SAFETY_BEHAVIOR']) + "\n0. Garuka"
        at_format = f"CON {response}"
    elif text == '3*2':
        response = pick_random_message(lang_dict['SAFETY_TEAMWORK']) + "\n0. Garuka"
        at_format = f"CON {response}"
    elif text == '3*3':
        response = pick_random_message(lang_dict['SAFETY_COMMUNICATION']) + "\n0. Garuka"
        at_format = f"CON {response}"
    elif text == '3*4':
        response = pick_random_message(lang_dict['SAFETY_GOALS']) + "\n0. Garuka"
        at_format = f"CON {response}"
    elif text == '4':
        response = lang_dict['SUPPORT_INFO']
        at_format = f"CON {response}"
    elif text == '5':
        response = lang_dict['ABOUT'] + "\n0. Garuka"
        at_format = f"CON {response}"
    elif text == '6':
        at_format = f"END Murakoze gukoresha Real Works. Twigire imbere hamwe!"
    elif text.endswith('*0') or text == '0':
        response = lang_dict['MAIN_MENU']
        at_format = f"CON {response}"
    else:
        response = "Umubare mwanditse ntuhwanye na menu. Mwongere mugerageze.\n" + lang_dict['MAIN_MENU']
        at_format = f"CON {response}"
    return _response(at_format)

def _response(at_format):
    flask_resp = make_response(at_format, 200)
    flask_resp.headers["Content-Type"] = "text/plain"
    return flask_resp

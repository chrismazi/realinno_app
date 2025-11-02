import os
import requests

AT_API_KEY = os.getenv('AFRICASTALKING_API_KEY')
AT_USERNAME = os.getenv('AFRICASTALKING_USERNAME')
AT_SHORTCODE = os.getenv('AFRICASTALKING_SHORTCODE')
AT_SMS_URL = 'https://api.africastalking.com/version1/messaging'

HEADERS = {
    "apiKey": AT_API_KEY,
    "Accept": "application/json",
    "Content-Type": "application/x-www-form-urlencoded"
}

def send_sms(to, message):
    if not (AT_API_KEY and AT_USERNAME and AT_SHORTCODE):
        # In development, print instead of sending
        print(f"[DEV] Would send SMS to {to}: {message}")
        return {'status': 'dev', 'to': to, 'message': message}
    payload = {
        'username': AT_USERNAME,
        'to': to,
        'message': message,
        'from': AT_SHORTCODE,
    }
    try:
        resp = requests.post(AT_SMS_URL, headers=HEADERS, data=payload, timeout=10)
        resp.raise_for_status()
        return resp.json()
    except Exception as e:
        print(f"Error sending SMS: {e}")
        return {'error': str(e)}

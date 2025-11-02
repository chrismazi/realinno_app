# USSD/SMS Mental Health & Financial Literacy Platform

A secure, user-centric MVP enabling access to mental health support and financial education via basic mobile phones using USSD and SMS. 

## Features
- Multi-level USSD menu: Mental Health Guidance, Financial Literacy, Tips, and Helpline
- SMS sending capability with Africa's Talking integration (development mode prints or real SMS)
- Modular content for easy editing and expansion
- Randomized tips/messages for a fresh experience each time
- Built with Flask for rapid development and future extensibility
- Africa's Talking integration for regional scalability
- Fully stateless, no user data persisted by default

## Folder Structure
```
ussd_mental_finlit/
│
├── app/
│   ├── main.py             # Flask app and endpoints
│   ├── flows.py            # USSD menu logic
│   ├── content.py          # All USSD/SMS messages (mental health/financial tips)
│   ├── africastalking.py   # Africa's Talking config/API (SMS, ready for real or mock)
│   └── models.py           # (Optional) DB models, for expansion
├── requirements.txt
├── README.md
└── tests/
```

## Configuration
- Python 3.9+
- Install dependencies: `pip install -r requirements.txt`
- Create a `.env` file in the root with:

  ```
  AFRICASTALKING_API_KEY=your_key_here
  AFRICASTALKING_USERNAME=your_username
  AFRICASTALKING_SHORTCODE=your_shortcode
  PORT=5000 # Or any preferred port
  ```

## Running Locally
```
export FLASK_APP=app/main.py
flask run  # or: python -m app.main
```

## Africa's Talking Setup
Register your USSD/SMS endpoint (e.g., `https://yourdomain.com/ussd/`) in Africa's Talking dashboard. Use Africa's Talking sandbox for initial testing.

## Testing the Flow
Use Africa's Talking simulator to dial your partner code and go through all menu options. Notice: every time you choose a tip, it's picked at random from sample content in `content.py`. Add more for localization or depth.

## Extending & Customizing
- To add new tips/content/languages: Just update lists in `content.py`—no code changes required.
- Admin tools, progress tracking, analytics, and advanced features ready to be integrated (see `models.py`).

---
**Security Note:**
- All user sessions are stateless/anonymous unless progress tracking is explicitly enabled for future versions.
- Handles only USSD for MVP, but SMS sending is already available for future tips/reminders.

---
**Contributing or Maintenance:**
- Clone, set up `.env`, add content, and deploy.
- All code is documented and professional, suitable for handoff or collaborative development.

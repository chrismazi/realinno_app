import os
from flask import Flask, request, jsonify
from dotenv import load_dotenv
from app.flows import handle_ussd_session

load_dotenv()

app = Flask(__name__)

@app.route('/ussd/', methods=['POST'])
def ussd_callback():
    """
    Africa's Talking USSD requests handler - POSTs only. Delegates to flows.py.
    """
    response = handle_ussd_session(request)
    return response

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=int(os.environ.get('PORT', 5000)))




import os
from flask import Flask, request
from dotenv import load_dotenv
from app.flows import handle_ussd_session
from app.models import db

load_dotenv()

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///realworks.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db.init_app(app)

@app.route('/ussd/', methods=['POST'])
def ussd_callback():
    response = handle_ussd_session(request)
    return response

@app.route('/healthz')
def health():
    return {"status": "ok"}

if __name__ == "__main__":
    with app.app_context():
        db.create_all()
    app.run(host='0.0.0.0', port=int(os.environ.get('PORT', 5000)))




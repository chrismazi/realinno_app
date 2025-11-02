from flask_sqlalchemy import SQLAlchemy
from datetime import datetime

db = SQLAlchemy()

class USSDSession(db.Model):
    """Log every USSD menu action for analytics and improvement."""
    id = db.Column(db.Integer, primary_key=True)
    session_id = db.Column(db.String(128), index=True)
    phone_number = db.Column(db.String(25))
    language = db.Column(db.String(5))
    menu_path = db.Column(db.String(256))
    timestamp = db.Column(db.DateTime, default=datetime.utcnow)

class Subscriber(db.Model):
    """For users who opt-in to get SMS tips/reminders (expand in future)."""
    id = db.Column(db.Integer, primary_key=True)
    phone_number = db.Column(db.String(25), unique=True, nullable=False)
    language = db.Column(db.String(5))
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    active = db.Column(db.Boolean, default=True)

class Feedback(db.Model):
    """Messages from users needing support or help (future enhancement)."""
    id = db.Column(db.Integer, primary_key=True)
    phone_number = db.Column(db.String(25), nullable=True)
    category = db.Column(db.String(50))
    message = db.Column(db.Text)
    status = db.Column(db.String(20), default='open')
    created_at = db.Column(db.DateTime, default=datetime.utcnow)




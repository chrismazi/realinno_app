from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
import json

db = SQLAlchemy()

class UserSession(db.Model):
    """Persistent session management for user language and state."""
    __tablename__ = 'user_sessions'
    phone_number = db.Column(db.String(25), primary_key=True)
    language = db.Column(db.String(5), default='rw')
    last_menu_path = db.Column(db.String(256))
    session_data = db.Column(db.Text)  # JSON for additional state
    last_active = db.Column(db.DateTime, default=datetime.utcnow, onupdate=datetime.utcnow)
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    
    def get_session_data(self):
        """Parse JSON session data."""
        return json.loads(self.session_data) if self.session_data else {}
    
    def set_session_data(self, data):
        """Store session data as JSON."""
        self.session_data = json.dumps(data)

class USSDSession(db.Model):
    """Log every USSD menu action for analytics and improvement."""
    __tablename__ = 'ussd_sessions'
    id = db.Column(db.Integer, primary_key=True)
    session_id = db.Column(db.String(128), index=True)
    phone_number = db.Column(db.String(25), index=True)
    language = db.Column(db.String(5))
    menu_path = db.Column(db.String(256))
    timestamp = db.Column(db.DateTime, default=datetime.utcnow, index=True)

class Subscriber(db.Model):
    """For users who opt-in to get SMS tips/reminders."""
    __tablename__ = 'subscribers'
    id = db.Column(db.Integer, primary_key=True)
    phone_number = db.Column(db.String(25), unique=True, nullable=False, index=True)
    language = db.Column(db.String(5), default='rw')
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    active = db.Column(db.Boolean, default=True)
    last_sms_sent = db.Column(db.DateTime)
    
class UserProgress(db.Model):
    """Track user progress for gamification."""
    __tablename__ = 'user_progress'
    id = db.Column(db.Integer, primary_key=True)
    phone_number = db.Column(db.String(25), unique=True, nullable=False, index=True)
    modules_completed = db.Column(db.Integer, default=0)
    mental_health_visits = db.Column(db.Integer, default=0)
    financial_literacy_visits = db.Column(db.Integer, default=0)
    safety_visits = db.Column(db.Integer, default=0)
    streak_days = db.Column(db.Integer, default=0)
    last_visit_date = db.Column(db.Date)
    points = db.Column(db.Integer, default=0)
    badges = db.Column(db.Text)  # JSON array of badge names
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    updated_at = db.Column(db.DateTime, default=datetime.utcnow, onupdate=datetime.utcnow)
    
    def get_badges(self):
        """Get list of earned badges."""
        return json.loads(self.badges) if self.badges else []
    
    def add_badge(self, badge_name):
        """Add a new badge if not already earned."""
        badges = self.get_badges()
        if badge_name not in badges:
            badges.append(badge_name)
            self.badges = json.dumps(badges)
            return True
        return False

class Feedback(db.Model):
    """Messages from users needing support or help."""
    __tablename__ = 'feedback'
    id = db.Column(db.Integer, primary_key=True)
    phone_number = db.Column(db.String(25), nullable=True, index=True)
    category = db.Column(db.String(50))
    message = db.Column(db.Text)
    status = db.Column(db.String(20), default='open', index=True)
    created_at = db.Column(db.DateTime, default=datetime.utcnow, index=True)
    resolved_at = db.Column(db.DateTime)
    admin_notes = db.Column(db.Text)




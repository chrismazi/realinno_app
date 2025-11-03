import os
import logging
from logging.handlers import RotatingFileHandler
from pathlib import Path
from flask import Flask, request, jsonify
from flask_limiter import Limiter
from flask_limiter.util import get_remote_address
from dotenv import load_dotenv
from app.flows import handle_ussd_session
from app.models import db
from app.config import get_config

load_dotenv()

# Create Flask app
app = Flask(__name__)

# Load configuration
config = get_config()
app.config.from_object(config)

# Setup logging
def setup_logging(app):
    """Configure application logging."""
    log_dir = Path('logs')
    log_dir.mkdir(exist_ok=True)
    
    log_file = Path(app.config['LOG_FILE'])
    log_file.parent.mkdir(exist_ok=True)
    
    formatter = logging.Formatter(
        '[%(asctime)s] %(levelname)s in %(module)s: %(message)s'
    )
    
    # File handler with rotation
    file_handler = RotatingFileHandler(
        log_file,
        maxBytes=10485760,  # 10MB
        backupCount=10
    )
    file_handler.setFormatter(formatter)
    file_handler.setLevel(logging.INFO)
    
    # Console handler
    console_handler = logging.StreamHandler()
    console_handler.setFormatter(formatter)
    console_handler.setLevel(logging.DEBUG if app.debug else logging.INFO)
    
    # Configure root logger
    app.logger.addHandler(file_handler)
    app.logger.addHandler(console_handler)
    app.logger.setLevel(getattr(logging, app.config['LOG_LEVEL']))
    
    # Log startup
    app.logger.info('Real Works USSD application starting...')

setup_logging(app)

# Initialize database
db.init_app(app)

# Initialize rate limiter
limiter = Limiter(
    app=app,
    key_func=lambda: request.values.get('phoneNumber', get_remote_address()),
    default_limits=[app.config['RATELIMIT_DEFAULT']],
    storage_uri=app.config['RATELIMIT_STORAGE_URL']
)

@app.route('/ussd/', methods=['POST'])
@limiter.limit("100 per minute")
def ussd_callback():
    """Handle USSD callback from Africa's Talking."""
    try:
        app.logger.info(f"USSD request from {request.values.get('phoneNumber')}")
        response = handle_ussd_session(request)
        return response
    except Exception as e:
        app.logger.error(f"Error handling USSD session: {e}", exc_info=True)
        return "END Service temporarily unavailable. Please try again later.", 200

@app.route('/healthz')
def health():
    """Health check endpoint."""
    try:
        # Check database connection
        db.session.execute('SELECT 1')
        return jsonify({
            "status": "healthy",
            "database": "connected"
        }), 200
    except Exception as e:
        app.logger.error(f"Health check failed: {e}")
        return jsonify({
            "status": "unhealthy",
            "database": "disconnected",
            "error": str(e)
        }), 503

@app.route('/metrics')
def metrics():
    """Basic metrics endpoint."""
    try:
        from app.models import USSDSession, Subscriber, UserProgress
        from datetime import datetime, timedelta
        
        # Get statistics
        today = datetime.utcnow().date()
        week_ago = today - timedelta(days=7)
        
        total_sessions = USSDSession.query.count()
        sessions_today = USSDSession.query.filter(
            db.func.date(USSDSession.timestamp) == today
        ).count()
        sessions_week = USSDSession.query.filter(
            USSDSession.timestamp >= week_ago
        ).count()
        
        total_subscribers = Subscriber.query.filter_by(active=True).count()
        total_users = UserProgress.query.count()
        
        return jsonify({
            "total_sessions": total_sessions,
            "sessions_today": sessions_today,
            "sessions_this_week": sessions_week,
            "active_subscribers": total_subscribers,
            "total_users": total_users
        }), 200
    except Exception as e:
        app.logger.error(f"Error fetching metrics: {e}")
        return jsonify({"error": "Could not fetch metrics"}), 500

@app.errorhandler(404)
def not_found(error):
    """Handle 404 errors."""
    return jsonify({"error": "Endpoint not found"}), 404

@app.errorhandler(500)
def internal_error(error):
    """Handle 500 errors."""
    app.logger.error(f"Internal server error: {error}")
    db.session.rollback()
    return jsonify({"error": "Internal server error"}), 500

@app.errorhandler(429)
def ratelimit_handler(e):
    """Handle rate limit errors."""
    app.logger.warning(f"Rate limit exceeded: {request.values.get('phoneNumber')}")
    return "END Too many requests. Please try again later.", 200

if __name__ == "__main__":
    with app.app_context():
        db.create_all()
        app.logger.info("Database tables created successfully")
    
    port = int(os.environ.get('PORT', 5000))
    app.logger.info(f"Starting server on port {port}")
    app.run(host='0.0.0.0', port=port)




"""
Scheduler for periodic tasks like sending weekly SMS tips.
"""
import logging
from datetime import datetime, timedelta
from apscheduler.schedulers.background import BackgroundScheduler
from app.models import db, Subscriber
from app.content import LANG_MAP, pick_random_message
from app.africastalking import send_sms

logger = logging.getLogger(__name__)

def send_weekly_tips():
    """Send weekly tips to all active subscribers."""
    try:
        logger.info("Starting weekly SMS tip campaign...")
        
        # Get all active subscribers
        subscribers = Subscriber.query.filter_by(active=True).all()
        
        sent_count = 0
        error_count = 0
        
        for subscriber in subscribers:
            try:
                # Get language-specific content
                lang = subscriber.language or 'rw'
                lang_dict = LANG_MAP.get(lang, LANG_MAP['rw'])
                
                # Pick random tip from different categories
                categories = [
                    'MH_STRESS', 'MH_CONFIDENCE', 
                    'FL_SAVINGS', 'FL_BUDGETING',
                    'SAFETY_BEHAVIOR', 'SAFETY_GOALS'
                ]
                
                import random
                category = random.choice(categories)
                
                if category in lang_dict:
                    tip = pick_random_message(lang_dict[category])
                    
                    # Add header
                    message = f"Real Works Weekly Tip:\n{tip}"
                    
                    # Send SMS
                    result = send_sms(subscriber.phone_number, message)
                    
                    if 'error' not in result:
                        sent_count += 1
                        subscriber.last_sms_sent = datetime.utcnow()
                    else:
                        error_count += 1
                        logger.error(f"Failed to send SMS to {subscriber.phone_number}: {result.get('error')}")
                
            except Exception as e:
                error_count += 1
                logger.error(f"Error sending SMS to {subscriber.phone_number}: {e}")
        
        # Commit all updates
        db.session.commit()
        
        logger.info(f"Weekly SMS campaign completed. Sent: {sent_count}, Errors: {error_count}")
        
    except Exception as e:
        logger.error(f"Error in weekly SMS campaign: {e}")
        db.session.rollback()


def cleanup_old_sessions():
    """Clean up old session logs (older than 30 days)."""
    try:
        from app.models import USSDSession
        
        cutoff_date = datetime.utcnow() - timedelta(days=30)
        
        deleted = USSDSession.query.filter(
            USSDSession.timestamp < cutoff_date
        ).delete()
        
        db.session.commit()
        
        logger.info(f"Cleaned up {deleted} old session logs")
        
    except Exception as e:
        logger.error(f"Error cleaning up old sessions: {e}")
        db.session.rollback()


def init_scheduler(app):
    """Initialize and start the background scheduler."""
    scheduler = BackgroundScheduler()
    
    # Send weekly tips every Monday at 9 AM
    scheduler.add_job(
        func=lambda: app.app_context().push() or send_weekly_tips(),
        trigger='cron',
        day_of_week='mon',
        hour=9,
        minute=0,
        id='weekly_tips',
        name='Send weekly SMS tips',
        replace_existing=True
    )
    
    # Clean up old sessions daily at 2 AM
    scheduler.add_job(
        func=lambda: app.app_context().push() or cleanup_old_sessions(),
        trigger='cron',
        hour=2,
        minute=0,
        id='cleanup_sessions',
        name='Clean up old session logs',
        replace_existing=True
    )
    
    scheduler.start()
    logger.info("Background scheduler started")
    
    return scheduler

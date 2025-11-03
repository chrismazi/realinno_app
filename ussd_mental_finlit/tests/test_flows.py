import unittest
from flask import Flask
from app.models import db, UserSession, USSDSession, UserProgress, Subscriber, Feedback
from app.flows import (
    validate_phone_number,
    get_or_create_user_session,
    handle_ussd_session
)
from app.config import TestingConfig
from unittest.mock import Mock


class TestFlows(unittest.TestCase):
    """Test USSD flow logic."""

    def setUp(self):
        """Set up test fixtures."""
        self.app = Flask(__name__)
        self.app.config.from_object(TestingConfig)
        db.init_app(self.app)
        
        with self.app.app_context():
            db.create_all()
        
        self.client = self.app.test_client()
        self.app_context = self.app.app_context()
        self.app_context.push()

    def tearDown(self):
        """Tear down test fixtures."""
        db.session.remove()
        db.drop_all()
        self.app_context.pop()

    def test_validate_phone_number_valid(self):
        """Test phone number validation with valid numbers."""
        valid_numbers = [
            '+250788123456',
            '250788123456',
            '0788123456'
        ]
        for number in valid_numbers:
            self.assertTrue(validate_phone_number(number), f"{number} should be valid")

    def test_validate_phone_number_invalid(self):
        """Test phone number validation with invalid numbers."""
        invalid_numbers = [
            '',
            None,
            '123',
            'invalid',
            '+1234567890',
        ]
        for number in invalid_numbers:
            self.assertFalse(validate_phone_number(number), f"{number} should be invalid")

    def test_get_or_create_user_session(self):
        """Test user session creation and retrieval."""
        phone = '+250788123456'
        
        # Create new session
        session1 = get_or_create_user_session(phone)
        self.assertIsNotNone(session1)
        self.assertEqual(session1.phone_number, phone)
        self.assertEqual(session1.language, 'rw')
        
        # Retrieve existing session
        session2 = get_or_create_user_session(phone)
        self.assertIsNotNone(session2)
        self.assertEqual(session1.phone_number, session2.phone_number)

    def test_handle_ussd_session_initial(self):
        """Test initial USSD session."""
        mock_request = Mock()
        mock_request.values = {
            'sessionId': 'test-session-1',
            'phoneNumber': '+250788123456',
            'text': ''
        }
        mock_request.values.get = lambda key, default='': mock_request.values.get(key, default)
        
        response = handle_ussd_session(mock_request)
        
        self.assertIn('CON', response.data.decode())
        self.assertIn('Ubuzima bwo mu mutwe', response.data.decode())

    def test_handle_ussd_session_language_selection(self):
        """Test language selection."""
        mock_request = Mock()
        mock_request.values = {
            'sessionId': 'test-session-2',
            'phoneNumber': '+250788123456',
            'text': '2'  # Select English
        }
        mock_request.values.get = lambda key, default='': mock_request.values.get(key, default)
        
        response = handle_ussd_session(mock_request)
        
        # Should show English menu
        self.assertIn('CON', response.data.decode())

    def test_handle_ussd_session_mental_health_menu(self):
        """Test mental health menu navigation."""
        # First create a session with language set
        phone = '+250788123456'
        session = get_or_create_user_session(phone)
        session.language = 'en'
        db.session.commit()
        
        mock_request = Mock()
        mock_request.values = {
            'sessionId': 'test-session-3',
            'phoneNumber': phone,
            'text': '1'  # Mental Health menu
        }
        mock_request.values.get = lambda key, default='': mock_request.values.get(key, default)
        
        response = handle_ussd_session(mock_request)
        
        self.assertIn('CON', response.data.decode())
        self.assertIn('Mental Health', response.data.decode())

    def test_handle_ussd_session_content_delivery(self):
        """Test content delivery and progress tracking."""
        phone = '+250788123456'
        session = get_or_create_user_session(phone)
        session.language = 'en'
        db.session.commit()
        
        mock_request = Mock()
        mock_request.values = {
            'sessionId': 'test-session-4',
            'phoneNumber': phone,
            'text': '1*1'  # Mental Health > Stress
        }
        mock_request.values.get = lambda key, default='': mock_request.values.get(key, default)
        
        response = handle_ussd_session(mock_request)
        
        # Should show content
        self.assertIn('CON', response.data.decode())
        
        # Check progress was tracked
        progress = UserProgress.query.filter_by(phone_number=phone).first()
        self.assertIsNotNone(progress)
        self.assertGreater(progress.mental_health_visits, 0)
        self.assertGreater(progress.points, 0)

    def test_handle_ussd_session_invalid_input(self):
        """Test handling of invalid input."""
        phone = '+250788123456'
        session = get_or_create_user_session(phone)
        
        mock_request = Mock()
        mock_request.values = {
            'sessionId': 'test-session-5',
            'phoneNumber': phone,
            'text': '99'  # Invalid option
        }
        mock_request.values.get = lambda key, default='': mock_request.values.get(key, default)
        
        response = handle_ussd_session(mock_request)
        
        # Should show error and main menu
        self.assertIn('CON', response.data.decode())
        self.assertIn('Invalid', response.data.decode())

    def test_sms_subscription(self):
        """Test SMS subscription flow."""
        phone = '+250788123456'
        session = get_or_create_user_session(phone)
        
        # Subscribe
        mock_request = Mock()
        mock_request.values = {
            'sessionId': 'test-session-6',
            'phoneNumber': phone,
            'text': '7*1'  # Subscribe to SMS
        }
        mock_request.values.get = lambda key, default='': mock_request.values.get(key, default)
        
        response = handle_ussd_session(mock_request)
        
        # Check subscription was created
        subscriber = Subscriber.query.filter_by(phone_number=phone).first()
        self.assertIsNotNone(subscriber)
        self.assertTrue(subscriber.active)

    def test_feedback_collection(self):
        """Test feedback collection flow."""
        phone = '+250788123456'
        session = get_or_create_user_session(phone)
        
        mock_request = Mock()
        mock_request.values = {
            'sessionId': 'test-session-7',
            'phoneNumber': phone,
            'text': '8*2'  # Request help
        }
        mock_request.values.get = lambda key, default='': mock_request.values.get(key, default)
        
        response = handle_ussd_session(mock_request)
        
        # Check feedback was created
        feedback = Feedback.query.filter_by(phone_number=phone).first()
        self.assertIsNotNone(feedback)
        self.assertEqual(feedback.category, 'help_request')

    def test_progress_tracking(self):
        """Test user progress tracking and gamification."""
        phone = '+250788123456'
        session = get_or_create_user_session(phone)
        
        # Simulate multiple visits
        for i in range(6):
            mock_request = Mock()
            mock_request.values = {
                'sessionId': f'test-session-8-{i}',
                'phoneNumber': phone,
                'text': '1*1'  # Mental health content
            }
            mock_request.values.get = lambda key, default='': mock_request.values.get(key, default)
            handle_ussd_session(mock_request)
        
        # Check progress
        progress = UserProgress.query.filter_by(phone_number=phone).first()
        self.assertIsNotNone(progress)
        self.assertGreaterEqual(progress.mental_health_visits, 6)
        self.assertGreaterEqual(progress.points, 30)
        
        # Check badge awarded
        badges = progress.get_badges()
        self.assertIn('mental_health_champion', badges)


class TestModels(unittest.TestCase):
    """Test database models."""

    def setUp(self):
        """Set up test fixtures."""
        self.app = Flask(__name__)
        self.app.config.from_object(TestingConfig)
        db.init_app(self.app)
        
        with self.app.app_context():
            db.create_all()
        
        self.app_context = self.app.app_context()
        self.app_context.push()

    def tearDown(self):
        """Tear down test fixtures."""
        db.session.remove()
        db.drop_all()
        self.app_context.pop()

    def test_user_session_creation(self):
        """Test UserSession model."""
        session = UserSession(
            phone_number='+250788123456',
            language='rw'
        )
        db.session.add(session)
        db.session.commit()
        
        retrieved = UserSession.query.filter_by(phone_number='+250788123456').first()
        self.assertIsNotNone(retrieved)
        self.assertEqual(retrieved.language, 'rw')

    def test_user_progress_badges(self):
        """Test UserProgress badge functionality."""
        progress = UserProgress(phone_number='+250788123456')
        db.session.add(progress)
        db.session.commit()
        
        # Add badges
        self.assertTrue(progress.add_badge('test_badge'))
        self.assertFalse(progress.add_badge('test_badge'))  # Duplicate
        
        badges = progress.get_badges()
        self.assertIn('test_badge', badges)
        self.assertEqual(len(badges), 1)

    def test_subscriber_model(self):
        """Test Subscriber model."""
        subscriber = Subscriber(
            phone_number='+250788123456',
            language='en',
            active=True
        )
        db.session.add(subscriber)
        db.session.commit()
        
        retrieved = Subscriber.query.filter_by(phone_number='+250788123456').first()
        self.assertIsNotNone(retrieved)
        self.assertTrue(retrieved.active)


if __name__ == '__main__':
    unittest.main()

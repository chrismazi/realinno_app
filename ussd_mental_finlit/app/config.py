import os
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent.parent

class Config:
    """Base configuration."""
    SECRET_KEY = os.getenv('SECRET_KEY', 'dev-secret-key-change-in-production')
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    
    # Africa's Talking
    AFRICASTALKING_API_KEY = os.getenv('AFRICASTALKING_API_KEY')
    AFRICASTALKING_USERNAME = os.getenv('AFRICASTALKING_USERNAME')
    AFRICASTALKING_SHORTCODE = os.getenv('AFRICASTALKING_SHORTCODE')
    
    # Rate limiting
    RATELIMIT_STORAGE_URL = os.getenv('REDIS_URL', 'memory://')
    RATELIMIT_DEFAULT = "100 per minute"
    
    # Logging
    LOG_LEVEL = os.getenv('LOG_LEVEL', 'INFO')
    LOG_FILE = os.getenv('LOG_FILE', 'logs/realworks.log')
    
    # Session timeout (in hours)
    SESSION_TIMEOUT_HOURS = int(os.getenv('SESSION_TIMEOUT_HOURS', '24'))


class DevelopmentConfig(Config):
    """Development configuration."""
    DEBUG = True
    TESTING = False
    SQLALCHEMY_DATABASE_URI = os.getenv(
        'DATABASE_URL',
        f'sqlite:///{BASE_DIR}/dev_realworks.db'
    )
    SQLALCHEMY_ECHO = True


class ProductionConfig(Config):
    """Production configuration."""
    DEBUG = False
    TESTING = False
    SQLALCHEMY_DATABASE_URI = os.getenv('DATABASE_URL')
    
    def __init__(self):
        """Validate production requirements."""
        super().__init__()
        if not os.getenv('SECRET_KEY'):
            raise ValueError("SECRET_KEY environment variable must be set in production")
        if not self.SQLALCHEMY_DATABASE_URI:
            raise ValueError("DATABASE_URL environment variable must be set in production")


class TestingConfig(Config):
    """Testing configuration."""
    DEBUG = True
    TESTING = True
    SQLALCHEMY_DATABASE_URI = 'sqlite:///:memory:'
    RATELIMIT_ENABLED = False


config_by_name = {
    'development': DevelopmentConfig,
    'production': ProductionConfig,
    'testing': TestingConfig,
    'default': DevelopmentConfig
}


def get_config():
    """Get configuration based on environment."""
    env = os.getenv('FLASK_ENV', 'development')
    return config_by_name.get(env, config_by_name['default'])

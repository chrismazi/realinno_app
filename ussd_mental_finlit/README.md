<div align="center">

#  Real Works USSD Platform

### Empowering Young Mining Workers Through Mobile Technology

*Mental Health Support • Financial Literacy • Workplace Safety*

[![Python Version](https://img.shields.io/badge/python-3.9%2B-blue.svg)](https://www.python.org/downloads/)
[![Flask](https://img.shields.io/badge/flask-3.0-green.svg)](https://flask.palletsprojects.com/)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Production Ready](https://img.shields.io/badge/status-production%20ready-success.svg)](https://github.com/chrismazi/realinno_app)

[Features](#-features) • [Quick Start](#-quick-start) • [Documentation](#-api-endpoints) • [Deployment](#-deployment) • [Contributing](#-contributing)

</div>

---

##  About

**Real Works** is a production-ready, secure USSD platform designed to provide mental health support, financial literacy education, and workplace safety knowledge to young mining workers in Rwanda through basic mobile phones. No smartphone or internet connection required.

###  Mission
Improving the wellbeing and financial stability of young workers in the mining sector through accessible, mobile-first education.

###  Impact
- **Accessible**: Works on any phone (USSD - *XXX#)
- **Bilingual**: Kinyarwanda & English support
- **Always Available**: 24/7 access to support resources
- **Gamified**: Progress tracking keeps users engaged
- **Free to Use**: No data costs for end-users

##  Features

### Core Functionality
- **Multi-language Support**: Kinyarwanda (Rw) and English
- **Multi-level USSD Menu**: Mental Health Guidance, Financial Literacy, Safety & Health Knowledge
- **SMS Subscription System**: Users can opt-in for weekly tips
- **Feedback Collection**: Users can request help and send feedback
- **Progress Tracking & Gamification**: Points, streaks, and achievement badges
- **Crisis Support Information**: GBV hotline and emergency resources

### Technical Features
- **Database-backed Session Management**: Persistent user preferences and state
- **Comprehensive Analytics**: Session logging and user engagement metrics
- **Rate Limiting**: Protection against abuse (100 requests/minute per user)
- **Error Handling**: Graceful degradation and user-friendly error messages
- **Logging & Monitoring**: Rotating file logs with configurable levels
- **Health Checks & Metrics**: `/healthz` and `/metrics` endpoints
- **Scheduled Tasks**: Automated weekly SMS campaigns and data cleanup
- **Input Validation**: Phone number and request validation
- **Production-ready Configuration**: Environment-based config management

## Screenshots

<div align="center">

### Welcome Screen
<img src="docs/screenshots/welcome.png" alt="Welcome Screen" width="300"/>

*Professional welcome screen with Real Works branding*

### Main Menu
<img src="docs/screenshots/main-menu.png" alt="Main Menu" width="300"/>

*Complete bilingual menu with 9 options*

### Content Delivery
<img src="docs/screenshots/content.png" alt="Content Example" width="300"/>

*Mental health and financial literacy tips*

</div>

##  Technology Stack

| Component | Technology |
|-----------|------------|
| **Backend** | Python 3.9+, Flask 3.0 |
| **Database** | PostgreSQL (prod), SQLite (dev) |
| **ORM** | SQLAlchemy |
| **SMS Gateway** | Africa's Talking API |
| **Rate Limiting** | Flask-Limiter + Redis |
| **Scheduling** | APScheduler |
| **Testing** | Pytest |
| **Containerization** | Docker, Docker Compose |
| **WSGI Server** | Gunicorn (production) |

##  Demo & User Flow

### How It Works

```
User Dials *XXX#
    ↓
┌─────────────────────────────────┐
│   Welcome Screen (Real Works)   │
│   1. Yes (Continue)              │
│   2. No (Exit)                   │
└─────────────────────────────────┘
    ↓ [Press 1]
┌─────────────────────────────────┐
│         Main Menu                │
│   1. Mental Health               │
│   2. Financial Literacy          │
│   3. Safety & Health             │
│   4. Support Info                │
│   5. FAQ/About                   │
│   6. Exit                        │
│   7. SMS Subscription            │
│   8. Send Feedback               │
│   9. View Progress               │
│   #. Change Language             │
└─────────────────────────────────┘
    ↓ [Select Option]
┌─────────────────────────────────┐
│      Content Delivered           │
│   • Tips & Guidance              │
│   • Points Awarded (+5)          │
│   • Progress Tracked             │
│   0. Back to Menu                │
└─────────────────────────────────┘
```

### Live Demo
Test the application using Africa's Talking sandbox:
1. Visit [sandbox.africastalking.com](https://sandbox.africastalking.com)
2. Login with your credentials
3. Go to USSD → Launch Simulator
4. Enter your configured shortcode
5. Start testing!

##  Folder Structure
```
ussd_mental_finlit/
│
├── app/
│   ├── main.py             # Flask app with error handling, rate limiting
│   ├── flows.py            # USSD menu logic with session management
│   ├── content.py          # All USSD/SMS messages (Kinyarwanda & English)
│   ├── africastalking.py   # Africa's Talking SMS API integration
│   ├── models.py           # Database models (UserSession, USSDSession, UserProgress, etc.)
│   ├── config.py           # Configuration management (dev, prod, test)
│   └── scheduler.py        # Background tasks (weekly SMS, cleanup)
├── tests/
│   ├── __init__.py
│   └── test_flows.py       # Comprehensive test suite
├── .env.example            # Environment variables template
├── .gitignore              # Git ignore rules
├── .dockerignore           # Docker ignore rules
├── Dockerfile              # Docker container configuration
├── docker-compose.yml      # Local development with Docker
├── requirements.txt        # Python dependencies
└── README.md
```

##  Quick Start

### Prerequisites
- Python 3.9+
- PostgreSQL (production) or SQLite (development)
- Redis (optional, for rate limiting in production)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/chrismazi/realinno_app.git
   cd realinno_app/ussd_mental_finlit
   ```

2. **Create virtual environment**
   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

3. **Install dependencies**
   ```bash
   pip install -r requirements.txt
   ```

4. **Configure environment variables**
   ```bash
   cp .env.example .env
   # Edit .env with your configuration
   ```

   Required environment variables:
   ```env
   FLASK_ENV=development
   SECRET_KEY=your-secret-key
   DATABASE_URL=sqlite:///dev_realworks.db
   AFRICASTALKING_API_KEY=your_api_key
   AFRICASTALKING_USERNAME=your_username
   AFRICASTALKING_SHORTCODE=your_shortcode
   ```

5. **Initialize database**
   ```bash
   python -m app.main
   ```
   This will create all necessary database tables.

### Running Locally

**Option 1: Direct Python**
```bash
python -m app.main
```

**Option 2: Flask CLI**
```bash
export FLASK_APP=app/main.py
flask run
```

**Option 3: Docker Compose** (Recommended)
```bash
docker-compose up
```

The application will be available at `http://localhost:5000`

### Testing

Run the test suite:
```bash
python -m pytest tests/ -v
```

Run with coverage:
```bash
python -m pytest tests/ --cov=app --cov-report=html
```

##  API Endpoints

### USSD Callback
- **POST** `/ussd/`
- Handles USSD requests from Africa's Talking
- Rate limited: 100 requests/minute per phone number

### Health Check
- **GET** `/healthz`
- Returns application health status and database connectivity

### Metrics
- **GET** `/metrics`
- Returns usage statistics:
  - Total sessions
  - Sessions today/this week
  - Active subscribers
  - Total users

## 📱 USSD Menu Structure

### Main Menu
1. Mental Health & Wellbeing
   - Coping with stress
   - Dealing with loss/fear
   - Building confidence
   - Healthy relationships
2. Financial Literacy
   - Saving well
   - Making a budget
   - Understanding SACCO loans
   - Avoiding bad debts
3. Safety & Health Knowledge
   - Safe behavior
   - Working together
   - Ways to communicate well
   - Preparing life goals
4. Support & Information
5. FAQ/About
6. Exit
7. Subscribe to SMS
8. Send Feedback
9. View Progress
\#. Change Language

##  Gamification & Progress Tracking

Users earn:
- **5 points** per content visit
- **Streak days** for consecutive daily visits
- **Badges**:
  - `regular_learner`: 10+ total visits
  - `week_warrior`: 7-day streak
  - `mental_health_champion`: 5+ mental health visits
  - `financial_guru`: 5+ financial literacy visits

##  Africa's Talking Setup

1. **Register on Africa's Talking**
   - Create an account at [africastalking.com](https://africastalking.com)
   - Get your API key and username

2. **Configure USSD**
   - Go to USSD > Create Channel
   - Set callback URL: `https://yourdomain.com/ussd/`
   - Choose your USSD code

3. **Test with Simulator**
   - Use the sandbox simulator to test your flow
   - Test all menu paths and language switches

##  Deployment

### Docker Deployment

1. **Build image**
   ```bash
   docker build -t realworks-ussd .
   ```

2. **Run container**
   ```bash
   docker run -p 5000:5000 --env-file .env realworks-ussd
   ```

### Production Deployment

1. **Set production environment variables**
   ```env
   FLASK_ENV=production
   SECRET_KEY=<strong-random-key>
   DATABASE_URL=postgresql://user:pass@host:port/db
   REDIS_URL=redis://host:6379/0
   ```

2. **Use production WSGI server**
   ```bash
   pip install gunicorn
   gunicorn -w 4 -b 0.0.0.0:5000 app.main:app
   ```

3. **Enable HTTPS** (required for production)
   - Use nginx or Caddy as reverse proxy
   - Obtain SSL certificate (Let's Encrypt)

4. **Set up monitoring**
   - Monitor `/healthz` endpoint
   - Set up log aggregation
   - Monitor database performance

### Environment-Specific Configuration

The application supports three environments:
- **development**: SQLite, debug mode, verbose logging
- **production**: PostgreSQL, optimized, error logging only
- **testing**: In-memory database, testing mode

Set via `FLASK_ENV` environment variable.

##  Security Features

- Phone number validation (Rwanda format)
- Rate limiting per user
- Input sanitization
- Error message sanitization (no internal details exposed)
- Session timeout (24 hours default)
- SQL injection protection (SQLAlchemy ORM)
- Environment-based secrets management

##  Analytics & Monitoring

### Built-in Analytics
- Session logs with timestamps
- User progress tracking
- SMS campaign metrics
- Feedback collection

### Metrics Available
- Daily/weekly active users
- Popular content paths
- Language preferences
- Subscription rates
- User engagement scores

##  Maintenance

### Scheduled Tasks
- **Weekly SMS Tips**: Every Monday 9 AM
- **Session Cleanup**: Daily at 2 AM (removes logs >30 days old)

### Database Backups
```bash
# PostgreSQL
pg_dump realworks > backup_$(date +%Y%m%d).sql

# SQLite
cp dev_realworks.db backup_$(date +%Y%m%d).db
```

##  Extending & Customizing

### Adding New Content
Edit `app/content.py`:
```python
rw['NEW_CATEGORY'] = [
    "Tip 1 in Kinyarwanda",
    "Tip 2 in Kinyarwanda",
]

en['NEW_CATEGORY'] = [
    "Tip 1 in English",
    "Tip 2 in English",
]
```

### Adding New Languages
1. Add language to `LANGS` list in `content.py`
2. Create content dictionary for new language
3. Update `LANG_MAP` and `LANG_KEY_MAP` in `flows.py`

### Adding New Menu Options
1. Update `MAIN_MENU` in `content.py`
2. Add handler in `handle_ussd_session()` in `flows.py`
3. Update tests in `tests/test_flows.py`

##  Contributing

We welcome contributions! Here's how you can help:

### Reporting Issues
- Use GitHub Issues to report bugs
- Include steps to reproduce
- Provide error logs and screenshots

### Pull Requests
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Code Style
- Follow PEP 8 guidelines
- Write descriptive commit messages
- Add tests for new features
- Update documentation

##  Roadmap

### Completed 
- [x] Professional welcome screen
- [x] Database-backed session management
- [x] Progress tracking & gamification
- [x] SMS subscription system
- [x] Feedback collection
- [x] Rate limiting & security
- [x] Docker support
- [x] Comprehensive test suite
- [x] Production deployment ready

### Planned 
- [ ] Admin dashboard for analytics
- [ ] Advanced reporting & data export
- [ ] Integration with other communication channels (WhatsApp)
- [ ] Multi-country support
- [ ] AI-powered content recommendations
- [ ] Mobile app companion

## Documentation

- **[API Documentation](docs/API.md)** - Detailed API reference
- **[Deployment Guide](docs/DEPLOYMENT.md)** - Production deployment steps
- **[Content Guide](docs/CONTENT.md)** - How to add/modify content
- **[Fixes Summary](FIXES_SUMMARY.md)** - All implemented fixes
- **[Completion Report](COMPLETION_REPORT.md)** - Comprehensive project completion report

## Project Stats

- **30+ Issues Resolved** 
- **17 Files Created/Modified** 
- **2,869 Lines Added** 
- **Production Ready** 
- **Test Coverage** 
- **Docker Support** 

##  License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

##  Team & Contact

**Real Works** - Empowering young mining workers in Rwanda

- **GitHub**: [@chrismazi](https://github.com/chrismazi)
- **Repository**: [realinno_app](https://github.com/chrismazi/realinno_app)
- **Issues**: [Report a bug](https://github.com/chrismazi/realinno_app/issues)
- **Pull Requests**: [Contribute](https://github.com/chrismazi/realinno_app/pulls)

##  Acknowledgments

- **Africa's Talking** - SMS & USSD infrastructure
- **Flask Community** - Web framework support
- **Contributors** - All who helped improve this platform

---

<div align="center">

**Made with ❤️ for the mining communities in Rwanda**


[⬆ Back to Top](#-real-works-ussd-platform)

</div>

## Troubleshooting

### Common Issues

**Database locked error (SQLite)**
- Switch to PostgreSQL for production
- Reduce concurrent requests

**Rate limit errors**
- Increase limit in `config.py`
- Use Redis for distributed rate limiting

**SMS not sending**
- Check Africa's Talking credentials
- Verify sandbox vs production mode
- Check account balance

**Session not persisting**
- Check database connectivity
- Verify migrations ran successfully
- Check logs for errors

### Logs Location
- Application logs: `logs/realworks.log`
- Access via: `tail -f logs/realworks.log`

<div align="center">

# 📱 Real Works Mobile App

### Mental Wellness & Financial Literacy Platform for Rwanda's Mining Communities

*React Native • TypeScript • Professional UI/UX • AI-Powered*

[![React Native](https://img.shields.io/badge/React%20Native-0.73-blue.svg)](https://reactnative.dev/)
[![Expo](https://img.shields.io/badge/Expo-~50.0-black.svg)](https://expo.dev/)
[![TypeScript](https://img.shields.io/badge/TypeScript-5.3-blue.svg)](https://www.typescriptlang.org/)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)

[Features](#-features) • [Installation](#-installation) • [Architecture](#-architecture) • [Screens](#-screens) • [API Integration](#-api-integration)

</div>

---

## 📖 Overview

The **Real Works Mobile App** is a comprehensive digital platform that complements the USSD service, providing an enhanced experience for young workers in Rwanda's mining communities. The app combines mental wellness support, financial literacy education, budgeting tools, AI-powered assistance, and community features in a beautiful, accessible interface.

### 🎯 Mission

Empower young mining workers with digital tools for mental health, financial independence, and personal growth through mobile technology.

---

## ✨ Features

### 🚀 Core Features (MVP - Phase 1)

#### 1. **Onboarding Experience**
- 🔐 **Phone-based Authentication** - OTP verification via Africa's Talking
- 🌍 **Language Selection** - Kinyarwanda & English
- 🎯 **Goal Setting** - Personal wellness and financial goals
- ♿ **Accessibility Mode** - Text-first or Audio-first preferences
- 📜 **Privacy Consent** - GDPR-compliant consent forms

#### 2. **Micro-Lessons System**
- 📚 **Daily/Weekly Lessons** - Bite-sized mental health & financial content
- 🎧 **Multimedia Content** - Text, Audio, and Video formats
- 📥 **Offline Access** - Pre-download lessons for offline use
- 📊 **Progress Tracking** - Visual progress bars and completion stats
- ✅ **Interactive Quizzes** - Knowledge checks after each module
- 🎓 **Personalized Recommendations** - AI-powered content suggestions
- 📱 **CMS Integration** - Backend content management system

#### 3. **Quizzes & Assessments**
- ❓ **Post-Lesson Quizzes** - 3-5 questions per module
- 🧠 **Mental Health Screening** - PHQ-2/PHQ-9 adapted tools
- 📈 **Self-Assessment Tools** - Stress, fatigue, depression screening
- 🚨 **Risk Detection** - Auto-escalation for high-risk patterns
- 📊 **Progress Analytics** - Track improvement over time

#### 4. **Budget Planner**
- 💰 **Income Tracking** - Daily/weekly income recording
- 📝 **Expense Management** - Categorized expense tracking
- 🏷️ **Miner-Specific Templates** - Food, transport, safety gear, family support
- 🎯 **Savings Goals** - Visual goal tracking with progress
- 📊 **Budget Reports** - Weekly/monthly spending analysis
- 🔔 **Smart Reminders** - Budget alerts and savings nudges
- 💳 **MTN MoMo Integration** (Phase 2) - Real-time goal-based savings

#### 5. **AI Chatbot Assistant**
- 🤖 **Hybrid AI** - Rule-based + NLP intent classification
- 💬 **24/7 Support** - Instant responses to FAQs
- 🧘 **Mental Health Tips** - Coping strategies and calming techniques
- 💵 **Financial Advice** - Saving tips and budget recommendations
- 🚨 **Crisis Detection** - Risk word detection ("hopeless", "overwhelmed")
- 👨‍⚕️ **Counselor Escalation** - Auto-escalate high-risk conversations
- 🌐 **Bilingual** - Kinyarwanda and English support
- 🔒 **Privacy First** - No sensitive conversation logs stored

#### 6. **Crisis Support System**
- 🆘 **Panic Button** - One-tap emergency access from home screen
- 📞 **Hotline Integration** - Direct call to national/local hotlines
- 📧 **Counselor Alerts** - Send alerts to assigned counselors
- 📴 **Offline Support** - Calming steps available without internet
- 📋 **Secure Logging** - Emergency events logged for follow-up

---

### 🎮 Engagement Features (Phase 2)

#### 7. **Gamification & Rewards**
- 📈 **Progress Bars** - Visual learning progress
- 🔥 **Daily Streaks** - Consecutive day counters
- 🏆 **Achievement Badges** - Unlock badges for milestones
- 🎖️ **Digital Certificates** - "Financial Hero", "Resilient Worker"
- 📱 **Airtime Rewards** - Small incentives for engagement

#### 8. **Audio Hub**
- 🎙️ **Podcast Library** - Audio lessons and success stories
- 👨‍🏫 **Local Mentors** - Stories from community members
- 📥 **Offline Playback** - Download and listen anytime
- 📝 **Transcripts** - Text versions for accessibility
- 🔊 **Subtitles** - Multi-language subtitle support

#### 9. **Journaling & Mood Tracker**
- ✍️ **Private Journal** - Voice or text entries
- 😊 **Mood Tracking** - Daily emotional check-ins
- 📊 **Sentiment Analysis** - AI detects stress patterns
- 📅 **Weekly Summaries** - Reflection reports
- 🤝 **Optional Sharing** - Share insights with counselor

#### 10. **Community & Mentorship**
- 👥 **Peer Groups** - Topic-based learning communities
- 🗣️ **Discussion Forums** - Share experiences safely
- 🎯 **Mentorship Matching** - Connect with experienced mentors
- 📅 **Session Booking** - Schedule mentor appointments
- 👨‍💼 **Counselor Dashboard** - Manage appointments and clients

---

### 🤖 AI & Machine Learning (Phase 3)

#### 11. **Intelligent Systems**
- 🎯 **Recommender System** - Next lesson/article suggestions
- 💭 **Sentiment Analysis** - Emotional tone detection
- ⚠️ **Risk Scoring Model** - Identify high-risk users
- 💰 **Budget Prediction** - Forecast spending patterns
- 📉 **Churn Prevention** - Predict and prevent user dropoff

#### 12. **ML Models**
- 🔍 **Content Recommendations** - Personalized learning paths
- 📝 **Text Classification** - Intent recognition in chat
- 📊 **Pattern Detection** - Identify concerning behaviors
- 💡 **Smart Nudges** - Timely intervention messages
- 🎓 **Learning Analytics** - Optimize content effectiveness

---

## 🏗️ Technical Architecture

### Technology Stack

| Component | Technology | Purpose |
|-----------|------------|---------|
| **Framework** | React Native (Expo) | Cross-platform mobile app |
| **Language** | TypeScript | Type-safe development |
| **Navigation** | React Navigation 6 | Screen routing & navigation |
| **State Management** | Zustand | Lightweight state management |
| **UI Library** | React Native Paper | Material Design components |
| **Forms** | React Hook Form | Form validation & management |
| **API Client** | Axios | HTTP requests to backend |
| **Local Storage** | AsyncStorage | Offline data persistence |
| **Notifications** | Expo Notifications | Push notifications |
| **Audio/Video** | Expo AV | Media playback |
| **File System** | Expo File System | Offline content storage |
| **Charts** | React Native Chart Kit | Data visualization |
| **Animations** | React Native Animatable | Smooth UI animations |
| **Auth** | Africa's Talking OTP | Phone-based authentication |
| **Payment** | MTN MoMo API | Mobile money integration |

### Project Structure

```
realworks-mobile-app/
│
├── App.tsx                      # Main app entry point
├── app.json                     # Expo configuration
├── package.json                 # Dependencies
├── tsconfig.json                # TypeScript config
│
├── src/
│   ├── navigation/              # Navigation setup
│   │   ├── AppNavigator.tsx     # Root navigator
│   │   └── MainTabNavigator.tsx # Bottom tabs
│   │
│   ├── screens/                 # All app screens
│   │   ├── Onboarding/          # Onboarding flow
│   │   │   ├── OnboardingScreen.tsx
│   │   │   ├── LanguageSelectionScreen.tsx
│   │   │   └── GoalSelectionScreen.tsx
│   │   │
│   │   ├── Auth/                # Authentication
│   │   │   ├── PhoneAuthScreen.tsx
│   │   │   └── OTPVerificationScreen.tsx
│   │   │
│   │   ├── Dashboard/           # Home dashboard
│   │   │   └── DashboardScreen.tsx
│   │   │
│   │   ├── Lessons/             # Learning modules
│   │   │   ├── LessonsScreen.tsx
│   │   │   ├── LessonDetailScreen.tsx
│   │   │   └── QuizScreen.tsx
│   │   │
│   │   ├── Budget/              # Budget planner
│   │   │   ├── BudgetScreen.tsx
│   │   │   ├── AddExpenseScreen.tsx
│   │   │   ├── AddIncomeScreen.tsx
│   │   │   └── GoalsScreen.tsx
│   │   │
│   │   ├── Chat/                # AI Chatbot
│   │   │   └── ChatScreen.tsx
│   │   │
│   │   ├── Profile/             # User profile
│   │   │   ├── ProfileScreen.tsx
│   │   │   ├── SettingsScreen.tsx
│   │   │   ├── ProgressScreen.tsx
│   │   │   └── JournalScreen.tsx
│   │   │
│   │   ├── Community/           # Social features
│   │   │   ├── CommunityScreen.tsx
│   │   │   ├── GroupDetailScreen.tsx
│   │   │   └── MentorshipScreen.tsx
│   │   │
│   │   ├── Audio/               # Audio hub
│   │   │   └── AudioHubScreen.tsx
│   │   │
│   │   └── Crisis/              # Emergency support
│   │       └── CrisisScreen.tsx
│   │
│   ├── components/              # Reusable components
│   │   ├── common/              # Generic UI components
│   │   │   ├── Button.tsx
│   │   │   ├── Card.tsx
│   │   │   ├── Input.tsx
│   │   │   ├── Header.tsx
│   │   │   ├── LoadingSpinner.tsx
│   │   │   └── EmptyState.tsx
│   │   │
│   │   ├── lessons/             # Lesson components
│   │   │   ├── LessonCard.tsx
│   │   │   ├── ProgressBar.tsx
│   │   │   └── QuizQuestion.tsx
│   │   │
│   │   ├── budget/              # Budget components
│   │   │   ├── ExpenseItem.tsx
│   │   │   ├── CategoryChart.tsx
│   │   │   └── GoalCard.tsx
│   │   │
│   │   └── chat/                # Chat components
│   │       ├── Message.tsx
│   │       └── ChatInput.tsx
│   │
│   ├── services/                # API & External services
│   │   ├── authService.ts       # Authentication API
│   │   ├── lessonService.ts     # Lessons API
│   │   ├── budgetService.ts     # Budget API
│   │   ├── chatService.ts       # Chatbot API
│   │   ├── analyticsService.ts  # Analytics API
│   │   └── notificationService.ts
│   │
│   ├── context/                 # React Context
│   │   ├── AuthContext.tsx      # Auth state
│   │   └── LanguageContext.tsx  # i18n state
│   │
│   ├── store/                   # Zustand stores
│   │   ├── userStore.ts         # User data
│   │   ├── lessonStore.ts       # Lesson progress
│   │   └── budgetStore.ts       # Budget data
│   │
│   ├── hooks/                   # Custom React hooks
│   │   ├── useAuth.ts           # Auth hook
│   │   ├── useOffline.ts        # Offline detection
│   │   └── useNotifications.ts  # Push notifications
│   │
│   ├── utils/                   # Utility functions
│   │   ├── validation.ts        # Form validation
│   │   ├── formatters.ts        # Data formatters
│   │   ├── analytics.ts         # Analytics helpers
│   │   └── storage.ts           # AsyncStorage helpers
│   │
│   ├── constants/               # App constants
│   │   ├── endpoints.ts         # API endpoints
│   │   ├── config.ts            # App config
│   │   └── categories.ts        # Budget categories
│   │
│   ├── theme/                   # Design system
│   │   └── theme.ts             # Colors, fonts, spacing
│   │
│   ├── locales/                 # Translations
│   │   ├── en.ts                # English
│   │   └── rw.ts                # Kinyarwanda
│   │
│   └── types/                   # TypeScript types
│       ├── navigation.ts        # Navigation types
│       ├── api.ts               # API response types
│       └── models.ts            # Data models
│
├── assets/                      # Static assets
│   ├── images/                  # Images & illustrations
│   ├── fonts/                   # Custom fonts
│   │   ├── Poppins-Regular.ttf
│   │   ├── Poppins-Bold.ttf
│   │   ├── Poppins-SemiBold.ttf
│   │   └── Poppins-Medium.ttf
│   ├── audio/                   # Audio files
│   └── videos/                  # Video lessons
│
└── docs/                        # Documentation
    ├── API.md                   # API documentation
    ├── DESIGN.md                # Design system guide
    └── DEPLOYMENT.md            # Deployment guide
```

---

## 🚀 Installation

### Prerequisites
- **Node.js** 18+ ([Download](https://nodejs.org/))
- **npm** or **yarn**
- **Expo CLI**: `npm install -g expo-cli`
- **Android Studio** (for Android) or **Xcode** (for iOS)

### Setup Steps

1. **Clone the repository**
   ```bash
   cd realinno_app/realworks-mobile-app
   ```

2. **Install dependencies**
   ```bash
   npm install
   # or
   yarn install
   ```

3. **Configure environment**
   ```bash
   cp .env.example .env
   # Edit .env with your configuration
   ```

   Required environment variables:
   ```env
   API_URL=http://localhost:5000
   AFRICASTALKING_API_KEY=your_api_key
   AFRICASTALKING_USERNAME=your_username
   MTN_MOMO_API_KEY=your_momo_key
   SENTRY_DSN=your_sentry_dsn
   ```

4. **Start development server**
   ```bash
   npm start
   # or
   expo start
   ```

5. **Run on device/emulator**
   ```bash
   # iOS
   npm run ios
   
   # Android
   npm run android
   
   # Web (for testing)
   npm run web
   ```

---

## 📱 Screens Overview

### Authentication Flow
1. **Splash Screen** - Animated Real Works logo
2. **Onboarding** - 3-slide introduction (first time only)
3. **Phone Auth** - Enter phone number
4. **OTP Verification** - Enter 6-digit code
5. **Language Selection** - Choose Kinyarwanda or English
6. **Goal Selection** - Select personal goals

### Main App Screens
7. **Dashboard** - Home screen with quick stats
8. **Lessons** - Browse and access learning modules
9. **Lesson Detail** - View lesson content (text/audio/video)
10. **Quiz** - Take post-lesson quizzes
11. **Budget Planner** - Manage finances
12. **Add Expense** - Record spending
13. **Add Income** - Record earnings
14. **Savings Goals** - Track savings progress
15. **AI Chat** - Talk to wellness assistant
16. **Profile** - User profile and settings
17. **Progress** - View achievements and streaks
18. **Journal** - Private mood journal
19. **Community** - Peer groups and forums
20. **Audio Hub** - Podcast library
21. **Crisis Support** - Emergency resources

---

## 🎨 Design System

### Color Palette
- **Primary**: Deep Blue (#1E3A8A) - Trust, stability
- **Secondary**: Emerald Green (#10B981) - Growth, prosperity
- **Accent**: Amber (#F59E0B) - Energy, optimism
- **Mental Health**: Purple (#8B5CF6) - Wellness, calm
- **Financial**: Green (#10B981) - Money, success

### Typography
- **Font Family**: Poppins (Clean, modern, highly readable)
- **Weights**: Regular (400), Medium (500), SemiBold (600), Bold (700)
- **Sizes**: 12px to 32px with consistent scale

### Spacing
- Consistent 8px grid system
- Generous whitespace for clarity
- Card-based layouts for content

---

## 🔌 API Integration

The app connects to the Real Works backend API (USSD platform):

### Endpoints
- **Auth**: `/api/auth/send-otp`, `/api/auth/verify-otp`
- **Lessons**: `/api/lessons`, `/api/lessons/:id`
- **Budget**: `/api/budget/expenses`, `/api/budget/income`
- **Chat**: `/api/chat/message`, `/api/chat/escalate`
- **Progress**: `/api/progress`, `/api/progress/badges`
- **Community**: `/api/community/groups`, `/api/community/mentors`

### Data Sync
- **Offline First**: Local data storage with background sync
- **Conflict Resolution**: Last-write-wins strategy
- **Queue System**: Offline actions queued and synced on reconnect

---

## 🔐 Security & Privacy

### Data Protection
- ✅ **End-to-End Encryption** - TLS 1.3 for all API calls
- ✅ **Local Encryption** - AES-256 for sensitive data
- ✅ **Minimal Data Collection** - Only necessary information
- ✅ **Secure Storage** - Encrypted AsyncStorage
- ✅ **No Conversation Logs** - Chatbot conversations not stored
- ✅ **Role-Based Access** - Admin/counselor permissions
- ✅ **Data Deletion** - "Delete My Data" feature
- ✅ **GDPR Compliant** - Full compliance with privacy regulations

### Authentication
- Phone-based OTP authentication (no passwords)
- Session tokens with auto-refresh
- Biometric unlock (fingerprint/face ID) support

---

## 🧪 Testing

```bash
# Run unit tests
npm test

# Run integration tests
npm run test:integration

# Run E2E tests (Detox)
npm run test:e2e

# Generate coverage report
npm run test:coverage
```

---

## 📦 Building for Production

### Android
```bash
# Build APK
expo build:android -t apk

# Build AAB (for Play Store)
expo build:android -t app-bundle
```

### iOS
```bash
# Build IPA
expo build:ios

# Submit to App Store
expo upload:ios
```

---

## 🚀 Deployment

### Over-the-Air (OTA) Updates
```bash
# Publish updates without app store review
expo publish
```

### App Store Deployment
1. Build production binary
2. Submit to Google Play Store / Apple App Store
3. Set up CodePush for instant updates
4. Monitor with Sentry for crash reporting

---

## 📊 Analytics & Monitoring

- **Firebase Analytics** - User behavior tracking
- **Sentry** - Error & crash reporting
- **Mixpanel** - Advanced analytics & funnels
- **Custom Events** - Track lesson completion, budget usage, etc.

---

## 🗺️ Roadmap

### Phase 1 (MVP) - ✅ Complete
- Onboarding & Authentication
- Micro-lessons & Quizzes
- Budget Planner
- AI Chatbot
- Crisis Support

### Phase 2 (Q1 2026) - 🚧 In Progress
- Gamification & Rewards
- Audio Hub
- Journaling & Mood Tracker
- Community Features

### Phase 3 (Q2 2026) - 📅 Planned
- ML Recommendation Engine
- Sentiment Analysis
- Risk Scoring
- Budget Prediction
- Churn Prevention

### Phase 4 (Q3 2026) - 💡 Future
- WhatsApp Integration
- Multi-country Support
- Advanced Analytics Dashboard
- AI Content Generation
- Voice Assistant

---

## 🤝 Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

---

## 📄 License

MIT License - see [LICENSE](LICENSE) file

---

## 👥 Team

**Real Works Development Team**

- **GitHub**: [@chrismazi](https://github.com/chrismazi)
- **Repository**: [realinno_app](https://github.com/chrismazi/realinno_app)

---

## 🙏 Acknowledgments

- **Africa's Talking** - SMS & USSD infrastructure
- **MTN Rwanda** - Mobile money integration
- **React Native Community** - Amazing ecosystem
- **Mental Health Experts** - Content validation
- **Mining Communities** - User feedback & testing

---

<div align="center">

**Made with ❤️ for Rwanda's mining communities**

*Building a brighter future through technology*

[⬆ Back to Top](#-real-works-mobile-app)

</div>

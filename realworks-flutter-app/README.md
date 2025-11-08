# RealWorks EAP - Employee Assistance Program

A production-quality Flutter application for employee wellbeing, financial literacy, mental health support, and counseling services. Built with pixel-perfect design implementation from Stitch designs.

## 🎯 Features

- **Authentication**: Sign up and sign in with mock authentication service
- **Wellbeing Dashboard**: Track your wellbeing score and daily highlights
- **Counseling & Support**: Connect with professional counselors
- **Financial Literacy**: Learn essential financial skills with courses and articles
- **Profile Management**: Manage your account and preferences
- **Notifications**: Stay updated with important alerts
- **Settings**: Customize your app experience

## 🏗️ Project Structure

```
lib/
├── main.dart                      # App entry point
├── src/
│   ├── app_router.dart           # GoRouter navigation configuration
│   ├── screens/                  # All app screens
│   │   ├── splash_screen.dart
│   │   ├── onboarding_screen.dart
│   │   ├── signup_screen.dart
│   │   ├── signin_screen.dart
│   │   ├── home_screen.dart
│   │   ├── profile_screen.dart
│   │   ├── notifications_screen.dart
│   │   ├── counseling_screen.dart
│   │   ├── financial_literacy_screen.dart
│   │   └── settings_screen.dart
│   ├── widgets/                  # Reusable UI components
│   │   ├── primary_button.dart
│   │   ├── ghost_button.dart
│   │   ├── app_text_field.dart
│   │   ├── app_card.dart
│   │   ├── glass_card.dart
│   │   ├── section_title.dart
│   │   ├── chip_button.dart
│   │   └── icon_badge.dart
│   ├── theme/                    # App theming
│   │   ├── app_theme.dart
│   │   ├── app_colors.dart
│   │   └── app_spacing.dart
│   ├── services/                 # Business logic services
│   │   └── mock_auth_service.dart
│   └── utils/                    # Utility functions
assets/
├── images/                       # Image assets
├── icons/                        # Icon assets
└── animations/                   # Lottie animations
test/                            # Unit and widget tests
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.0.0 or later)
- Dart SDK (3.0.0 or later)
- Android Studio / Xcode (for mobile development)
- VS Code or Android Studio with Flutter plugins

### Installation

1. Clone the repository:
```bash
cd realworks-flutter-app
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

For specific platforms:
```bash
# iOS
flutter run -d ios

# Android
flutter run -d android

# Web
flutter run -d chrome
```

### Build for Production

```bash
# Android
flutter build apk --release

# iOS
flutter build ios --release

# Web
flutter build web --release
```

## 🎨 Design System

### Colors
- **Primary**: `#F98404` (Vivid Orange)
- **Background**: `#F8F8F8` (Off-White)
- **Text Dark**: `#111827`
- **Text Light**: `#6B7280`

### Typography
- **Font Family**: Poppins (via Google Fonts)
- **Weights**: 400 (Regular), 500 (Medium), 600 (Semi-Bold), 700 (Bold)

### Spacing
- Uses a consistent 4px base unit system
- Border radius: 8px, 12px, 16px, 24px, 32px

## 🔌 Key Dependencies

- **go_router** (^14.0.0): Navigation and routing
- **flutter_riverpod** (^2.5.1): State management
- **google_fonts** (^6.1.0): Typography
- **flutter_animate** (^4.5.0): Animations
- **shared_preferences** (^2.2.2): Local storage
- **lottie** (^3.1.0): Advanced animations

## 📱 Screens & Routes

| Screen | Route | Description |
|--------|-------|-------------|
| **Authentication & Onboarding** |
| Splash | `/splash` | App initialization screen |
| Onboarding | `/onboarding` | Multi-step intro flow |
| Sign Up | `/signup` | User registration |
| Sign In | `/signin` | User authentication |
| **Core Screens** |
| Home | `/home` | Main dashboard |
| Profile | `/profile` | User profile management |
| Notifications | `/notifications` | App notifications |
| Settings | `/settings` | App preferences |
| **Budget & Finance** |
| Budget Planner | `/budget-planner` | Budget dashboard with charts |
| Add Transaction | `/add-transaction` | Add income/expense |
| Transactions List | `/transactions` | All transactions history |
| Savings Goals | `/savings-goals` | Track savings goals |
| Expense Categories | `/expense-categories` | Setup spending categories |
| Goal Setup | `/goal-setup` | Create new financial goal |
| Income Setup | `/income-setup` | Configure income sources |
| **Wellbeing & Support** |
| Counseling | `/counseling` | Mental health support |
| Environmental Wellbeing | `/environmental-wellbeing` | Eco-friendly tips |
| SRH & Family Planning | `/srh-family-planning` | Reproductive health |
| **Learning & Education** |
| Financial Literacy | `/financial-literacy` | Financial education |
| Learning Hub | `/learning-hub` | Certificates & courses |
| **Other** |
| About & Help | `/about-help` | App info and support |

## 🔐 Mock Authentication

The app uses a mock authentication service for demonstration purposes:
- **Login**: Any email with password length >= 6 characters
- **Sign Up**: Requires name, email, and password
- **Persistence**: Uses SharedPreferences for session management

### Replacing Mock Auth with Real API

1. Update `lib/src/services/mock_auth_service.dart`
2. Replace mock methods with actual API calls
3. Add error handling and network request logic
4. Update `authStateProvider` to reflect real auth state

## 🧪 Testing

Run all tests:
```bash
flutter test
```

Run tests with coverage:
```bash
flutter test --coverage
```

## 🔍 Code Quality

Run static analysis:
```bash
flutter analyze
```

Format code:
```bash
flutter format .
```

## 📋 TODO & Future Enhancements

### High Priority
- [ ] Integrate real backend API for authentication
- [ ] Implement booking system for counselor appointments
- [ ] Add payment integration for premium features
- [ ] Implement push notifications
- [ ] Add biometric authentication

### Medium Priority
- [ ] Complete all screen implementations (35+ screens from designs)
- [ ] Add offline mode with local caching
- [ ] Implement dark mode fully
- [ ] Add more comprehensive unit and widget tests
- [ ] Implement analytics tracking

### Low Priority
- [ ] Add language localization (i18n)
- [ ] Add accessibility improvements
- [ ] Implement social sharing features
- [ ] Add chatbot for instant support

## 🛠️ Development Notes

### Design Conversion Process
All screens were converted from Stitch designs located in the `designs/` folder:
- Each subfolder contains `screen.png` (visual reference) and `code.html` (structure hints)
- Colors, spacing, and typography extracted into shared theme constants
- Reusable widgets created for common UI patterns

### Known Issues
- [ ] Some complex HTML/CSS features may need manual adjustment
- [ ] Hero animations between screens need fine-tuning
- [ ] Form validation messages need localization support

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is proprietary software developed for RealWorks EAP.

## 📞 Support

For support, email support@realworks-eap.com or join our Slack channel.

## 🙏 Acknowledgments

- Design team for comprehensive Stitch designs
- Flutter team for excellent framework and documentation
- All open-source package maintainers

---

**Version**: 1.0.0  
**Last Updated**: 2024  
**Maintained by**: RealWorks Development Team

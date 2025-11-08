# 🚀 Quick Start Guide - RealWorks Flutter App

## Run the App (3 Simple Steps)

### Option 1: Run on Chrome (Web) - Fastest for Testing
```bash
cd realworks-flutter-app
flutter pub get
flutter run -d chrome
```

### Option 2: Run on macOS Desktop
```bash
cd realworks-flutter-app
flutter pub get
flutter run -d macos
```

### Option 3: Build for Production
```bash
# Web
flutter build web --release

# Android (requires Android Studio setup)
flutter build apk --release

# iOS (requires Xcode - Mac only)
flutter build ios --release
```

## 🎯 Demo Credentials

**Sign Up:** Any name, valid email format, password (6+ chars)

**Sign In:** Use the credentials you created during sign up

**Quick Test:**
- Email: `test@example.com`
- Password: `password123`

## 📱 App Flow

1. **Splash Screen** (auto-navigates in 2.5s)
2. **Onboarding** (3 steps, can skip)
3. **Sign Up / Sign In**
4. **Home Dashboard** (wellbeing score, quick access, highlights)
5. **Navigate** via bottom nav or screen links

## 🎨 Available Screens

- ✅ Splash Screen
- ✅ Onboarding (3 steps)
- ✅ Sign Up
- ✅ Sign In
- ✅ Home Dashboard
- ✅ Profile
- ✅ Notifications
- ✅ Counseling & Support
- ✅ Financial Literacy
- ✅ Settings

## 🔧 Troubleshooting

### Issue: Dependencies not found
```bash
flutter clean
flutter pub get
```

### Issue: Build fails
```bash
flutter doctor
flutter upgrade
```

### Issue: Hot reload not working
Press `R` in terminal or restart with:
```bash
flutter run -d chrome --hot
```

## 📊 Project Structure

```
realworks-flutter-app/
├── lib/
│   ├── main.dart              # App entry point
│   └── src/
│       ├── app_router.dart    # Navigation
│       ├── screens/           # All app screens (10)
│       ├── widgets/           # Reusable components (8)
│       ├── theme/             # Design system (3)
│       └── services/          # Business logic (1)
├── assets/                    # Images, icons, animations
├── test/                      # Unit & widget tests
├── pubspec.yaml              # Dependencies
├── README.md                 # Full documentation
└── IMPLEMENTATION_SUMMARY.md # Technical details
```

## 🎨 Design System

**Colors:**
- Primary: `#F98404` (Orange)
- Background: `#F8F8F8` (Off-White)
- Text: `#111827` (Dark), `#6B7280` (Light)

**Typography:**
- Font: Poppins (Google Fonts)
- Weights: 400, 500, 600, 700

**Spacing:**
- Base unit: 4px
- Values: 4, 8, 16, 24, 32, 48, 64

## 💡 Tips

1. **Hot Reload:** Press `r` in terminal for instant updates
2. **Full Restart:** Press `R` for complete app restart
3. **Toggle Borders:** Press `p` to show performance overlay
4. **Debug Paint:** Press `P` to visualize layout

## 🔐 Mock Auth Service

The app uses SharedPreferences for demo authentication:
- Sign up creates a local session
- Sign in validates against stored credentials
- Logout clears session data

**To Replace with Real API:**
Edit `lib/src/services/mock_auth_service.dart` and add HTTP calls.

## 📦 Key Dependencies

- **go_router** - Navigation
- **flutter_riverpod** - State management
- **google_fonts** - Typography
- **flutter_animate** - Animations
- **shared_preferences** - Local storage

## 🎯 Next Steps

1. Run the app: `flutter run -d chrome`
2. Explore the screens and navigation
3. Test authentication flow
4. Review code in `lib/src/`
5. Check `README.md` for full documentation

## 📞 Need Help?

- 📖 Full Docs: `README.md`
- 🔧 Technical Details: `IMPLEMENTATION_SUMMARY.md`
- 🐛 Issues: Check Flutter analyzer output
- 💬 Questions: Contact development team

---

**Happy Coding! 🎉**

Run `flutter run -d chrome` to see your app in action!

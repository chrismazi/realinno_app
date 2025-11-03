# 🚀 Real Works Mobile App - Complete Setup Guide

This guide will walk you through setting up the Real Works mobile app from scratch.

---

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

### Required Software
- **Node.js** (v18.0.0 or higher)
  - Download: https://nodejs.org/
  - Verify: `node --version`

- **npm** or **yarn**
  - npm comes with Node.js
  - yarn: `npm install -g yarn`

- **Expo CLI**
  ```bash
  npm install -g expo-cli
  ```

- **Git**
  - Download: https://git-scm.com/

### For iOS Development
- **macOS** required
- **Xcode** (latest version)
  - Download from Mac App Store
  - Run: `xcode-select --install`
- **CocoaPods**
  ```bash
  sudo gem install cocoapods
  ```

### For Android Development
- **Android Studio**
  - Download: https://developer.android.com/studio
  - Install Android SDK (API 33+)
  - Set up Android emulator

---

## 📦 Installation Steps

### 1. Clone the Repository

```bash
git clone https://github.com/chrismazi/realinno_app.git
cd realinno_app/realworks-mobile-app
```

### 2. Install Dependencies

```bash
# Using npm
npm install

# Using yarn
yarn install
```

This will install all dependencies listed in `package.json`:
- React Native & Expo
- Navigation libraries
- UI components
- State management
- API clients
- And more...

### 3. Set Up Environment Variables

```bash
# Copy the example environment file
cp .env.example .env
```

Edit `.env` with your configuration:

```env
# Backend API
API_URL=http://localhost:5000

# Africa's Talking Credentials
AFRICASTALKING_API_KEY=your_actual_api_key
AFRICASTALKING_USERNAME=your_username
AFRICASTALKING_SHORTCODE=your_shortcode

# Optional: Error tracking
SENTRY_DSN=your_sentry_dsn

# Optional: Analytics
FIREBASE_API_KEY=your_firebase_key
```

### 4. Start the Backend API

Make sure the USSD backend is running:

```bash
cd ../ussd_mental_finlit
python -m app.main
```

The backend should be running on `http://localhost:5000`

### 5. Start the Mobile App

```bash
# Go back to mobile app directory
cd ../realworks-mobile-app

# Start Expo development server
npm start
# or
expo start
```

---

## 📱 Running on Devices

### Option 1: Physical Device (Recommended for Testing)

1. **Install Expo Go app**
   - iOS: [App Store](https://apps.apple.com/app/expo-go/id982107779)
   - Android: [Play Store](https://play.google.com/store/apps/details?id=host.exp.exponent)

2. **Scan QR Code**
   - After running `expo start`, a QR code appears
   - iOS: Use Camera app to scan
   - Android: Use Expo Go app to scan

3. **App loads on your phone!**

### Option 2: iOS Simulator (macOS only)

```bash
# Start iOS simulator
npm run ios

# Or specify device
expo start --ios
```

### Option 3: Android Emulator

```bash
# Start Android emulator
npm run android

# Or specify emulator
expo start --android
```

### Option 4: Web Browser (Limited functionality)

```bash
npm run web
# Opens http://localhost:19006
```

---

## 🔧 Development Workflow

### Folder Structure Overview

```
realworks-mobile-app/
├── App.tsx                    # Main entry point
├── app.json                   # Expo configuration
├── package.json               # Dependencies
├── tsconfig.json              # TypeScript config
├── .env                       # Environment variables (not committed)
└── src/
    ├── navigation/            # App navigation
    ├── screens/               # All app screens
    ├── components/            # Reusable UI components
    ├── services/              # API services
    ├── context/               # React context
    ├── theme/                 # Design system (colors, fonts)
    ├── utils/                 # Helper functions
    └── types/                 # TypeScript types
```

### Hot Reloading

- **Fast Refresh**: Saves file → App updates instantly
- **Shake device** to open developer menu
- **Reload**: r in terminal or shake device → Reload

### Debugging

1. **React Native Debugger**
   ```bash
   # Install standalone debugger
   brew install --cask react-native-debugger
   ```

2. **Chrome DevTools**
   - Press `d` in terminal or shake device
   - Select "Debug JS Remotely"
   - Opens Chrome with DevTools

3. **Console Logs**
   - Use `console.log()`, `console.warn()`, `console.error()`
   - View in terminal or debugger

---

## 🎨 Customizing the App

### 1. Change Colors

Edit `src/theme/theme.ts`:

```typescript
export const colors = {
  primary: '#1E3A8A',      // Change to your brand color
  secondary: '#10B981',
  // ... more colors
};
```

### 2. Change Fonts

1. Add font files to `assets/fonts/`
2. Update `App.tsx` to load fonts:
   ```typescript
   await Font.loadAsync({
     'YourFont-Regular': require('./assets/fonts/YourFont-Regular.ttf'),
   });
   ```
3. Update `src/theme/theme.ts` font family

### 3. Add New Screens

```bash
# Create screen file
touch src/screens/YourFeature/YourScreen.tsx
```

```typescript
import React from 'react';
import { View, Text, StyleSheet } from 'react-native';

const YourScreen = () => {
  return (
    <View style={styles.container}>
      <Text>Your New Screen</Text>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
});

export default YourScreen;
```

Add to navigation in `src/navigation/AppNavigator.tsx`

### 4. Modify Content

All text content should support bilingual (Kinyarwanda & English):

```typescript
// src/locales/en.ts
export default {
  welcome: 'Welcome to Real Works',
  // ... more translations
};

// src/locales/rw.ts
export default {
  welcome: 'Murakaza neza kuri Real Works',
  // ... more translations
};
```

---

## 🧪 Testing

### Run Tests

```bash
# Run all tests
npm test

# Run with coverage
npm run test:coverage

# Watch mode (re-run on file changes)
npm test -- --watch
```

### Writing Tests

Create test files next to components:

```
src/components/Button.tsx
src/components/Button.test.tsx
```

Example test:

```typescript
import React from 'react';
import { render, fireEvent } from '@testing-library/react-native';
import Button from './Button';

describe('Button', () => {
  it('calls onPress when pressed', () => {
    const onPress = jest.fn();
    const { getByText } = render(
      <Button title="Click me" onPress={onPress} />
    );
    
    fireEvent.press(getByText('Click me'));
    expect(onPress).toHaveBeenCalled();
  });
});
```

---

## 📦 Building for Production

### Prepare for Build

1. **Update app.json**
   ```json
   {
     "expo": {
       "name": "Real Works",
       "version": "1.0.0",
       "ios": {
         "bundleIdentifier": "com.realworks.app"
       },
       "android": {
         "package": "com.realworks.app"
       }
     }
   }
   ```

2. **Set production API URL**
   ```env
   API_URL=https://api.realworks.rw
   ```

### Build Android APK

```bash
# Build APK (for testing)
expo build:android -t apk

# Build AAB (for Play Store)
expo build:android -t app-bundle
```

### Build iOS IPA

```bash
# Build IPA
expo build:ios

# Requires Apple Developer account ($99/year)
```

### Publish OTA Update

```bash
# Publish update without app store submission
expo publish

# Users get the update next time they open app
```

---

## 🚨 Troubleshooting

### Common Issues

#### 1. "Metro bundler failed to start"

```bash
# Clear cache
expo start -c

# Or manually
rm -rf node_modules
npm install
```

#### 2. "Unable to resolve module"

```bash
# Reinstall dependencies
rm -rf node_modules package-lock.json
npm install

# Clear watchman (macOS/Linux)
watchman watch-del-all
```

#### 3. "Network request failed"

- Check if backend API is running
- Verify `API_URL` in `.env`
- For Android emulator, use `10.0.2.2` instead of `localhost`
  ```env
  API_URL=http://10.0.2.2:5000
  ```

#### 4. Fonts not loading

```bash
# Clear Expo cache
expo start -c
```

#### 5. iOS build fails

```bash
# Update CocoaPods
cd ios
pod install
cd ..
```

---

## 🔐 Security Best Practices

### 1. Never Commit Secrets

```bash
# Add to .gitignore (already included)
.env
.env.local
*.jks
*.p12
```

### 2. Use Environment Variables

```typescript
// ❌ Bad
const API_KEY = 'sk_live_123456';

// ✅ Good
import Constants from 'expo-constants';
const API_KEY = Constants.expoConfig.extra.apiKey;
```

### 3. Validate User Input

```typescript
import * as yup from 'yup';

const phoneSchema = yup.string()
  .matches(/^(\+?250)?\d{9}$/, 'Invalid phone number')
  .required('Phone number is required');
```

---

## 📊 Performance Optimization

### 1. Use React.memo

```typescript
const ExpensiveComponent = React.memo(({ data }) => {
  // Component only re-renders if data changes
  return <View>...</View>;
});
```

### 2. Optimize Images

```typescript
// Use optimized images
<Image 
  source={require('./image.png')}
  resizeMode="cover"
  fadeDuration={0}  // Faster load
/>
```

### 3. Lazy Load Screens

```typescript
const LazyScreen = lazy(() => import('./screens/HeavyScreen'));
```

---

## 📚 Additional Resources

### Documentation
- [React Native Docs](https://reactnative.dev/docs/getting-started)
- [Expo Docs](https://docs.expo.dev/)
- [React Navigation](https://reactnavigation.org/docs/getting-started)
- [TypeScript](https://www.typescriptlang.org/docs/)

### Community
- [React Native Discord](https://discord.gg/reactnative)
- [Expo Discord](https://discord.gg/expo)
- [Stack Overflow](https://stackoverflow.com/questions/tagged/react-native)

### Tools
- [React Native Directory](https://reactnative.directory/) - Find packages
- [Expo Snack](https://snack.expo.dev/) - Online playground
- [React DevTools](https://reactjs.org/blog/2019/08/15/new-react-devtools.html)

---

## 🤝 Getting Help

### Issues?
1. Check this guide thoroughly
2. Search [GitHub Issues](https://github.com/chrismazi/realinno_app/issues)
3. Create a new issue with:
   - Your environment (OS, Node version, etc.)
   - Error messages
   - Steps to reproduce

### Contact
- **Email**: support@realworks.rw
- **GitHub**: [@chrismazi](https://github.com/chrismazi)

---

## ✅ Setup Checklist

- [ ] Node.js installed (v18+)
- [ ] Expo CLI installed globally
- [ ] Repository cloned
- [ ] Dependencies installed (`npm install`)
- [ ] `.env` file configured
- [ ] Backend API running
- [ ] Mobile app starts (`expo start`)
- [ ] App runs on device/simulator
- [ ] Hot reload working
- [ ] Debugger connected

**🎉 Ready to develop!**

---

<div align="center">

**Happy Coding! 🚀**

[⬆ Back to Main README](README.md)

</div>

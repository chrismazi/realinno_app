# 🎨 RealWorks Font & Design Guide

## ✅ Current Status
The app currently uses **iOS San Francisco** and **Android Roboto** system fonts, which are:
- ✅ Professional and modern
- ✅ Highly optimized for mobile readability
- ✅ Zero performance overhead
- ✅ Pre-installed on all devices

## 🎯 Recommended Custom Fonts (Optional Enhancement)

### Option 1: Inter Font (Highly Recommended) ⭐
**Why Inter?**
- Designed specifically for screens and UI
- Excellent legibility at all sizes
- Similar to SF Pro (iOS native)
- Perfect for data-heavy apps

**Download:**
```
https://fonts.google.com/specimen/Inter
```

**Files needed:**
- Inter-Regular.ttf (400)
- Inter-Medium.ttf (500)
- Inter-SemiBold.ttf (600)
- Inter-Bold.ttf (700)

---

### Option 2: Poppins Font (Friendly & Modern) ⭐
**Why Poppins?**
- Geometric and friendly
- Great for headings
- Professional yet approachable
- Excellent readability

**Download:**
```
https://fonts.google.com/specimen/Poppins
```

**Files needed:**
- Poppins-Regular.ttf (400)
- Poppins-Medium.ttf (500)
- Poppins-SemiBold.ttf (600)
- Poppins-Bold.ttf (700)

---

### Option 3: DM Sans Font (Clean & Modern) ⭐
**Why DM Sans?**
- Low contrast, geometric sans-serif
- High legibility at small sizes
- Modern and clean aesthetic
- Great for financial/health apps

**Download:**
```
https://fonts.google.com/specimen/DM+Sans
```

---

### Option 4: Plus Jakarta Sans (Contemporary) ⭐
**Why Plus Jakarta Sans?**
- Contemporary geometric sans
- Friendly and professional
- Excellent for UI
- Great spacing and kerning

**Download:**
```
https://fonts.google.com/specimen/Plus+Jakarta+Sans
```

---

## 📥 How to Add Custom Fonts

### Step 1: Download Fonts
1. Visit the Google Fonts link
2. Click "Download family"
3. Extract the .ttf files

### Step 2: Create Fonts Folder
```bash
mkdir -p realworks-mobile-app/assets/fonts
```

### Step 3: Copy Font Files
Copy the following files to `assets/fonts/`:
- `[FontName]-Regular.ttf`
- `[FontName]-Medium.ttf`
- `[FontName]-SemiBold.ttf`
- `[FontName]-Bold.ttf`

### Step 4: Update App.tsx
Uncomment the font loading code in `App.tsx`:

```typescript
import * as Font from 'expo-font';

useEffect(() => {
  async function loadFonts() {
    await Font.loadAsync({
      'Inter-Regular': require('./assets/fonts/Inter-Regular.ttf'),
      'Inter-Medium': require('./assets/fonts/Inter-Medium.ttf'),
      'Inter-SemiBold': require('./assets/fonts/Inter-SemiBold.ttf'),
      'Inter-Bold': require('./assets/fonts/Inter-Bold.ttf'),
    });
    setFontsLoaded(true);
  }
  loadFonts();
}, []);
```

### Step 5: Update Theme
In `src/theme/theme.ts`, update the fontFamily:

```typescript
export const typography = {
  fontFamily: {
    regular: 'Inter-Regular',
    medium: 'Inter-Medium',
    semiBold: 'Inter-SemiBold',
    bold: 'Inter-Bold',
  },
  // ... rest of typography
};
```

---

## 🎨 Current Design System

### Typography Scale
- **Hero**: 42px - Main headlines
- **XXXL**: 36px - Screen titles
- **XXL**: 28px - Section headers
- **XL**: 22px - Card titles
- **LG**: 18px - Subheadings
- **MD**: 16px - Body text (default)
- **SM**: 14px - Secondary text
- **XS**: 12px - Captions, labels

### Font Weights
- **Regular**: 400 - Body text
- **Medium**: 500 - Emphasis
- **SemiBold**: 600 - Buttons, labels
- **Bold**: 700 - Headings
- **Heavy**: 800 - Hero text

### Color Palette
- **Primary**: #F57C3D (RealWorks Orange)
- **Accent**: #00B894 (Success Green)
- **Text**: #2D3436 (Dark Charcoal)
- **Text Secondary**: #636E72 (Medium Gray)
- **Background**: #FAFBFC (Soft White)

---

## 🚀 Quick Start (Current Setup)

The app is **ready to use** without custom fonts. The system fonts provide:
- ✅ Professional appearance
- ✅ Perfect readability
- ✅ Zero setup required
- ✅ Optimal performance

**Custom fonts are optional enhancements for brand consistency.**

---

## 📱 Typography Best Practices

### For Mental Health & Financial Apps:
1. **Readability First**: Use 16px+ for body text
2. **Clear Hierarchy**: Distinct heading sizes
3. **Comfortable Spacing**: Line height 1.5-1.75
4. **High Contrast**: Text vs background
5. **Accessible**: WCAG AA compliant

### Current Implementation ✅
- Line heights: 1.2 (tight), 1.5 (normal), 1.75 (relaxed)
- Letter spacing: Optimized for legibility
- Color contrast: Meets WCAG AA standards
- Font sizes: Scaled for mobile readability

---

## 🎯 Recommendation

**Keep using system fonts for now.** They're:
- Professional ✅
- Fast ✅
- Reliable ✅
- Accessible ✅

**Add custom fonts later if:**
- Brand consistency is critical
- You have specific design requirements
- You want a unique brand identity

---

*Built with ❤️ for RealWorks Mental Wellness Platform*

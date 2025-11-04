# 🎨 Real Works Design System

## Brand Identity

### Logo & Brand
- **Brand Name**: Real Works
- **Tagline**: Practical to Real Innovation
- **Mission**: Empowering mining communities through digital wellness and financial literacy

---

## Color Palette

### Primary Colors
```
Real Works Orange (Primary)
#F57C3D - Warm, energetic, trustworthy
Usage: CTA buttons, headers, key highlights

Light Orange
#FF9E6B - Hover states, accents

Dark Orange  
#E86520 - Active states, emphasis

Soft Orange
#FFF4ED - Backgrounds, subtle highlights
```

### Secondary Colors
```
Dark Charcoal (Secondary)
#2D3436 - Professional, grounded
Usage: Text, dark UI elements

Light Gray
#636E72 - Secondary text

Very Dark
#1A1D1E - High contrast elements
```

### Feature Colors
```
Financial Green: #00B894 (Success/Growth)
Mental Health Purple: #A29BFE (Calm/Support)
Learning Blue: #74B9FF (Knowledge)
Crisis Red: #FF7675 (Urgent/Safety)
Warning Yellow: #FDCB6E (Attention)
```

### Neutral Palette
```
Grays 50-900: Professional gray scale
Background: #FAFBFC (Soft off-white)
Surface: #FFFFFF (Pure white)
Border: #E8EAED (Subtle dividers)
```

---

## Typography

### Font Stack
- **System Fonts**: For optimal performance and immediate availability
- **Weight Scale**: 400 (Regular), 500 (Medium), 600 (Semi-Bold), 700 (Bold), 800 (Heavy)

### Type Scale
```
Hero: 42px - Welcome screens, major headings
XXXL: 36px - Section titles
XXL: 28px - Card titles, stats
XL: 22px - Subsection headings
LG: 18px - Body emphasis
MD: 16px - Body text
SM: 14px - Secondary text
XS: 12px - Captions, labels
```

### Line Heights
- Tight: 1.2 - Headlines
- Normal: 1.5 - Body text
- Relaxed: 1.75 - Long-form content

---

## Spacing System

```
XS: 4px   - Tight spacing
SM: 8px   - Component padding
MD: 16px  - Standard gap
LG: 24px  - Section spacing
XL: 32px  - Large gaps
XXL: 48px - Major sections
```

---

## Components

### Buttons

**Primary Button**
```
Background: White
Text: Primary Orange
Border Radius: 30px
Padding: 24px horizontal, 18px vertical
Shadow: Elevated (8dp)
```

**Gradient Buttons** (Action Cards)
```
Background: Linear gradient (feature colors)
Text: White
Border Radius: 16px
Padding: 18px
Shadow: Elevated (5dp)
```

### Cards

**Stats Card**
```
Background: White
Border Radius: 16px
Border Top: 3px colored accent
Shadow: Subtle (3dp)
Padding: 16px
```

**Action Card**
```
Gradient background (feature specific)
Border Radius: 16px
Shadow: Medium (5dp)
Padding: 18px
White text with arrow indicator
```

**Emergency Card**
```
Background: White
Left Border: 4px red
Border Radius: 16px
Shadow: Safety-colored (4dp)
```

### Headers

**Gradient Header**
```
Background: Linear gradient (Primary → Primary Dark)
Height: Dynamic with safe area
Text: White
Multiple text layers: Greeting, Name, Subtitle
```

---

## Design Principles

### 1. Accessibility First
- **High Contrast**: Text color #2D3436 on white
- **Large Touch Targets**: Minimum 48px
- **Clear Hierarchy**: Bold weight differences
- **Icon Support**: Emoji fallbacks for low-end devices

### 2. Performance Optimized
- **System Fonts**: No custom font loading
- **Efficient Gradients**: 2-color max
- **Optimized Images**: Compress all assets
- **Lazy Loading**: Only visible content

### 3. Cultural Sensitivity
- **Bilingual**: Kinyarwanda & English
- **Local Context**: Mining community imagery
- **Respectful Tone**: Professional yet warm
- **Privacy First**: Minimal data collection

### 4. Mobile-First
- **Touch Friendly**: Large buttons, adequate spacing
- **Thumb Zone**: Key actions in easy reach
- **Offline Ready**: Cached content, queue sync
- **Data Conscious**: Lightweight, optimized

---

## Iconography

### Icon Style
- **Emoji-based**: Universal, no downloads needed
- **Size**: 20-32px for clarity
- **Placement**: Left-aligned with text
- **Context**: Meaningful, not decorative

### Icon Palette
```
📚 Learning/Lessons
💰 Financial/Budget
💬 Chat/Support
🧠 Mental Health
🎯 Goals/Progress
⭐ Points/Rewards
🔥 Streak/Engagement
🆘 Emergency/Crisis
```

---

## Shadows & Elevation

### Elevation Scale
```
Level 1 (2dp): Subtle cards
Level 2 (3dp): Stats cards
Level 3 (4dp): Emergency elements
Level 4 (5dp): Action cards
Level 5 (8dp): Primary buttons
```

### Shadow Configuration
```css
Subtle: rgba(0,0,0,0.08)
Medium: rgba(0,0,0,0.15)
Elevated: rgba(0,0,0,0.3)
```

---

## Animations

### Timing
- **Fast**: 150ms - Micro-interactions
- **Normal**: 250ms - Standard transitions
- **Slow**: 400ms - Page transitions

### Easing
- **Ease-Out**: User-initiated actions
- **Ease-In-Out**: Automatic transitions

### Touch Feedback
```
Active Opacity: 0.7-0.8
Ripple: Material Design standard
Haptic: Optional, system-dependent
```

---

## Layout Patterns

### Screen Structure
```
┌─────────────────────────┐
│   Gradient Header       │ 15% height
├─────────────────────────┤
│                         │
│   Scrollable Content    │ 85% height
│   - Stats Cards         │
│   - Action Cards        │
│   - Emergency Support   │
│                         │
└─────────────────────────┘
```

### Grid System
- **Container**: 16px horizontal padding
- **Columns**: Flexible, content-dependent
- **Gaps**: 8px (small), 16px (standard)

---

## Responsive Behavior

### Small Phones (< 375px width)
- Single column layout
- Reduced font sizes (10%)
- Compact spacing

### Standard Phones (375-414px)
- Optimal design target
- All features visible
- Standard spacing

### Large Phones (> 414px)
- Increased content width (max 480px)
- Enhanced imagery
- Generous spacing

---

## Dark Mode (Future)
```
Background: #0F1011
Surface: #1A1D1E
Primary: #FF9E6B (Lighter orange)
Text: #F5F6F7
```

---

## Usage Examples

### Welcome Screen
- Gradient background (Primary → Secondary)
- Large hero text (42px)
- Feature cards with icons
- White CTA button

### Dashboard
- Gradient header
- 3 stat cards in row
- Gradient action cards
- Emergency support card

### Forms
- Clean white backgrounds
- Primary orange accents
- Clear validation states
- Accessible inputs

---

## Accessibility Compliance

### WCAG 2.1 Level AA
✅ Color contrast 4.5:1 minimum
✅ Touch targets 48x48px
✅ Text resize up to 200%
✅ Screen reader support
✅ Keyboard navigation
✅ Focus indicators

---

## Brand Voice

### Tone
- **Professional yet Warm**: Approachable expertise
- **Encouraging**: Positive reinforcement
- **Clear**: Simple language, no jargon
- **Respectful**: Cultural sensitivity

### Writing Style
- **Active Voice**: "Start learning" not "Learning can be started"
- **Short Sentences**: Maximum clarity
- **Action-Oriented**: Clear CTAs
- **Bilingual**: Kinyarwanda & English parity

---

<div align="center">

**Real Works Design System v1.0**

*Built for Rwanda's mining communities*

</div>

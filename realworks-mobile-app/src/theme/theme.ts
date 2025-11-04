import { DefaultTheme } from 'react-native-paper';

// Real Works Brand Color Palette
export const colors = {
  // Primary Brand Colors - Warm Orange (from Real Works logo)
  primary: '#F57C3D', // Real Works Orange
  primaryLight: '#FF9E6B',
  primaryDark: '#E86520',
  primarySoft: '#FFF4ED', // Very light orange for backgrounds
  
  // Secondary Colors - Professional Grays
  secondary: '#2D3436', // Dark Charcoal
  secondaryLight: '#636E72',
  secondaryDark: '#1A1D1E',
  
  // Accent Colors
  accent: '#00B894', // Fresh Green (for success/growth)
  accentLight: '#55EFC4',
  accentDark: '#00917A',
  
  // Feature-specific Colors
  mentalHealth: '#A29BFE', // Soft Purple for mental health
  financial: '#00B894', // Green for financial
  safety: '#FF7675', // Coral Red for crisis
  learning: '#74B9FF', // Sky Blue for learning
  
  // Neutral Colors
  white: '#FFFFFF',
  black: '#000000',
  
  // Grays - Professional palette
  gray50: '#FAFBFC',
  gray100: '#F5F6F7',
  gray200: '#E8EAED',
  gray300: '#D1D5DB',
  gray400: '#9CA3AF',
  gray500: '#636E72',
  gray600: '#4B5563',
  gray700: '#2D3436',
  gray800: '#1A1D1E',
  gray900: '#0F1011',
  
  // Semantic Colors
  success: '#00B894',
  warning: '#FDCB6E',
  error: '#FF7675',
  info: '#74B9FF',
  
  // UI Colors - Natural & Clean
  background: '#FAFBFC', // Soft off-white
  surface: '#FFFFFF',
  border: '#E8EAED',
  text: '#2D3436', // Dark charcoal for readability
  textSecondary: '#636E72',
  textMuted: '#9CA3AF',
  divider: '#E8EAED',
  
  // Interactive
  link: '#F57C3D',
  linkHover: '#E86520',
  disabled: '#E8EAED',
  disabledText: '#9CA3AF',
  
  // Overlays
  overlay: 'rgba(45, 52, 54, 0.7)',
  overlayLight: 'rgba(45, 52, 54, 0.3)',
};

export const spacing = {
  xs: 4,
  sm: 8,
  md: 16,
  lg: 24,
  xl: 32,
  xxl: 48,
};

export const typography = {
  fontFamily: {
    regular: 'System',
    medium: 'System',
    semiBold: 'System',
    bold: 'System',
  },
  fontSize: {
    xs: 12,
    sm: 14,
    md: 16,
    lg: 18,
    xl: 22,
    xxl: 28,
    xxxl: 36,
    hero: 42,
  },
  fontWeight: {
    regular: '400' as const,
    medium: '500' as const,
    semiBold: '600' as const,
    bold: '700' as const,
    heavy: '800' as const,
  },
  lineHeight: {
    tight: 1.2,
    normal: 1.5,
    relaxed: 1.75,
  },
};

export const borderRadius = {
  sm: 8,
  md: 12,
  lg: 16,
  xl: 24,
  full: 9999,
};

export const shadows = {
  sm: {
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.05,
    shadowRadius: 2,
    elevation: 2,
  },
  md: {
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.1,
    shadowRadius: 4,
    elevation: 4,
  },
  lg: {
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.15,
    shadowRadius: 8,
    elevation: 8,
  },
};

export const theme = {
  ...DefaultTheme,
  colors: {
    ...DefaultTheme.colors,
    primary: colors.primary,
    accent: colors.accent,
    background: colors.background,
    surface: colors.surface,
    error: colors.error,
    text: colors.text,
    onSurface: colors.text,
    disabled: colors.gray400,
    placeholder: colors.gray400,
    backdrop: 'rgba(0, 0, 0, 0.5)',
  },
  fonts: {
    regular: {
      fontFamily: typography.fontFamily.regular,
      fontWeight: '400' as const,
    },
    medium: {
      fontFamily: typography.fontFamily.medium,
      fontWeight: '500' as const,
    },
    light: {
      fontFamily: typography.fontFamily.regular,
      fontWeight: '300' as const,
    },
    thin: {
      fontFamily: typography.fontFamily.regular,
      fontWeight: '100' as const,
    },
  },
  roundness: borderRadius.md,
};

export default { colors, spacing, typography, borderRadius, shadows, theme };

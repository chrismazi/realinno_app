import { DefaultTheme } from 'react-native-paper';

export const colors = {
  // Primary Brand Colors
  primary: '#1E3A8A',        // Deep Blue
  primaryLight: '#3B82F6',   // Lighter Blue
  primaryDark: '#1E40AF',    // Darker Blue
  
  // Secondary Colors
  secondary: '#10B981',      // Emerald Green
  secondaryLight: '#34D399', // Light Green
  secondaryDark: '#059669',  // Dark Green
  
  // Accent Colors
  accent: '#F59E0B',         // Amber
  accentLight: '#FCD34D',    // Light Amber
  
  // Mental Health Theme
  mentalHealth: '#8B5CF6',   // Purple
  mentalHealthLight: '#A78BFA',
  
  // Financial Theme
  financial: '#10B981',      // Green
  financialLight: '#6EE7B7',
  
  // Status Colors
  success: '#10B981',
  warning: '#F59E0B',
  error: '#EF4444',
  info: '#3B82F6',
  
  // Neutral Colors
  white: '#FFFFFF',
  black: '#000000',
  gray50: '#F9FAFB',
  gray100: '#F3F4F6',
  gray200: '#E5E7EB',
  gray300: '#D1D5DB',
  gray400: '#9CA3AF',
  gray500: '#6B7280',
  gray600: '#4B5563',
  gray700: '#374151',
  gray800: '#1F2937',
  gray900: '#111827',
  
  // Background
  background: '#F9FAFB',
  surface: '#FFFFFF',
  
  // Text Colors
  text: '#111827',
  textSecondary: '#6B7280',
  textLight: '#9CA3AF',
  
  // Border
  border: '#E5E7EB',
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
    regular: 'Poppins-Regular',
    medium: 'Poppins-Medium',
    semiBold: 'Poppins-SemiBold',
    bold: 'Poppins-Bold',
  },
  fontSize: {
    xs: 12,
    sm: 14,
    md: 16,
    lg: 18,
    xl: 20,
    xxl: 24,
    xxxl: 32,
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

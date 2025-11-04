import React from 'react';
import { View, Text, StyleSheet, TouchableOpacity, Dimensions, StatusBar } from 'react-native';
import { useNavigation } from '@react-navigation/native';
import { LinearGradient } from 'expo-linear-gradient';
import { colors, spacing, typography } from '../../theme/theme';

const { height } = Dimensions.get('window');

const OnboardingScreen = () => {
  const navigation = useNavigation();

  return (
    <>
      <StatusBar barStyle="light-content" />
      <LinearGradient
        colors={[colors.primary, colors.primaryDark, colors.secondary]}
        start={{ x: 0, y: 0 }}
        end={{ x: 1, y: 1 }}
        style={styles.container}
      >
        {/* Logo Area */}
        <View style={styles.logoContainer}>
          <View style={styles.logoCircle}>
            <Text style={styles.logoText}>RW</Text>
          </View>
          <Text style={styles.brandName}>Real Works</Text>
          <Text style={styles.tagline}>Practical to Real Innovation</Text>
        </View>

        {/* Hero Content */}
        <View style={styles.content}>
          <Text style={styles.title}>Empowering{'\n'}Mining Communities</Text>
          <Text style={styles.subtitle}>
            Your journey to mental wellness and financial literacy starts here
          </Text>

          {/* Features */}
          <View style={styles.features}>
            <View style={styles.featureRow}>
              <Text style={styles.featureIcon}>💡</Text>
              <Text style={styles.featureText}>Learn Financial Skills</Text>
            </View>
            <View style={styles.featureRow}>
              <Text style={styles.featureIcon}>🧠</Text>
              <Text style={styles.featureText}>Mental Health Support</Text>
            </View>
            <View style={styles.featureRow}>
              <Text style={styles.featureIcon}>🎯</Text>
              <Text style={styles.featureText}>Track Your Progress</Text>
            </View>
          </View>
        </View>

        {/* CTA */}
        <View style={styles.ctaContainer}>
          <TouchableOpacity
            style={styles.button}
            onPress={() => navigation.navigate('PhoneAuth' as never)}
            activeOpacity={0.8}
          >
            <Text style={styles.buttonText}>Get Started</Text>
          </TouchableOpacity>
          <Text style={styles.footerText}>
            Join 1,000+ miners improving their lives
          </Text>
        </View>
      </LinearGradient>
    </>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  logoContainer: {
    alignItems: 'center',
    marginTop: height * 0.1,
    marginBottom: spacing.xxl,
  },
  logoCircle: {
    width: 80,
    height: 80,
    borderRadius: 40,
    backgroundColor: 'rgba(255, 255, 255, 0.2)',
    borderWidth: 3,
    borderColor: colors.white,
    justifyContent: 'center',
    alignItems: 'center',
    marginBottom: spacing.md,
  },
  logoText: {
    fontSize: 32,
    fontWeight: typography.fontWeight.bold,
    color: colors.white,
  },
  brandName: {
    fontSize: typography.fontSize.xxl,
    fontWeight: typography.fontWeight.bold,
    color: colors.white,
    marginBottom: spacing.xs,
  },
  tagline: {
    fontSize: typography.fontSize.sm,
    color: colors.white,
    opacity: 0.9,
    letterSpacing: 1,
  },
  content: {
    flex: 1,
    justifyContent: 'center',
    paddingHorizontal: spacing.xl,
  },
  title: {
    fontSize: typography.fontSize.hero,
    fontWeight: typography.fontWeight.heavy,
    color: colors.white,
    marginBottom: spacing.md,
    lineHeight: typography.fontSize.hero * 1.2,
  },
  subtitle: {
    fontSize: typography.fontSize.lg,
    color: colors.white,
    opacity: 0.95,
    marginBottom: spacing.xxl,
    lineHeight: typography.fontSize.lg * typography.lineHeight.relaxed,
  },
  features: {
    marginTop: spacing.lg,
  },
  featureRow: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: spacing.md,
    backgroundColor: 'rgba(255, 255, 255, 0.1)',
    padding: spacing.md,
    borderRadius: 12,
  },
  featureIcon: {
    fontSize: 24,
    marginRight: spacing.md,
  },
  featureText: {
    fontSize: typography.fontSize.md,
    color: colors.white,
    fontWeight: typography.fontWeight.medium,
  },
  ctaContainer: {
    paddingHorizontal: spacing.xl,
    paddingBottom: spacing.xxl,
    alignItems: 'center',
  },
  button: {
    backgroundColor: colors.white,
    paddingHorizontal: spacing.xxl,
    paddingVertical: spacing.lg,
    borderRadius: 30,
    width: '100%',
    alignItems: 'center',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.3,
    shadowRadius: 8,
    elevation: 8,
  },
  buttonText: {
    fontSize: typography.fontSize.lg,
    fontWeight: typography.fontWeight.bold,
    color: colors.primary,
  },
  footerText: {
    fontSize: typography.fontSize.sm,
    color: colors.white,
    opacity: 0.8,
    marginTop: spacing.md,
  },
});

export default OnboardingScreen;

import React from 'react';
import { View, Text, StyleSheet, TouchableOpacity } from 'react-native';
import { useNavigation } from '@react-navigation/native';
import { colors, spacing, typography } from '../../theme/theme';

const OnboardingScreen = () => {
  const navigation = useNavigation();

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Welcome to Real Works</Text>
      <Text style={styles.subtitle}>
        Mental wellness and financial literacy platform for Rwanda's mining communities
      </Text>
      <TouchableOpacity
        style={styles.button}
        onPress={() => navigation.navigate('PhoneAuth' as never)}
      >
        <Text style={styles.buttonText}>Get Started</Text>
      </TouchableOpacity>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.primary,
    justifyContent: 'center',
    alignItems: 'center',
    padding: spacing.lg,
  },
  title: {
    fontSize: typography.fontSize.xxxl,
    fontWeight: 'bold',
    color: colors.white,
    marginBottom: spacing.md,
    textAlign: 'center',
  },
  subtitle: {
    fontSize: typography.fontSize.md,
    color: colors.white,
    textAlign: 'center',
    marginBottom: spacing.xxl,
    opacity: 0.9,
  },
  button: {
    backgroundColor: colors.secondary,
    paddingHorizontal: spacing.xl,
    paddingVertical: spacing.md,
    borderRadius: 12,
  },
  buttonText: {
    fontSize: typography.fontSize.lg,
    fontWeight: '600',
    color: colors.white,
  },
});

export default OnboardingScreen;

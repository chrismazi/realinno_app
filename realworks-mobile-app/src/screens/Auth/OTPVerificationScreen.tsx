import React, { useState } from 'react';
import { View, Text, StyleSheet, TextInput, TouchableOpacity } from 'react-native';
import { colors, spacing, typography } from '../../theme/theme';

const OTPVerificationScreen = ({ route, navigation }: any) => {
  const [otp, setOtp] = useState('');
  const { phoneNumber } = route.params;

  const handleVerify = () => {
    // TODO: Implement OTP verification
    navigation.navigate('LanguageSelection');
  };

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Enter Verification Code</Text>
      <Text style={styles.subtitle}>Code sent to {phoneNumber}</Text>
      
      <TextInput
        style={styles.input}
        placeholder="000000"
        keyboardType="number-pad"
        maxLength={6}
        value={otp}
        onChangeText={setOtp}
      />

      <TouchableOpacity style={styles.button} onPress={handleVerify}>
        <Text style={styles.buttonText}>Verify</Text>
      </TouchableOpacity>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.white,
    padding: spacing.lg,
    justifyContent: 'center',
  },
  title: {
    fontSize: typography.fontSize.xxl,
    fontWeight: 'bold',
    color: colors.text,
    marginBottom: spacing.sm,
  },
  subtitle: {
    fontSize: typography.fontSize.md,
    color: colors.textSecondary,
    marginBottom: spacing.xl,
  },
  input: {
    borderWidth: 1,
    borderColor: colors.border,
    borderRadius: 12,
    padding: spacing.md,
    fontSize: typography.fontSize.xxl,
    marginBottom: spacing.lg,
    textAlign: 'center',
    letterSpacing: 8,
  },
  button: {
    backgroundColor: colors.primary,
    padding: spacing.md,
    borderRadius: 12,
    alignItems: 'center',
  },
  buttonText: {
    fontSize: typography.fontSize.lg,
    fontWeight: '600',
    color: colors.white,
  },
});

export default OTPVerificationScreen;

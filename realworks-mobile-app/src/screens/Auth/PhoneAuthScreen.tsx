import React, { useState } from 'react';
import { View, Text, StyleSheet, TextInput, TouchableOpacity } from 'react-native';
import { colors, spacing, typography } from '../../theme/theme';

const PhoneAuthScreen = ({ navigation }: any) => {
  const [phoneNumber, setPhoneNumber] = useState('');

  const handleContinue = () => {
    navigation.navigate('OTPVerification', { phoneNumber });
  };

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Enter Your Phone Number</Text>
      <Text style={styles.subtitle}>We'll send you a verification code</Text>
      
      <TextInput
        style={styles.input}
        placeholder="+250 XXX XXX XXX"
        keyboardType="phone-pad"
        value={phoneNumber}
        onChangeText={setPhoneNumber}
      />

      <TouchableOpacity style={styles.button} onPress={handleContinue}>
        <Text style={styles.buttonText}>Continue</Text>
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
    fontSize: typography.fontSize.lg,
    marginBottom: spacing.lg,
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

export default PhoneAuthScreen;

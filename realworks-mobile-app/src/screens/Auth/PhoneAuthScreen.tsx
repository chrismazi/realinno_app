import React, { useState } from 'react';
import { View, Text, StyleSheet, TextInput, TouchableOpacity, StatusBar, KeyboardAvoidingView, Platform } from 'react-native';
import { colors, spacing, typography } from '../../theme/theme';

const PhoneAuthScreen = ({ navigation }: any) => {
  const [phoneNumber, setPhoneNumber] = useState('');

  const handleContinue = () => {
    // For demo: any phone number works
    if (phoneNumber.length >= 9) {
      navigation.navigate('OTPVerification', { phoneNumber });
    }
  };

  const isValid = phoneNumber.length >= 9;

  return (
    <KeyboardAvoidingView 
      style={styles.container}
      behavior={Platform.OS === 'ios' ? 'padding' : 'height'}
    >
      <StatusBar barStyle="dark-content" />
      
      {/* Header */}
      <View style={styles.header}>
        <View style={styles.iconContainer}>
          <Text style={styles.icon}>📱</Text>
        </View>
        <Text style={styles.title}>Enter Your Phone Number</Text>
        <Text style={styles.subtitle}>We'll send you a verification code</Text>
      </View>
      
      {/* Input */}
      <View style={styles.content}>
        <TextInput
          style={styles.input}
          placeholder="+250 XXX XXX XXX"
          placeholderTextColor={colors.gray400}
          keyboardType="phone-pad"
          value={phoneNumber}
          onChangeText={setPhoneNumber}
          autoFocus
          maxLength={15}
        />
        
        <Text style={styles.hint}>Enter your Rwanda mobile number</Text>
      </View>

      {/* Button */}
      <View style={styles.footer}>
        <TouchableOpacity 
          style={[styles.button, !isValid && styles.buttonDisabled]} 
          onPress={handleContinue}
          disabled={!isValid}
          activeOpacity={0.8}
        >
          <Text style={styles.buttonText}>Continue</Text>
        </TouchableOpacity>
      </View>
    </KeyboardAvoidingView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.background,
  },
  header: {
    paddingTop: spacing.xxl + 20,
    paddingHorizontal: spacing.xl,
    paddingBottom: spacing.xl,
    alignItems: 'center',
  },
  iconContainer: {
    width: 80,
    height: 80,
    borderRadius: 40,
    backgroundColor: colors.primarySoft,
    justifyContent: 'center',
    alignItems: 'center',
    marginBottom: spacing.lg,
  },
  icon: {
    fontSize: 40,
  },
  title: {
    fontSize: typography.fontSize.xxl,
    fontWeight: typography.fontWeight.bold,
    color: colors.text,
    marginBottom: spacing.sm,
    textAlign: 'center',
  },
  subtitle: {
    fontSize: typography.fontSize.md,
    color: colors.textSecondary,
    textAlign: 'center',
  },
  content: {
    flex: 1,
    paddingHorizontal: spacing.xl,
    paddingTop: spacing.xl,
  },
  input: {
    backgroundColor: colors.white,
    borderWidth: 2,
    borderColor: colors.border,
    borderRadius: 16,
    padding: spacing.lg,
    fontSize: typography.fontSize.xl,
    color: colors.text,
    textAlign: 'center',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.05,
    shadowRadius: 8,
    elevation: 2,
  },
  hint: {
    fontSize: typography.fontSize.sm,
    color: colors.textSecondary,
    textAlign: 'center',
    marginTop: spacing.md,
  },
  footer: {
    padding: spacing.xl,
    paddingBottom: spacing.xxl,
  },
  button: {
    backgroundColor: colors.primary,
    paddingVertical: spacing.lg,
    borderRadius: 16,
    alignItems: 'center',
    shadowColor: colors.primary,
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.3,
    shadowRadius: 8,
    elevation: 6,
  },
  buttonDisabled: {
    backgroundColor: colors.gray300,
    shadowOpacity: 0,
    elevation: 0,
  },
  buttonText: {
    fontSize: typography.fontSize.lg,
    fontWeight: typography.fontWeight.bold,
    color: colors.white,
  },
});

export default PhoneAuthScreen;

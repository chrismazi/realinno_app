import React, { useState } from 'react';
import {
  View,
  Text,
  StyleSheet,
  TextInput,
  TouchableOpacity,
  StatusBar,
  ScrollView,
  KeyboardAvoidingView,
  Platform,
  ActivityIndicator,
} from 'react-native';
import { colors, spacing, typography } from '../../theme/theme';
import { useNavigation } from '@react-navigation/native';
import { useLocale } from '../../context/LocaleContext';

const PhoneRegistrationScreen = () => {
  const navigation = useNavigation();
  const { locale, setLocale } = useLocale();
  const [phoneNumber, setPhoneNumber] = useState('');
  const [phoneError, setPhoneError] = useState('');
  const [isLoading, setIsLoading] = useState(false);
  const [retryCountdown, setRetryCountdown] = useState(0);
  const [countryCode] = useState('+250');

  const validatePhone = (phone: string) => {
    const cleanPhone = phone.replace(/\s/g, '');
    if (cleanPhone.length === 0) {
      setPhoneError('');
      return false;
    }
    if (cleanPhone.length < 9) {
      setPhoneError(
        locale === 'rw' ? "Nimero y'itelefoni ni ngufi" : 'Phone number is too short'
      );
      return false;
    }
    if (!/^7[0-9]{8}$/.test(cleanPhone)) {
      setPhoneError(
        locale === 'rw' ? "Nimero y'itelefoni ntabwo ari yo" : 'Invalid phone number format'
      );
      return false;
    }
    setPhoneError('');
    return true;
  };

  const handlePhoneChange = (text: string) => {
    setPhoneNumber(text);
    validatePhone(text);
  };

  const sendOTP = async () => {
    if (!validatePhone(phoneNumber) || isLoading || retryCountdown > 0) return;

    setIsLoading(true);
    setPhoneError('');

    try {
      // Simulate OTP sending
      await new Promise(resolve => setTimeout(resolve, 2000));

      // Navigate to Login (since we don't have OTP verification screen)
      navigation.navigate('Login' as never);
    } catch (error) {
      setPhoneError(
        locale === 'rw' ? 'Habaye ikosa. Ongera ugerageze' : 'Something went wrong. Please try again'
      );
      setRetryCountdown(30);
      startCountdown();
    } finally {
      setIsLoading(false);
    }
  };

  const startCountdown = () => {
    const interval = setInterval(() => {
      setRetryCountdown((prev) => {
        if (prev <= 1) {
          clearInterval(interval);
          return 0;
        }
        return prev - 1;
      });
    }, 1000);
  };

  const isPhoneValid = () => {
    const cleanPhone = phoneNumber.replace(/\s/g, '');
    return cleanPhone.length === 9 && /^7[0-9]{8}$/.test(cleanPhone) && !phoneError;
  };

  const toggleLanguage = () => {
    setLocale(locale === 'en' ? 'rw' : 'en');
  };

  return (
    <KeyboardAvoidingView
      style={styles.container}
      behavior={Platform.OS === 'ios' ? 'padding' : undefined}
    >
      <StatusBar barStyle="dark-content" />
      
      <ScrollView style={styles.scrollView} showsVerticalScrollIndicator={false}>
        {/* Header */}
        <View style={styles.header}>
          <TouchableOpacity
            style={styles.backButton}
            onPress={() => navigation.goBack()}
          >
            <Text style={styles.backIcon}>←</Text>
          </TouchableOpacity>
          
          <TouchableOpacity style={styles.languageToggle} onPress={toggleLanguage}>
            <Text style={styles.languageText}>{locale === 'en' ? 'EN' : 'RW'}</Text>
          </TouchableOpacity>
        </View>

        {/* Logo */}
        <View style={styles.logoContainer}>
          <View style={styles.logo}>
            <Text style={styles.logoIcon}>🧠</Text>
          </View>
        </View>

        {/* Welcome Text */}
        <Text style={styles.title}>
          {locale === 'rw' ? 'Murakaza neza kuri RealWorks' : 'Welcome to RealWorks'}
        </Text>
        <Text style={styles.subtitle}>
          {locale === 'rw'
            ? "Injiza nimero yawe y'itelefoni kugira ngo tuguhe kode y'kwemeza"
            : 'Enter your phone number to receive a verification code'}
        </Text>

        {/* Phone Input */}
        <View style={styles.inputSection}>
          <Text style={styles.label}>
            {locale === 'rw' ? "Nimero y'itelefoni" : 'Phone Number'}
          </Text>
          
          <View style={styles.phoneInputContainer}>
            {/* Country Code */}
            <View style={styles.countryCodeContainer}>
              <Text style={styles.countryCode}>{countryCode}</Text>
            </View>

            {/* Phone Number Input */}
            <TextInput
              style={[styles.phoneInput, phoneError ? styles.inputError : null]}
              value={phoneNumber}
              onChangeText={handlePhoneChange}
              placeholder="7XX XXX XXX"
              placeholderTextColor={colors.gray400}
              keyboardType="phone-pad"
              maxLength={11}
              editable={!isLoading && retryCountdown === 0}
            />
          </View>
          
          {phoneError ? <Text style={styles.errorText}>{phoneError}</Text> : null}
        </View>

        {/* Send Code Button */}
        <TouchableOpacity
          style={[
            styles.sendButton,
            (!isPhoneValid() || retryCountdown > 0) && styles.sendButtonDisabled,
          ]}
          onPress={sendOTP}
          disabled={!isPhoneValid() || retryCountdown > 0}
          activeOpacity={0.8}
        >
          {isLoading ? (
            <ActivityIndicator color={colors.white} />
          ) : (
            <Text style={styles.sendButtonText}>
              {retryCountdown > 0
                ? locale === 'rw'
                  ? `Tegereza amasegonda ${retryCountdown}`
                  : `Wait ${retryCountdown} seconds`
                : locale === 'rw'
                ? 'Ohereza kode'
                : 'Send Code'}
            </Text>
          )}
        </TouchableOpacity>

        {/* Privacy Notice */}
        <View style={styles.privacyNotice}>
          <Text style={styles.privacyText}>
            {locale === 'rw'
              ? 'Mugukanda kuri "Ohereza kode", wemera '
              : 'By tapping "Send Code", you agree to our '}
            <Text style={styles.privacyLink}>
              {locale === 'rw' ? "Amategeko y'ikoreshwa" : 'Terms of Service'}
            </Text>
            {locale === 'rw' ? ' na ' : ' and '}
            <Text style={styles.privacyLink}>
              {locale === 'rw' ? "Politiki y'ibanga" : 'Privacy Policy'}
            </Text>
          </Text>
        </View>
      </ScrollView>
    </KeyboardAvoidingView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.background,
  },
  scrollView: {
    flex: 1,
    paddingHorizontal: spacing.md,
  },
  header: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    paddingVertical: spacing.md,
    marginTop: spacing.sm,
  },
  backButton: {
    width: 40,
    height: 40,
    borderRadius: 12,
    backgroundColor: colors.white,
    borderWidth: 1,
    borderColor: colors.border,
    justifyContent: 'center',
    alignItems: 'center',
  },
  backIcon: {
    fontSize: 20,
    color: colors.text,
  },
  languageToggle: {
    paddingHorizontal: spacing.md,
    paddingVertical: spacing.sm,
    backgroundColor: colors.primarySoft,
    borderRadius: 8,
    borderWidth: 1,
    borderColor: colors.primary + '30',
  },
  languageText: {
    fontSize: typography.fontSize.sm,
    fontWeight: typography.fontWeight.bold,
    color: colors.primary,
  },
  logoContainer: {
    alignItems: 'center',
    marginTop: spacing.xl,
    marginBottom: spacing.lg,
  },
  logo: {
    width: 80,
    height: 80,
    borderRadius: 16,
    backgroundColor: colors.primarySoft,
    justifyContent: 'center',
    alignItems: 'center',
    shadowColor: colors.primary,
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.2,
    shadowRadius: 12,
    elevation: 6,
  },
  logoIcon: {
    fontSize: 40,
  },
  title: {
    fontSize: typography.fontSize.xl,
    fontWeight: typography.fontWeight.bold,
    color: colors.text,
    textAlign: 'center',
    marginBottom: spacing.sm,
  },
  subtitle: {
    fontSize: typography.fontSize.sm,
    color: colors.textSecondary,
    textAlign: 'center',
    lineHeight: 20,
    paddingHorizontal: spacing.md,
    marginBottom: spacing.xxl,
  },
  inputSection: {
    marginBottom: spacing.lg,
  },
  label: {
    fontSize: typography.fontSize.sm,
    fontWeight: typography.fontWeight.bold,
    color: colors.text,
    marginBottom: spacing.sm,
  },
  phoneInputContainer: {
    flexDirection: 'row',
    gap: spacing.sm,
  },
  countryCodeContainer: {
    flex: 1,
    backgroundColor: colors.white,
    borderRadius: 12,
    borderWidth: 1,
    borderColor: colors.border,
    justifyContent: 'center',
    alignItems: 'center',
    paddingVertical: spacing.md,
  },
  countryCode: {
    fontSize: typography.fontSize.md,
    fontWeight: typography.fontWeight.bold,
    color: colors.text,
  },
  phoneInput: {
    flex: 2,
    backgroundColor: colors.white,
    borderRadius: 12,
    borderWidth: 1,
    borderColor: colors.border,
    paddingHorizontal: spacing.md,
    paddingVertical: spacing.md,
    fontSize: typography.fontSize.md,
    color: colors.text,
  },
  inputError: {
    borderColor: colors.error,
    borderWidth: 2,
  },
  errorText: {
    fontSize: typography.fontSize.xs,
    color: colors.error,
    marginTop: spacing.xs,
  },
  sendButton: {
    backgroundColor: colors.primary,
    paddingVertical: spacing.md,
    borderRadius: 16,
    alignItems: 'center',
    marginBottom: spacing.lg,
    shadowColor: colors.primary,
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.3,
    shadowRadius: 8,
    elevation: 6,
  },
  sendButtonDisabled: {
    backgroundColor: colors.gray300,
    shadowOpacity: 0,
  },
  sendButtonText: {
    fontSize: typography.fontSize.md,
    fontWeight: typography.fontWeight.bold,
    color: colors.white,
  },
  privacyNotice: {
    paddingHorizontal: spacing.md,
    marginBottom: spacing.xl,
  },
  privacyText: {
    fontSize: typography.fontSize.xs,
    color: colors.textSecondary,
    textAlign: 'center',
    lineHeight: 18,
  },
  privacyLink: {
    color: colors.primary,
    fontWeight: typography.fontWeight.bold,
  },
});

export default PhoneRegistrationScreen;

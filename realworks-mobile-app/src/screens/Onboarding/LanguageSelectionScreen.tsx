import React from 'react';
import { View, Text, StyleSheet, TouchableOpacity } from 'react-native';
import { colors, spacing, typography } from '../../theme/theme';

const LanguageSelectionScreen = ({ navigation }: any) => {
  const handleSelectLanguage = (lang: string) => {
    navigation.navigate('GoalSelection');
  };

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Select Your Language</Text>
      <Text style={styles.subtitle}>Hitamo Ururimi</Text>
      
      <TouchableOpacity
        style={styles.languageButton}
        onPress={() => handleSelectLanguage('rw')}
      >
        <Text style={styles.languageText}>🇷🇼 Kinyarwanda</Text>
      </TouchableOpacity>

      <TouchableOpacity
        style={styles.languageButton}
        onPress={() => handleSelectLanguage('en')}
      >
        <Text style={styles.languageText}>🇬🇧 English</Text>
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
    textAlign: 'center',
  },
  subtitle: {
    fontSize: typography.fontSize.lg,
    color: colors.textSecondary,
    marginBottom: spacing.xxl,
    textAlign: 'center',
  },
  languageButton: {
    backgroundColor: colors.gray100,
    padding: spacing.lg,
    borderRadius: 12,
    marginBottom: spacing.md,
    borderWidth: 2,
    borderColor: colors.border,
  },
  languageText: {
    fontSize: typography.fontSize.xl,
    fontWeight: '600',
    color: colors.text,
    textAlign: 'center',
  },
});

export default LanguageSelectionScreen;

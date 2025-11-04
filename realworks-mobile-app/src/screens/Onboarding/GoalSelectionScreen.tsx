import React, { useState } from 'react';
import { View, Text, StyleSheet, TouchableOpacity, ScrollView } from 'react-native';
import { colors, spacing, typography } from '../../theme/theme';
import { useAuth } from '../../context/AuthContext';

const GoalSelectionScreen = () => {
  const { completeOnboarding } = useAuth();
  const [selectedGoals, setSelectedGoals] = useState<string[]>([]);

  const goals = [
    { id: 'stress', label: 'Reduce Stress' },
    { id: 'savings', label: 'Save Money' },
    { id: 'confidence', label: 'Build Confidence' },
    { id: 'health', label: 'Improve Health' },
  ];

  const toggleGoal = (goalId: string) => {
    if (selectedGoals.includes(goalId)) {
      setSelectedGoals(selectedGoals.filter(g => g !== goalId));
    } else {
      setSelectedGoals([...selectedGoals, goalId]);
    }
  };

  const handleContinue = async () => {
    // Complete onboarding - AppNavigator will automatically show Main screen
    await completeOnboarding();
  };

  return (
    <View style={styles.container}>
      <ScrollView contentContainerStyle={styles.scrollContent}>
        <Text style={styles.title}>What are your goals?</Text>
        <Text style={styles.subtitle}>Select all that apply</Text>
        
        {goals.map(goal => (
          <TouchableOpacity
            key={goal.id}
            style={[
              styles.goalButton,
              selectedGoals.includes(goal.id) && styles.goalButtonSelected
            ]}
            onPress={() => toggleGoal(goal.id)}
          >
            <Text style={[
              styles.goalText,
              selectedGoals.includes(goal.id) && styles.goalTextSelected
            ]}>
              {goal.label}
            </Text>
          </TouchableOpacity>
        ))}

        <TouchableOpacity
          style={[styles.button, selectedGoals.length === 0 && styles.buttonDisabled]}
          onPress={handleContinue}
          disabled={selectedGoals.length === 0}
        >
          <Text style={styles.buttonText}>Continue</Text>
        </TouchableOpacity>
      </ScrollView>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.white,
  },
  scrollContent: {
    padding: spacing.lg,
    paddingTop: spacing.xxl,
  },
  title: {
    fontSize: typography.fontSize.xxl,
    fontWeight: 'bold',
    color: colors.text,
    marginBottom: spacing.sm,
    textAlign: 'center',
  },
  subtitle: {
    fontSize: typography.fontSize.md,
    color: colors.textSecondary,
    marginBottom: spacing.xl,
    textAlign: 'center',
  },
  goalButton: {
    backgroundColor: colors.gray100,
    padding: spacing.lg,
    borderRadius: 12,
    marginBottom: spacing.md,
    borderWidth: 2,
    borderColor: colors.border,
  },
  goalButtonSelected: {
    backgroundColor: colors.primaryLight,
    borderColor: colors.primary,
  },
  goalText: {
    fontSize: typography.fontSize.lg,
    fontWeight: '600',
    color: colors.text,
    textAlign: 'center',
  },
  goalTextSelected: {
    color: colors.white,
  },
  button: {
    backgroundColor: colors.primary,
    padding: spacing.md,
    borderRadius: 12,
    alignItems: 'center',
    marginTop: spacing.lg,
  },
  buttonDisabled: {
    opacity: 0.5,
  },
  buttonText: {
    fontSize: typography.fontSize.lg,
    fontWeight: '600',
    color: colors.white,
  },
});

export default GoalSelectionScreen;

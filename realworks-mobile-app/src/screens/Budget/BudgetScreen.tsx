import React from 'react';
import { View, Text, StyleSheet, ScrollView } from 'react-native';
import { colors, spacing, typography } from '../../theme/theme';

const BudgetScreen = () => {
  return (
    <ScrollView style={styles.container}>
      <View style={styles.header}>
        <Text style={styles.title}>Budget Planner</Text>
      </View>
      <View style={styles.content}>
        <Text style={styles.emptyText}>Budget tracking will be available here</Text>
      </View>
    </ScrollView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.background,
  },
  header: {
    backgroundColor: colors.financial,
    padding: spacing.lg,
    paddingTop: spacing.xxl,
  },
  title: {
    fontSize: typography.fontSize.xxl,
    fontWeight: 'bold',
    color: colors.white,
  },
  content: {
    padding: spacing.lg,
    alignItems: 'center',
    justifyContent: 'center',
    minHeight: 300,
  },
  emptyText: {
    fontSize: typography.fontSize.md,
    color: colors.textSecondary,
  },
});

export default BudgetScreen;

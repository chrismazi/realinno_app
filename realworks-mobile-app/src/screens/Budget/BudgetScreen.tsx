import React, { useState } from 'react';
import {
  View,
  Text,
  StyleSheet,
  ScrollView,
  TouchableOpacity,
  TextInput,
  Modal,
  Dimensions,
  StatusBar,
} from 'react-native';
import { SafeAreaView, useSafeAreaInsets } from 'react-native-safe-area-context';
import { colors, spacing, typography } from '../../theme/theme';
import { useLocale } from '../../context/LocaleContext';

const { width } = Dimensions.get('window');

interface ExpenseCategory {
  name: string;
  budgetAmount: number;
  spentAmount: number;
  color: string;
}

interface SavingsGoal {
  name: string;
  targetAmount: number;
  currentAmount: number;
  targetDate: Date;
  color: string;
}

const BudgetScreen = () => {
  const { t } = useLocale();
  const insets = useSafeAreaInsets();
  const [selectedPeriod, setSelectedPeriod] = useState('Monthly');
  const [isOfflineMode] = useState(false);
  const [showExpenseModal, setShowExpenseModal] = useState(false);
  const [showGoalModal, setShowGoalModal] = useState(false);

  const budgetData = {
    Monthly: {
      income: 450000.0,
      expenses: 320000.0,
      remaining: 130000.0,
    },
    Weekly: {
      income: 112500.0,
      expenses: 80000.0,
      remaining: 32500.0,
    },
  };

  const [expenseCategories, setExpenseCategories] = useState<ExpenseCategory[]>([
    { name: 'Food', budgetAmount: 120000, spentAmount: 85000, color: '#FF6B6B' },
    { name: 'Transport', budgetAmount: 80000, spentAmount: 65000, color: '#4ECDC4' },
    { name: 'Family Support', budgetAmount: 100000, spentAmount: 100000, color: '#FFE66D' },
    { name: 'Safety Gear', budgetAmount: 50000, spentAmount: 25000, color: '#95E1D3' },
  ]);

  const [savingsGoals, setSavingsGoals] = useState<SavingsGoal[]>([
    {
      name: 'Emergency Fund',
      targetAmount: 500000,
      currentAmount: 320000,
      targetDate: new Date(2024, 11, 31),
      color: colors.success,
    },
    {
      name: 'New Phone',
      targetAmount: 200000,
      currentAmount: 150000,
      targetDate: new Date(2024, 7, 15),
      color: colors.primary,
    },
    {
      name: 'Education',
      targetAmount: 300000,
      currentAmount: 75000,
      targetDate: new Date(2025, 0, 30),
      color: colors.secondary,
    },
  ]);

  const weeklyTrends = [
    { day: 'Mon', amount: 15000 },
    { day: 'Tue', amount: 22000 },
    { day: 'Wed', amount: 18000 },
    { day: 'Thu', amount: 25000 },
    { day: 'Fri', amount: 30000 },
    { day: 'Sat', amount: 35000 },
    { day: 'Sun', amount: 12000 },
  ];

  const currentBudget = budgetData[selectedPeriod as keyof typeof budgetData];
  const maxTrend = Math.max(...weeklyTrends.map((t) => t.amount));

  const formatCurrency = (amount: number) => {
    return `RWF ${amount.toFixed(0).replace(/\B(?=(\d{3})+(?!\d))/g, ',')}`;
  };

  const renderBudgetSummary = () => (
    <View style={styles.budgetSummary}>
      <View style={styles.budgetSummaryHeader}>
        <Text style={styles.budgetSummaryTitle}>{selectedPeriod} Budget</Text>
        <View
          style={[
            styles.budgetBadge,
            { backgroundColor: currentBudget.remaining >= 0 ? '#E8F8F5' : '#FADBD8' },
          ]}
        >
          <Text
            style={[
              styles.budgetBadgeText,
              { color: currentBudget.remaining >= 0 ? colors.success : colors.error },
            ]}
          >
            {currentBudget.remaining >= 0 ? 'On Track' : 'Over Budget'}
          </Text>
        </View>
      </View>

      <View style={styles.budgetRow}>
        <View style={styles.budgetItem}>
          <Text style={styles.budgetItemLabel}>Income</Text>
          <Text style={[styles.budgetItemValue, { color: colors.success }]}>
            {formatCurrency(currentBudget.income)}
          </Text>
        </View>
        <View style={styles.budgetItem}>
          <Text style={styles.budgetItemLabel}>Expenses</Text>
          <Text style={[styles.budgetItemValue, { color: colors.error }]}>
            {formatCurrency(currentBudget.expenses)}
          </Text>
        </View>
      </View>

      <View
        style={[
          styles.remainingContainer,
          {
            backgroundColor:
              currentBudget.remaining >= 0
                ? 'rgba(0, 184, 148, 0.05)'
                : 'rgba(255, 118, 117, 0.05)',
            borderColor:
              currentBudget.remaining >= 0
                ? 'rgba(0, 184, 148, 0.2)'
                : 'rgba(255, 118, 117, 0.2)',
          },
        ]}
      >
        <Text style={styles.remainingLabel}>Remaining</Text>
        <Text
          style={[
            styles.remainingValue,
            { color: currentBudget.remaining >= 0 ? colors.success : colors.error },
          ]}
        >
          {formatCurrency(Math.abs(currentBudget.remaining))}
        </Text>
      </View>
    </View>
  );

  const renderSpendingTrends = () => (
    <View style={styles.trendsCard}>
      <Text style={styles.sectionTitle}>Weekly Spending Trends</Text>
      <View style={styles.chartContainer}>
        {weeklyTrends.map((trend, index) => (
          <View key={index} style={styles.barContainer}>
            <View style={styles.barWrapper}>
              <View
                style={[
                  styles.bar,
                  {
                    height: `${(trend.amount / maxTrend) * 100}%`,
                    backgroundColor: colors.primary,
                  },
                ]}
              />
            </View>
            <Text style={styles.barLabel}>{trend.day}</Text>
          </View>
        ))}
      </View>
    </View>
  );

  const renderExpenseCategory = (category: ExpenseCategory, index: number) => {
    const percentage = (category.spentAmount / category.budgetAmount) * 100;
    const remaining = category.budgetAmount - category.spentAmount;

    return (
      <TouchableOpacity key={index} style={styles.categoryCard}>
        <View style={styles.categoryHeader}>
          <View style={[styles.categoryIcon, { backgroundColor: `${category.color}20` }]}>
            <Text style={{ color: category.color }}>●</Text>
          </View>
          <View style={styles.categoryInfo}>
            <Text style={styles.categoryName}>{category.name}</Text>
            <Text style={styles.categoryAmount}>
              {formatCurrency(category.spentAmount)} of {formatCurrency(category.budgetAmount)}
            </Text>
          </View>
          <View style={styles.categoryStats}>
            <Text
              style={[
                styles.categoryPercentage,
                { color: percentage > 80 ? colors.error : category.color },
              ]}
            >
              {percentage.toFixed(0)}%
            </Text>
            <Text
              style={[
                styles.categoryRemaining,
                { color: remaining >= 0 ? colors.textSecondary : colors.error },
              ]}
            >
              {remaining >= 0 ? `${formatCurrency(remaining)} left` : `${formatCurrency(Math.abs(remaining))} over`}
            </Text>
          </View>
        </View>
        <View style={styles.progressBar}>
          <View
            style={[
              styles.progressFill,
              {
                width: `${Math.min(percentage, 100)}%`,
                backgroundColor: percentage > 80 ? colors.error : category.color,
              },
            ]}
          />
        </View>
      </TouchableOpacity>
    );
  };

  const renderSavingsGoal = (goal: SavingsGoal, index: number) => {
    const percentage = (goal.currentAmount / goal.targetAmount) * 100;

    return (
      <View key={index} style={styles.goalCard}>
        <View style={styles.goalHeader}>
          <Text style={styles.goalName}>{goal.name}</Text>
          <Text style={styles.goalPercentage}>{percentage.toFixed(0)}%</Text>
        </View>
        <Text style={styles.goalAmount}>
          {formatCurrency(goal.currentAmount)} / {formatCurrency(goal.targetAmount)}
        </Text>
        <View style={styles.goalProgressBar}>
          <View
            style={[
              styles.goalProgressFill,
              { width: `${Math.min(percentage, 100)}%`, backgroundColor: goal.color },
            ]}
          />
        </View>
        <Text style={styles.goalDate}>
          Target: {goal.targetDate.toLocaleDateString()}
        </Text>
      </View>
    );
  };

  return (
    <SafeAreaView style={styles.container} edges={['top','bottom']}>
      <StatusBar barStyle="dark-content" backgroundColor={colors.white} />
      
      {/* Header */}
      <View style={[styles.header, { paddingTop: insets.top + spacing.sm }]}>
        <Text style={styles.headerTitle}>Budget Planner</Text>
        {isOfflineMode && (
          <View style={styles.offlineBadge}>
            <Text style={styles.offlineBadgeText}>Offline</Text>
          </View>
        )}
      </View>

      {/* Period Toggle */}
      <View style={styles.periodToggle}>
        {['Monthly', 'Weekly'].map((period) => (
          <TouchableOpacity
            key={period}
            style={[
              styles.periodButton,
              selectedPeriod === period && styles.periodButtonActive,
            ]}
            onPress={() => setSelectedPeriod(period)}
          >
            <Text
              style={[
                styles.periodButtonText,
                selectedPeriod === period && styles.periodButtonTextActive,
              ]}
            >
              {period}
            </Text>
          </TouchableOpacity>
        ))}
      </View>

      <ScrollView
        style={styles.scrollView}
        showsVerticalScrollIndicator={false}
        contentContainerStyle={{ paddingBottom: insets.bottom + spacing.xl + 24 }}
      >
        {/* Budget Summary */}
        {renderBudgetSummary()}

        {/* Spending Trends */}
        {renderSpendingTrends()}

        {/* Expense Categories */}
        <View style={styles.section}>
          <View style={styles.sectionHeader}>
            <Text style={styles.sectionTitle}>Expense Categories</Text>
            <TouchableOpacity>
              <Text style={styles.sectionAction}>Set Limits</Text>
            </TouchableOpacity>
          </View>
          {expenseCategories.map((category, index) => renderExpenseCategory(category, index))}
        </View>

        {/* Savings Goals */}
        <View style={styles.section}>
          <View style={styles.sectionHeader}>
            <Text style={styles.sectionTitle}>Savings Goals</Text>
            <TouchableOpacity onPress={() => setShowGoalModal(true)}>
              <Text style={styles.sectionAction}>Add Goal</Text>
            </TouchableOpacity>
          </View>
          <ScrollView horizontal showsHorizontalScrollIndicator={false}>
            {savingsGoals.map((goal, index) => renderSavingsGoal(goal, index))}
          </ScrollView>
        </View>

        <View style={{ height: spacing.md }} />
      </ScrollView>

      {/* Add Expense FAB */}
      <TouchableOpacity
        style={styles.fab}
        onPress={() => setShowExpenseModal(true)}
        activeOpacity={0.8}
      >
        <Text style={styles.fabText}>+ Add Expense</Text>
      </TouchableOpacity>
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.background,
  },
  header: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    paddingHorizontal: spacing.md,
    paddingTop: spacing.xl,
    paddingBottom: spacing.sm,
    backgroundColor: colors.white,
  },
  headerTitle: {
    fontSize: typography.fontSize.lg,
    fontWeight: typography.fontWeight.bold,
    color: colors.text,
  },
  offlineBadge: {
    backgroundColor: colors.warning + '20',
    paddingHorizontal: spacing.sm,
    paddingVertical: spacing.xs / 2,
    borderRadius: 8,
  },
  offlineBadgeText: {
    fontSize: typography.fontSize.xs,
    color: colors.warning,
    fontWeight: typography.fontWeight.bold,
  },
  periodToggle: {
    flexDirection: 'row',
    backgroundColor: colors.white,
    margin: spacing.md,
    borderRadius: 8,
    padding: spacing.xs / 2,
  },
  periodButton: {
    flex: 1,
    paddingVertical: spacing.sm,
    alignItems: 'center',
    borderRadius: 6,
  },
  periodButtonActive: {
    backgroundColor: colors.primary,
  },
  periodButtonText: {
    fontSize: typography.fontSize.sm,
    color: colors.textSecondary,
  },
  periodButtonTextActive: {
    color: colors.white,
    fontWeight: typography.fontWeight.bold,
  },
  scrollView: {
    flex: 1,
  },
  budgetSummary: {
    backgroundColor: colors.white,
    margin: spacing.md,
    padding: spacing.md,
    borderRadius: 12,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.05,
    shadowRadius: 2,
    elevation: 1,
  },
  budgetSummaryHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: spacing.md,
  },
  budgetSummaryTitle: {
    fontSize: typography.fontSize.md,
    fontWeight: typography.fontWeight.bold,
    color: colors.text,
  },
  budgetBadge: {
    paddingHorizontal: spacing.sm,
    paddingVertical: spacing.xs / 2,
    borderRadius: 12,
  },
  budgetBadgeText: {
    fontSize: typography.fontSize.xs,
    fontWeight: typography.fontWeight.bold,
  },
  budgetRow: {
    flexDirection: 'row',
    marginBottom: spacing.md,
    gap: spacing.md,
  },
  budgetItem: {
    flex: 1,
  },
  budgetItemLabel: {
    fontSize: typography.fontSize.xs,
    color: colors.textSecondary,
    marginBottom: spacing.xs / 2,
  },
  budgetItemValue: {
    fontSize: typography.fontSize.md,
    fontWeight: typography.fontWeight.bold,
  },
  remainingContainer: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    padding: spacing.sm,
    borderRadius: 8,
    borderWidth: 1,
  },
  remainingLabel: {
    fontSize: typography.fontSize.sm,
    color: colors.text,
    fontWeight: typography.fontWeight.medium,
  },
  remainingValue: {
    fontSize: typography.fontSize.lg,
    fontWeight: typography.fontWeight.bold,
  },
  trendsCard: {
    backgroundColor: colors.white,
    margin: spacing.md,
    marginTop: 0,
    padding: spacing.md,
    borderRadius: 12,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.05,
    shadowRadius: 2,
    elevation: 1,
  },
  chartContainer: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'flex-end',
    height: 120,
    marginTop: spacing.md,
  },
  barContainer: {
    flex: 1,
    alignItems: 'center',
  },
  barWrapper: {
    width: '80%',
    height: 100,
    justifyContent: 'flex-end',
  },
  bar: {
    width: '100%',
    borderTopLeftRadius: 4,
    borderTopRightRadius: 4,
  },
  barLabel: {
    fontSize: typography.fontSize.xs,
    color: colors.textSecondary,
    marginTop: spacing.xs / 2,
  },
  section: {
    marginTop: spacing.md,
  },
  sectionHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    paddingHorizontal: spacing.md,
    marginBottom: spacing.sm,
  },
  sectionTitle: {
    fontSize: typography.fontSize.md,
    fontWeight: typography.fontWeight.bold,
    color: colors.text,
  },
  sectionAction: {
    fontSize: typography.fontSize.sm,
    color: colors.primary,
    fontWeight: typography.fontWeight.bold,
  },
  categoryCard: {
    backgroundColor: colors.white,
    marginHorizontal: spacing.md,
    marginBottom: spacing.sm,
    padding: spacing.md,
    borderRadius: 12,
    borderWidth: 1,
    borderColor: colors.border,
  },
  categoryHeader: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: spacing.sm,
  },
  categoryIcon: {
    width: 32,
    height: 32,
    borderRadius: 8,
    justifyContent: 'center',
    alignItems: 'center',
    marginRight: spacing.sm,
  },
  categoryInfo: {
    flex: 1,
  },
  categoryName: {
    fontSize: typography.fontSize.sm,
    fontWeight: typography.fontWeight.bold,
    color: colors.text,
    marginBottom: spacing.xs / 2,
  },
  categoryAmount: {
    fontSize: typography.fontSize.xs,
    color: colors.textSecondary,
  },
  categoryStats: {
    alignItems: 'flex-end',
  },
  categoryPercentage: {
    fontSize: typography.fontSize.sm,
    fontWeight: typography.fontWeight.bold,
    marginBottom: spacing.xs / 2,
  },
  categoryRemaining: {
    fontSize: typography.fontSize.xs,
  },
  progressBar: {
    height: 6,
    backgroundColor: colors.gray200,
    borderRadius: 3,
  },
  progressFill: {
    height: '100%',
    borderRadius: 3,
  },
  goalCard: {
    backgroundColor: colors.white,
    width: width * 0.7,
    marginLeft: spacing.md,
    padding: spacing.md,
    borderRadius: 12,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.05,
    shadowRadius: 2,
    elevation: 1,
  },
  goalHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: spacing.xs,
  },
  goalName: {
    fontSize: typography.fontSize.md,
    fontWeight: typography.fontWeight.bold,
    color: colors.text,
  },
  goalPercentage: {
    fontSize: typography.fontSize.sm,
    fontWeight: typography.fontWeight.bold,
    color: colors.primary,
  },
  goalAmount: {
    fontSize: typography.fontSize.sm,
    color: colors.textSecondary,
    marginBottom: spacing.sm,
  },
  goalProgressBar: {
    height: 8,
    backgroundColor: colors.gray200,
    borderRadius: 4,
    marginBottom: spacing.sm,
  },
  goalProgressFill: {
    height: '100%',
    borderRadius: 4,
  },
  goalDate: {
    fontSize: typography.fontSize.xs,
    color: colors.textSecondary,
  },
  fab: {
    position: 'absolute',
    bottom: spacing.lg,
    left: spacing.md,
    right: spacing.md,
    backgroundColor: colors.primary,
    paddingVertical: spacing.md,
    borderRadius: 12,
    alignItems: 'center',
    shadowColor: colors.primary,
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.3,
    shadowRadius: 8,
    elevation: 6,
  },
  fabText: {
    color: colors.white,
    fontSize: typography.fontSize.md,
    fontWeight: typography.fontWeight.bold,
  },
});

export default BudgetScreen;

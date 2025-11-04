import React from 'react';
import { View, Text, StyleSheet, ScrollView, TouchableOpacity, StatusBar } from 'react-native';
import { LinearGradient } from 'expo-linear-gradient';
import { colors, spacing, typography } from '../../theme/theme';

const DashboardScreen = () => {
  return (
    <View style={styles.container}>
      <StatusBar barStyle="light-content" />
      
      {/* Header with Gradient */}
      <LinearGradient
        colors={[colors.primary, colors.primaryDark]}
        start={{ x: 0, y: 0 }}
        end={{ x: 1, y: 0 }}
        style={styles.header}
      >
        <Text style={styles.greeting}>Hello! 👋</Text>
        <Text style={styles.name}>Welcome back</Text>
        <Text style={styles.subtitle}>Let's continue your journey</Text>
      </LinearGradient>

      <ScrollView style={styles.scrollView} showsVerticalScrollIndicator={false}>
        {/* Stats Cards */}
        <View style={styles.statsContainer}>
          <View style={[styles.statCard, styles.statCardPrimary]}>
            <View style={styles.statIconContainer}>
              <Text style={styles.statIcon}>📚</Text>
            </View>
            <Text style={styles.statValue}>0</Text>
            <Text style={styles.statLabel}>Lessons Completed</Text>
          </View>
          
          <View style={[styles.statCard, styles.statCardAccent]}>
            <View style={styles.statIconContainer}>
              <Text style={styles.statIcon}>⭐</Text>
            </View>
            <Text style={styles.statValue}>0</Text>
            <Text style={styles.statLabel}>Points Earned</Text>
          </View>

          <View style={[styles.statCard, styles.statCardSuccess]}>
            <View style={styles.statIconContainer}>
              <Text style={styles.statIcon}>🔥</Text>
            </View>
            <Text style={styles.statValue}>0</Text>
            <Text style={styles.statLabel}>Day Streak</Text>
          </View>
        </View>

        {/* Quick Actions */}
        <View style={styles.section}>
          <Text style={styles.sectionTitle}>Quick Actions</Text>
          
          <TouchableOpacity style={styles.actionCard} activeOpacity={0.7}>
            <LinearGradient
              colors={[colors.learning, '#5FA8FF']}
              start={{ x: 0, y: 0 }}
              end={{ x: 1, y: 1 }}
              style={styles.actionGradient}
            >
              <View style={styles.actionContent}>
                <Text style={styles.actionIcon}>📚</Text>
                <View style={styles.actionText}>
                  <Text style={styles.actionTitle}>Start Learning</Text>
                  <Text style={styles.actionSubtitle}>Mental health & financial lessons</Text>
                </View>
              </View>
              <Text style={styles.actionArrow}>→</Text>
            </LinearGradient>
          </TouchableOpacity>

          <TouchableOpacity style={styles.actionCard} activeOpacity={0.7}>
            <LinearGradient
              colors={[colors.financial, '#00C9A7']}
              start={{ x: 0, y: 0 }}
              end={{ x: 1, y: 1 }}
              style={styles.actionGradient}
            >
              <View style={styles.actionContent}>
                <Text style={styles.actionIcon}>💰</Text>
                <View style={styles.actionText}>
                  <Text style={styles.actionTitle}>Track Budget</Text>
                  <Text style={styles.actionSubtitle}>Manage income and expenses</Text>
                </View>
              </View>
              <Text style={styles.actionArrow}>→</Text>
            </LinearGradient>
          </TouchableOpacity>

          <TouchableOpacity style={styles.actionCard} activeOpacity={0.7}>
            <LinearGradient
              colors={[colors.mentalHealth, '#B5A9FF']}
              start={{ x: 0, y: 0 }}
              end={{ x: 1, y: 1 }}
              style={styles.actionGradient}
            >
              <View style={styles.actionContent}>
                <Text style={styles.actionIcon}>💬</Text>
                <View style={styles.actionText}>
                  <Text style={styles.actionTitle}>AI Assistant</Text>
                  <Text style={styles.actionSubtitle}>Get instant support</Text>
                </View>
              </View>
              <Text style={styles.actionArrow}>→</Text>
            </LinearGradient>
          </TouchableOpacity>
        </View>

        {/* Emergency Support */}
        <TouchableOpacity style={styles.emergencyCard} activeOpacity={0.8}>
          <View style={styles.emergencyContent}>
            <Text style={styles.emergencyIcon}>🆘</Text>
            <View>
              <Text style={styles.emergencyTitle}>Need Help Now?</Text>
              <Text style={styles.emergencyText}>24/7 Crisis Support Available</Text>
            </View>
          </View>
        </TouchableOpacity>

        <View style={{ height: spacing.xxl }} />
      </ScrollView>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.background,
  },
  header: {
    paddingTop: spacing.xxl + 20,
    paddingBottom: spacing.xl,
    paddingHorizontal: spacing.xl,
  },
  greeting: {
    fontSize: typography.fontSize.lg,
    color: colors.white,
    opacity: 0.9,
    marginBottom: spacing.xs,
  },
  name: {
    fontSize: typography.fontSize.xxxl,
    fontWeight: typography.fontWeight.bold,
    color: colors.white,
    marginBottom: spacing.xs,
  },
  subtitle: {
    fontSize: typography.fontSize.md,
    color: colors.white,
    opacity: 0.95,
  },
  scrollView: {
    flex: 1,
    marginTop: -spacing.xl,
  },
  statsContainer: {
    flexDirection: 'row',
    paddingHorizontal: spacing.md,
    gap: spacing.sm,
    marginBottom: spacing.lg,
  },
  statCard: {
    flex: 1,
    backgroundColor: colors.white,
    padding: spacing.md,
    borderRadius: 16,
    alignItems: 'center',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.08,
    shadowRadius: 8,
    elevation: 3,
  },
  statCardPrimary: {
    borderTopWidth: 3,
    borderTopColor: colors.primary,
  },
  statCardAccent: {
    borderTopWidth: 3,
    borderTopColor: colors.accent,
  },
  statCardSuccess: {
    borderTopWidth: 3,
    borderTopColor: colors.warning,
  },
  statIconContainer: {
    width: 40,
    height: 40,
    borderRadius: 20,
    backgroundColor: colors.gray50,
    justifyContent: 'center',
    alignItems: 'center',
    marginBottom: spacing.sm,
  },
  statIcon: {
    fontSize: 20,
  },
  statValue: {
    fontSize: typography.fontSize.xxl,
    fontWeight: typography.fontWeight.bold,
    color: colors.text,
    marginBottom: spacing.xs,
  },
  statLabel: {
    fontSize: typography.fontSize.xs,
    color: colors.textSecondary,
    textAlign: 'center',
  },
  section: {
    paddingHorizontal: spacing.md,
    marginBottom: spacing.lg,
  },
  sectionTitle: {
    fontSize: typography.fontSize.xl,
    fontWeight: typography.fontWeight.bold,
    color: colors.text,
    marginBottom: spacing.md,
    paddingHorizontal: spacing.xs,
  },
  actionCard: {
    marginBottom: spacing.md,
    borderRadius: 16,
    overflow: 'hidden',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 3 },
    shadowOpacity: 0.15,
    shadowRadius: 8,
    elevation: 5,
  },
  actionGradient: {
    padding: spacing.lg,
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
  },
  actionContent: {
    flexDirection: 'row',
    alignItems: 'center',
    flex: 1,
  },
  actionIcon: {
    fontSize: 32,
    marginRight: spacing.md,
  },
  actionText: {
    flex: 1,
  },
  actionTitle: {
    fontSize: typography.fontSize.lg,
    fontWeight: typography.fontWeight.bold,
    color: colors.white,
    marginBottom: spacing.xs / 2,
  },
  actionSubtitle: {
    fontSize: typography.fontSize.sm,
    color: colors.white,
    opacity: 0.9,
  },
  actionArrow: {
    fontSize: 24,
    color: colors.white,
    fontWeight: typography.fontWeight.bold,
  },
  emergencyCard: {
    marginHorizontal: spacing.md,
    backgroundColor: colors.white,
    borderRadius: 16,
    padding: spacing.lg,
    borderLeftWidth: 4,
    borderLeftColor: colors.safety,
    shadowColor: colors.safety,
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.15,
    shadowRadius: 8,
    elevation: 4,
  },
  emergencyContent: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  emergencyIcon: {
    fontSize: 32,
    marginRight: spacing.md,
  },
  emergencyTitle: {
    fontSize: typography.fontSize.lg,
    fontWeight: typography.fontWeight.bold,
    color: colors.text,
    marginBottom: spacing.xs / 2,
  },
  emergencyText: {
    fontSize: typography.fontSize.sm,
    color: colors.textSecondary,
  },
});

export default DashboardScreen;

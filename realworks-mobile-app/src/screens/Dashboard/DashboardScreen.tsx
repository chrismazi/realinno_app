import React, { useState } from 'react';
import {
  View,
  Text,
  StyleSheet,
  ScrollView,
  TouchableOpacity,
  StatusBar,
  RefreshControl,
  Dimensions,
  Image,
} from 'react-native';
import { LinearGradient } from 'expo-linear-gradient';
import { colors, spacing, typography } from '../../theme/theme';
import { useNavigation } from '@react-navigation/native';

const { width } = Dimensions.get('window');

const DashboardScreen = () => {
  const navigation = useNavigation();
  const [refreshing, setRefreshing] = useState(false);

  const userData = {
    name: 'Amara Uwimana',
    currentStreak: 7,
    weeklyProgress: 65.0,
  };

  const todayLesson = {
    id: 1,
    title: 'Managing Daily Stress Through Mindful Breathing',
    description:
      'Learn simple breathing techniques that can help you stay calm and focused throughout your day, even during challenging moments.',
    category: 'Mindfulness',
    duration: 5,
    thumbnail: 'https://images.unsplash.com/photo-1616376392184-07997129a23e',
    isCompleted: false,
  };

  const budgetData = {
    totalBudget: 150000.0,
    spent: 89500.0,
    categories: [
      { name: 'Food', spent: 45000, budget: 60000 },
      { name: 'Transport', spent: 25000, budget: 40000 },
      { name: 'Family Support', spent: 19500, budget: 30000 },
    ],
  };

  const achievements = [
    {
      id: 1,
      title: '7-Day Streak',
      description: 'Completed lessons for 7 consecutive days',
      points: 50,
    },
    {
      id: 2,
      title: 'Mindfulness Master',
      description: 'Completed 5 mindfulness lessons',
      points: 30,
    },
  ];

  const onRefresh = async () => {
    setRefreshing(true);
    await new Promise(resolve => setTimeout(resolve, 1000));
    setRefreshing(false);
  };

  const getGreeting = () => {
    const hour = new Date().getHours();
    if (hour < 12) return 'Good morning,';
    if (hour < 17) return 'Good afternoon,';
    return 'Good evening,';
  };

  const formatCurrency = (amount: number) => {
    return `RWF ${amount.toFixed(0).replace(/\B(?=(\d{3})+(?!\d))/g, ',')}`;
  };

  return (
    <View style={styles.container}>
      <StatusBar barStyle="light-content" />
      
      {/* App Bar */}
      <View style={styles.appBar}>
        <View style={styles.appBarContent}>
          <Image
            source={{ uri: 'https://images.pexels.com/photos/8923194/pexels-photo-8923194.jpeg' }}
            style={styles.appLogo}
          />
          <Text style={styles.appName}>RealWorks</Text>
        </View>
        <TouchableOpacity style={styles.notificationIcon}>
          <View style={styles.notificationDot} />
        </TouchableOpacity>
      </View>

      <ScrollView
        style={styles.scrollView}
        showsVerticalScrollIndicator={false}
        refreshControl={
          <RefreshControl refreshing={refreshing} onRefresh={onRefresh} colors={[colors.primary]} />
        }
      >
        {/* Greeting Card */}
        <View style={styles.greetingCard}>
          <View style={styles.greetingHeader}>
            <View style={styles.greetingInfo}>
              <Text style={styles.greetingText}>{getGreeting()}</Text>
              <Text style={styles.userName}>{userData.name}</Text>
            </View>
            <TouchableOpacity style={styles.streakBadge}>
              <Text style={styles.streakNumber}>{userData.currentStreak}</Text>
            </TouchableOpacity>
          </View>
          <Text style={styles.progressLabel}>Weekly Progress</Text>
          <View style={styles.progressBar}>
            <View style={[styles.progressFill, { width: `${userData.weeklyProgress}%` }]} />
          </View>
          <Text style={styles.progressText}>{userData.weeklyProgress.toFixed(0)}% complete</Text>
        </View>

        {/* Today's Micro-Lesson */}
        <View style={styles.sectionHeader}>
          <Text style={styles.sectionTitle}>Today's Lesson</Text>
        </View>
        <TouchableOpacity style={styles.lessonCard} onPress={() => navigation.navigate('Lessons' as never)}>
          <Image source={{ uri: todayLesson.thumbnail }} style={styles.lessonImage} />
          <View style={styles.lessonOverlay}>
            <View style={styles.lessonDuration}>
              <Text style={styles.lessonDurationText}>{todayLesson.duration} min</Text>
            </View>
            <TouchableOpacity style={styles.playButton}>
              <Text style={styles.playIcon}>▶</Text>
            </TouchableOpacity>
          </View>
          <View style={styles.lessonContent}>
            <View style={styles.lessonCategoryBadge}>
              <Text style={styles.lessonCategoryText}>{todayLesson.category}</Text>
            </View>
            <Text style={styles.lessonTitle}>{todayLesson.title}</Text>
            <Text style={styles.lessonDescription} numberOfLines={2}>
              {todayLesson.description}
            </Text>
          </View>
        </TouchableOpacity>

        {/* Budget Summary */}
        <View style={styles.sectionHeader}>
          <Text style={styles.sectionTitle}>Budget Summary</Text>
          <TouchableOpacity onPress={() => navigation.navigate('Budget' as never)}>
            <Text style={styles.sectionAction}>View All</Text>
          </TouchableOpacity>
        </View>
        <View style={styles.budgetCard}>
          <View style={styles.budgetRow}>
            <View style={styles.budgetItem}>
              <Text style={styles.budgetLabel}>Total Budget</Text>
              <Text style={styles.budgetValue}>{formatCurrency(budgetData.totalBudget)}</Text>
            </View>
            <View style={styles.budgetItem}>
              <Text style={styles.budgetLabel}>Spent</Text>
              <Text style={[styles.budgetValue, { color: colors.error }]}>
                {formatCurrency(budgetData.spent)}
              </Text>
            </View>
          </View>
          <View style={styles.budgetProgress}>
            <View
              style={[
                styles.budgetProgressFill,
                { width: `${(budgetData.spent / budgetData.totalBudget) * 100}%` },
              ]}
            />
          </View>
        </View>

        {/* Achievements */}
        <View style={styles.sectionHeader}>
          <Text style={styles.sectionTitle}>Recent Achievements</Text>
        </View>
        <ScrollView horizontal showsHorizontalScrollIndicator={false} style={styles.achievementsScroll}>
          {achievements.map((achievement) => (
            <View key={achievement.id} style={styles.achievementCard}>
              <Text style={styles.achievementTitle}>{achievement.title}</Text>
              <Text style={styles.achievementDescription}>{achievement.description}</Text>
              <Text style={styles.achievementPoints}>+{achievement.points} points</Text>
            </View>
          ))}
        </ScrollView>

        {/* Quick Actions */}
        <View style={styles.sectionHeader}>
          <Text style={styles.sectionTitle}>Quick Actions</Text>
        </View>
        <View style={styles.quickActions}>
          <TouchableOpacity style={styles.quickActionButton}>
            <Text style={styles.quickActionText}>Crisis Support</Text>
          </TouchableOpacity>
          <TouchableOpacity style={styles.quickActionButton}>
            <Text style={styles.quickActionText}>Mood Log</Text>
          </TouchableOpacity>
          <TouchableOpacity style={styles.quickActionButton}>
          <Text style={styles.quickActionText}>Journal</Text>
          </TouchableOpacity>
        </View>

        <View style={{ height: 120 }} />
      </ScrollView>

      {/* Crisis FAB */}
      <TouchableOpacity style={styles.fab} activeOpacity={0.9}>
        <Text style={styles.fabText}>Crisis Support</Text>
      </TouchableOpacity>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.background,
  },
  appBar: {
    backgroundColor: colors.white,
    paddingHorizontal: spacing.md,
    paddingTop: spacing.xl,
    paddingBottom: spacing.sm,
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
  },
  appBarContent: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  appLogo: {
    width: 32,
    height: 32,
    borderRadius: 8,
  },
  appName: {
    fontSize: typography.fontSize.lg,
    fontWeight: typography.fontWeight.bold,
    color: colors.text,
    marginLeft: spacing.sm,
  },
  notificationIcon: {
    width: 40,
    height: 40,
    borderRadius: 20,
    backgroundColor: colors.gray100,
    justifyContent: 'center',
    alignItems: 'center',
  },
  notificationDot: {
    position: 'absolute',
    top: 8,
    right: 8,
    width: 8,
    height: 8,
    borderRadius: 4,
    backgroundColor: colors.error,
  },
  scrollView: {
    flex: 1,
  },
  greetingCard: {
    margin: spacing.md,
    padding: spacing.md,
    backgroundColor: colors.primarySoft,
    borderRadius: 12,
    borderWidth: 1,
    borderColor: colors.primary + '20',
  },
  greetingHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'flex-start',
    marginBottom: spacing.md,
  },
  greetingInfo: {
    flex: 1,
  },
  greetingText: {
    fontSize: typography.fontSize.sm,
    color: colors.textSecondary,
    marginBottom: spacing.xs / 2,
  },
  userName: {
    fontSize: typography.fontSize.lg,
    fontWeight: typography.fontWeight.bold,
    color: colors.text,
  },
  streakBadge: {
    backgroundColor: '#E8F8F5',
    paddingHorizontal: spacing.sm,
    paddingVertical: spacing.xs / 2,
    borderRadius: 8,
    borderWidth: 1,
    borderColor: colors.success + '30',
  },
  streakNumber: {
    fontSize: typography.fontSize.md,
    fontWeight: typography.fontWeight.bold,
    color: colors.success,
  },
  progressLabel: {
    fontSize: typography.fontSize.sm,
    color: colors.textSecondary,
    marginBottom: spacing.xs,
  },
  progressBar: {
    height: 8,
    backgroundColor: colors.gray200,
    borderRadius: 4,
    marginBottom: spacing.xs,
  },
  progressFill: {
    height: '100%',
    backgroundColor: colors.primary,
    borderRadius: 4,
  },
  progressText: {
    fontSize: typography.fontSize.xs,
    color: colors.textSecondary,
  },
  sectionHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    paddingHorizontal: spacing.md,
    marginTop: spacing.md,
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
  lessonCard: {
    marginHorizontal: spacing.md,
    backgroundColor: colors.white,
    borderRadius: 12,
    overflow: 'hidden',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.05,
    shadowRadius: 2,
    elevation: 1,
  },
  lessonImage: {
    width: '100%',
    height: 160,
  },
  lessonOverlay: {
    position: 'absolute',
    top: 0,
    left: 0,
    right: 0,
    height: 160,
    justifyContent: 'space-between',
    padding: spacing.sm,
  },
  lessonDuration: {
    alignSelf: 'flex-end',
    backgroundColor: 'rgba(0,0,0,0.7)',
    paddingHorizontal: spacing.sm,
    paddingVertical: spacing.xs / 2,
    borderRadius: 6,
  },
  lessonDurationText: {
    color: colors.white,
    fontSize: typography.fontSize.xs,
    fontWeight: typography.fontWeight.medium,
  },
  playButton: {
    alignSelf: 'flex-end',
    width: 48,
    height: 48,
    borderRadius: 24,
    backgroundColor: colors.primary,
    justifyContent: 'center',
    alignItems: 'center',
    shadowColor: colors.primary,
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.3,
    shadowRadius: 4,
    elevation: 3,
  },
  playIcon: {
    color: colors.white,
    fontSize: 16,
    marginLeft: 2,
  },
  lessonContent: {
    padding: spacing.md,
  },
  lessonCategoryBadge: {
    alignSelf: 'flex-start',
    backgroundColor: colors.primarySoft,
    paddingHorizontal: spacing.sm,
    paddingVertical: spacing.xs / 2,
    borderRadius: 6,
    marginBottom: spacing.xs,
  },
  lessonCategoryText: {
    color: colors.primary,
    fontSize: typography.fontSize.xs,
    fontWeight: typography.fontWeight.medium,
  },
  lessonTitle: {
    fontSize: typography.fontSize.md,
    fontWeight: typography.fontWeight.bold,
    color: colors.text,
    marginBottom: spacing.xs / 2,
  },
  lessonDescription: {
    fontSize: typography.fontSize.sm,
    color: colors.textSecondary,
    lineHeight: 18,
  },
  budgetCard: {
    marginHorizontal: spacing.md,
    backgroundColor: colors.white,
    padding: spacing.md,
    borderRadius: 12,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.05,
    shadowRadius: 2,
    elevation: 1,
  },
  budgetRow: {
    flexDirection: 'row',
    marginBottom: spacing.sm,
    gap: spacing.md,
  },
  budgetItem: {
    flex: 1,
  },
  budgetLabel: {
    fontSize: typography.fontSize.xs,
    color: colors.textSecondary,
    marginBottom: spacing.xs / 2,
  },
  budgetValue: {
    fontSize: typography.fontSize.md,
    fontWeight: typography.fontWeight.bold,
    color: colors.success,
  },
  budgetProgress: {
    height: 6,
    backgroundColor: colors.gray200,
    borderRadius: 3,
  },
  budgetProgressFill: {
    height: '100%',
    backgroundColor: colors.error,
    borderRadius: 3,
  },
  achievementsScroll: {
    paddingLeft: spacing.md,
  },
  achievementCard: {
    backgroundColor: colors.white,
    padding: spacing.md,
    borderRadius: 12,
    marginRight: spacing.sm,
    width: width * 0.6,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.05,
    shadowRadius: 2,
    elevation: 1,
  },
  achievementTitle: {
    fontSize: typography.fontSize.sm,
    fontWeight: typography.fontWeight.bold,
    color: colors.text,
    marginBottom: spacing.xs / 2,
  },
  achievementDescription: {
    fontSize: typography.fontSize.xs,
    color: colors.textSecondary,
    marginBottom: spacing.xs,
  },
  achievementPoints: {
    fontSize: typography.fontSize.xs,
    color: colors.primary,
    fontWeight: typography.fontWeight.bold,
  },
  quickActions: {
    flexDirection: 'row',
    paddingHorizontal: spacing.md,
    gap: spacing.sm,
  },
  quickActionButton: {
    flex: 1,
    backgroundColor: colors.white,
    paddingVertical: spacing.sm,
    borderRadius: 8,
    alignItems: 'center',
    borderWidth: 1,
    borderColor: colors.border,
  },
  quickActionText: {
    fontSize: typography.fontSize.xs,
    color: colors.text,
    fontWeight: typography.fontWeight.medium,
  },
  fab: {
    position: 'absolute',
    bottom: spacing.xl,
    left: spacing.md,
    right: spacing.md,
    backgroundColor: colors.error,
    paddingVertical: spacing.md,
    borderRadius: 12,
    alignItems: 'center',
    shadowColor: colors.error,
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

export default DashboardScreen;

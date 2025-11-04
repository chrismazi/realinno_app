import React, { useEffect, useRef } from 'react';
import {
  View,
  Text,
  ScrollView,
  TouchableOpacity,
  Animated,
  Dimensions,
  StyleSheet,
} from 'react-native';
import { LinearGradient } from 'expo-linear-gradient';
import { Ionicons } from '@expo/vector-icons';
import { SafeAreaView } from 'react-native-safe-area-context';

const { width } = Dimensions.get('window');

const DashboardScreenEnhanced = () => {
  // Animation values
  const fadeAnim = useRef(new Animated.Value(0)).current;
  const slideAnim = useRef(new Animated.Value(50)).current;
  const scaleAnim = useRef(new Animated.Value(0.9)).current;
  
  const card1 = useRef(new Animated.Value(0)).current;
  const card2 = useRef(new Animated.Value(0)).current;
  const card3 = useRef(new Animated.Value(0)).current;
  const card4 = useRef(new Animated.Value(0)).current;

  useEffect(() => {
    // Staggered entrance animations
    Animated.parallel([
      Animated.timing(fadeAnim, {
        toValue: 1,
        duration: 600,
        useNativeDriver: true,
      }),
      Animated.spring(slideAnim, {
        toValue: 0,
        tension: 50,
        friction: 8,
        useNativeDriver: true,
      }),
      Animated.spring(scaleAnim, {
        toValue: 1,
        tension: 50,
        friction: 7,
        useNativeDriver: true,
      }),
    ]).start();

    // Card stagger animations
    const staggerDelay = 100;
    Animated.stagger(staggerDelay, [
      Animated.spring(card1, {
        toValue: 1,
        tension: 50,
        friction: 7,
        useNativeDriver: true,
      }),
      Animated.spring(card2, {
        toValue: 1,
        tension: 50,
        friction: 7,
        useNativeDriver: true,
      }),
      Animated.spring(card3, {
        toValue: 1,
        tension: 50,
        friction: 7,
        useNativeDriver: true,
      }),
      Animated.spring(card4, {
        toValue: 1,
        tension: 50,
        friction: 7,
        useNativeDriver: true,
      }),
    ]).start();
  }, []);

  const cardStyle = (animValue: Animated.Value) => ({
    opacity: animValue,
    transform: [
      {
        translateY: animValue.interpolate({
          inputRange: [0, 1],
          outputRange: [30, 0],
        }),
      },
      {
        scale: animValue.interpolate({
          inputRange: [0, 1],
          outputRange: [0.9, 1],
        }),
      },
    ],
  });

  return (
    <SafeAreaView style={styles.container} edges={['top']}>
      <ScrollView
        showsVerticalScrollIndicator={false}
        contentContainerStyle={styles.scrollContent}
      >
        {/* Gradient Header */}
        <LinearGradient
          colors={['#F57C3D', '#FF9E6B']}
          start={{ x: 0, y: 0 }}
          end={{ x: 1, y: 1 }}
          style={styles.header}
        >
          <Animated.View
            style={[
              styles.headerContent,
              {
                opacity: fadeAnim,
                transform: [{ translateY: slideAnim }],
              },
            ]}
          >
            <View>
              <Text style={styles.greeting}>Good Morning! ☀️</Text>
              <Text style={styles.username}>Welcome Back</Text>
            </View>
            <TouchableOpacity style={styles.notificationButton}>
              <Ionicons name="notifications-outline" size={24} color="#FFF" />
              <View style={styles.notificationBadge}>
                <Text style={styles.badgeText}>3</Text>
              </View>
            </TouchableOpacity>
          </Animated.View>

          {/* Mental Health Score Card */}
          <Animated.View style={[styles.scoreCard, cardStyle(card1)]}>
            <View style={styles.scoreCardContent}>
              <View>
                <Text style={styles.scoreLabel}>Mental Wellness Score</Text>
                <View style={styles.scoreRow}>
                  <Text style={styles.scoreValue}>8.5</Text>
                  <Text style={styles.scoreMax}>/10</Text>
                </View>
                <Text style={styles.scoreStatus}>
                  🎉 Great! Keep it up
                </Text>
              </View>
              <View style={styles.scoreCircle}>
                <Text style={styles.scoreEmoji}>😊</Text>
              </View>
            </View>
            
            {/* Progress Bar */}
            <View style={styles.progressBar}>
              <View style={[styles.progressFill, { width: '85%' }]} />
            </View>
          </Animated.View>
        </LinearGradient>

        {/* Quick Stats */}
        <View style={styles.section}>
          <Text style={styles.sectionTitle}>Quick Stats</Text>
          <View style={styles.statsGrid}>
            <Animated.View style={[styles.statCard, cardStyle(card2)]}>
              <LinearGradient
                colors={['#A29BFE', '#B8B1FF']}
                style={styles.statGradient}
              >
                <Ionicons name="book-outline" size={28} color="#FFF" />
                <Text style={styles.statValue}>12</Text>
                <Text style={styles.statLabel}>Lessons</Text>
              </LinearGradient>
            </Animated.View>

            <Animated.View style={[styles.statCard, cardStyle(card2)]}>
              <LinearGradient
                colors={['#00B894', '#55EFC4']}
                style={styles.statGradient}
              >
                <Ionicons name="wallet-outline" size={28} color="#FFF" />
                <Text style={styles.statValue}>75K</Text>
                <Text style={styles.statLabel}>Saved</Text>
              </LinearGradient>
            </Animated.View>

            <Animated.View style={[styles.statCard, cardStyle(card2)]}>
              <LinearGradient
                colors={['#FF7675', '#FF9A99']}
                style={styles.statGradient}
              >
                <Ionicons name="flame-outline" size={28} color="#FFF" />
                <Text style={styles.statValue}>7</Text>
                <Text style={styles.statLabel}>Day Streak</Text>
              </LinearGradient>
            </Animated.View>
          </View>
        </View>

        {/* Today's Lesson */}
        <View style={styles.section}>
          <View style={styles.sectionHeader}>
            <Text style={styles.sectionTitle}>Today's Lesson</Text>
            <TouchableOpacity>
              <Text style={styles.seeAll}>See All →</Text>
            </TouchableOpacity>
          </View>
          
          <Animated.View style={[styles.lessonCard, cardStyle(card3)]}>
            <LinearGradient
              colors={['#74B9FF', '#A8D8FF']}
              start={{ x: 0, y: 0 }}
              end={{ x: 1, y: 1 }}
              style={styles.lessonGradient}
            >
              <View style={styles.lessonBadge}>
                <Text style={styles.lessonBadgeText}>NEW</Text>
              </View>
              <Text style={styles.lessonTitle}>
                Managing Stress Through Mindfulness
              </Text>
              <Text style={styles.lessonMeta}>
                <Ionicons name="time-outline" size={14} /> 15 min  •  Mental Health
              </Text>
              <TouchableOpacity style={styles.startButton}>
                <Text style={styles.startButtonText}>Start Lesson</Text>
                <Ionicons name="arrow-forward" size={18} color="#74B9FF" />
              </TouchableOpacity>
            </LinearGradient>
          </Animated.View>
        </View>

        {/* Budget Summary */}
        <View style={styles.section}>
          <View style={styles.sectionHeader}>
            <Text style={styles.sectionTitle}>Budget This Month</Text>
            <TouchableOpacity>
              <Text style={styles.seeAll}>Details →</Text>
            </TouchableOpacity>
          </View>

          <Animated.View style={[styles.budgetCard, cardStyle(card4)]}>
            <View style={styles.budgetRow}>
              <View style={styles.budgetItem}>
                <View style={[styles.budgetIcon, { backgroundColor: '#E8F5E9' }]}>
                  <Ionicons name="arrow-down" size={20} color="#00B894" />
                </View>
                <Text style={styles.budgetLabel}>Income</Text>
                <Text style={[styles.budgetAmount, { color: '#00B894' }]}>
                  150,000 RWF
                </Text>
              </View>

              <View style={styles.budgetDivider} />

              <View style={styles.budgetItem}>
                <View style={[styles.budgetIcon, { backgroundColor: '#FFEBEE' }]}>
                  <Ionicons name="arrow-up" size={20} color="#FF7675" />
                </View>
                <Text style={styles.budgetLabel}>Expenses</Text>
                <Text style={[styles.budgetAmount, { color: '#FF7675' }]}>
                  87,500 RWF
                </Text>
              </View>
            </View>

            <View style={styles.savingsRow}>
              <Text style={styles.savingsLabel}>Total Savings</Text>
              <Text style={styles.savingsAmount}>62,500 RWF</Text>
            </View>
          </Animated.View>
        </View>

        {/* Recent Achievements */}
        <View style={[styles.section, styles.lastSection]}>
          <Text style={styles.sectionTitle}>Recent Achievements 🏆</Text>
          
          {[
            { icon: '🔥', title: '7 Day Streak', desc: 'Completed lessons for 7 days' },
            { icon: '💰', title: 'Savings Goal', desc: 'Saved 50,000 RWF this month' },
            { icon: '📚', title: 'Quick Learner', desc: 'Completed 10 lessons' },
          ].map((achievement, index) => (
            <Animated.View
              key={index}
              style={[
                styles.achievementItem,
                cardStyle(card4),
              ]}
            >
              <View style={styles.achievementIcon}>
                <Text style={styles.achievementEmoji}>{achievement.icon}</Text>
              </View>
              <View style={styles.achievementContent}>
                <Text style={styles.achievementTitle}>{achievement.title}</Text>
                <Text style={styles.achievementDesc}>{achievement.desc}</Text>
              </View>
              <Ionicons name="chevron-forward" size={20} color="#9CA3AF" />
            </Animated.View>
          ))}
        </View>
      </ScrollView>
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#FAFBFC',
  },
  scrollContent: {
    paddingBottom: 100,
  },
  header: {
    paddingHorizontal: 20,
    paddingTop: 20,
    paddingBottom: 100,
    borderBottomLeftRadius: 30,
    borderBottomRightRadius: 30,
  },
  headerContent: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: 24,
  },
  greeting: {
    fontSize: 14,
    color: '#FFF',
    opacity: 0.9,
    fontWeight: '500',
  },
  username: {
    fontSize: 28,
    fontWeight: '700',
    color: '#FFF',
    marginTop: 4,
  },
  notificationButton: {
    width: 44,
    height: 44,
    borderRadius: 22,
    backgroundColor: 'rgba(255,255,255,0.2)',
    justifyContent: 'center',
    alignItems: 'center',
  },
  notificationBadge: {
    position: 'absolute',
    top: 8,
    right: 8,
    width: 16,
    height: 16,
    borderRadius: 8,
    backgroundColor: '#FF7675',
    justifyContent: 'center',
    alignItems: 'center',
  },
  badgeText: {
    fontSize: 10,
    fontWeight: '700',
    color: '#FFF',
  },
  scoreCard: {
    backgroundColor: '#FFF',
    borderRadius: 20,
    padding: 20,
    marginTop: -60,
    marginHorizontal: 20,
    shadowColor: '#F57C3D',
    shadowOffset: { width: 0, height: 8 },
    shadowOpacity: 0.15,
    shadowRadius: 16,
    elevation: 8,
  },
  scoreCardContent: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: 16,
  },
  scoreLabel: {
    fontSize: 14,
    color: '#636E72',
    fontWeight: '500',
  },
  scoreRow: {
    flexDirection: 'row',
    alignItems: 'baseline',
    marginTop: 8,
  },
  scoreValue: {
    fontSize: 36,
    fontWeight: '800',
    color: '#2D3436',
  },
  scoreMax: {
    fontSize: 20,
    color: '#9CA3AF',
    fontWeight: '600',
    marginLeft: 4,
  },
  scoreStatus: {
    fontSize: 14,
    color: '#00B894',
    fontWeight: '600',
    marginTop: 4,
  },
  scoreCircle: {
    width: 70,
    height: 70,
    borderRadius: 35,
    backgroundColor: '#FFF4ED',
    justifyContent: 'center',
    alignItems: 'center',
  },
  scoreEmoji: {
    fontSize: 36,
  },
  progressBar: {
    height: 6,
    backgroundColor: '#F5F6F7',
    borderRadius: 3,
    overflow: 'hidden',
  },
  progressFill: {
    height: '100%',
    backgroundColor: '#F57C3D',
    borderRadius: 3,
  },
  section: {
    marginTop: 32,
    paddingHorizontal: 20,
  },
  lastSection: {
    marginBottom: 20,
  },
  sectionHeader: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginBottom: 16,
  },
  sectionTitle: {
    fontSize: 20,
    fontWeight: '700',
    color: '#2D3436',
  },
  seeAll: {
    fontSize: 14,
    color: '#F57C3D',
    fontWeight: '600',
  },
  statsGrid: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    gap: 12,
  },
  statCard: {
    flex: 1,
    borderRadius: 16,
    overflow: 'hidden',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.1,
    shadowRadius: 8,
    elevation: 4,
  },
  statGradient: {
    padding: 16,
    alignItems: 'center',
  },
  statValue: {
    fontSize: 24,
    fontWeight: '800',
    color: '#FFF',
    marginTop: 8,
  },
  statLabel: {
    fontSize: 12,
    color: '#FFF',
    opacity: 0.9,
    fontWeight: '600',
    marginTop: 4,
  },
  lessonCard: {
    borderRadius: 20,
    overflow: 'hidden',
    shadowColor: '#74B9FF',
    shadowOffset: { width: 0, height: 8 },
    shadowOpacity: 0.2,
    shadowRadius: 16,
    elevation: 8,
  },
  lessonGradient: {
    padding: 20,
  },
  lessonBadge: {
    alignSelf: 'flex-start',
    backgroundColor: 'rgba(255,255,255,0.9)',
    paddingHorizontal: 12,
    paddingVertical: 4,
    borderRadius: 12,
    marginBottom: 12,
  },
  lessonBadgeText: {
    fontSize: 11,
    fontWeight: '700',
    color: '#74B9FF',
  },
  lessonTitle: {
    fontSize: 20,
    fontWeight: '700',
    color: '#FFF',
    marginBottom: 8,
  },
  lessonMeta: {
    fontSize: 14,
    color: '#FFF',
    opacity: 0.9,
    marginBottom: 16,
  },
  startButton: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: '#FFF',
    paddingHorizontal: 20,
    paddingVertical: 12,
    borderRadius: 25,
    alignSelf: 'flex-start',
    gap: 8,
  },
  startButtonText: {
    fontSize: 15,
    fontWeight: '700',
    color: '#74B9FF',
  },
  budgetCard: {
    backgroundColor: '#FFF',
    borderRadius: 20,
    padding: 20,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.08,
    shadowRadius: 12,
    elevation: 4,
  },
  budgetRow: {
    flexDirection: 'row',
    marginBottom: 20,
  },
  budgetItem: {
    flex: 1,
    alignItems: 'center',
  },
  budgetIcon: {
    width: 48,
    height: 48,
    borderRadius: 24,
    justifyContent: 'center',
    alignItems: 'center',
    marginBottom: 8,
  },
  budgetLabel: {
    fontSize: 13,
    color: '#9CA3AF',
    fontWeight: '500',
    marginBottom: 4,
  },
  budgetAmount: {
    fontSize: 16,
    fontWeight: '700',
  },
  budgetDivider: {
    width: 1,
    backgroundColor: '#E8EAED',
    marginHorizontal: 16,
  },
  savingsRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
    paddingTop: 20,
    borderTopWidth: 1,
    borderTopColor: '#E8EAED',
  },
  savingsLabel: {
    fontSize: 15,
    color: '#636E72',
    fontWeight: '600',
  },
  savingsAmount: {
    fontSize: 20,
    fontWeight: '800',
    color: '#00B894',
  },
  achievementItem: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: '#FFF',
    padding: 16,
    borderRadius: 16,
    marginBottom: 12,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.05,
    shadowRadius: 8,
    elevation: 2,
  },
  achievementIcon: {
    width: 50,
    height: 50,
    borderRadius: 25,
    backgroundColor: '#FFF4ED',
    justifyContent: 'center',
    alignItems: 'center',
    marginRight: 16,
  },
  achievementEmoji: {
    fontSize: 24,
  },
  achievementContent: {
    flex: 1,
  },
  achievementTitle: {
    fontSize: 16,
    fontWeight: '700',
    color: '#2D3436',
    marginBottom: 4,
  },
  achievementDesc: {
    fontSize: 13,
    color: '#9CA3AF',
  },
});

export default DashboardScreenEnhanced;

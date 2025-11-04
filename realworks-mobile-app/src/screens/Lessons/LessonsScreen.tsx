import React, { useState, useRef, useEffect } from 'react';
import {
  View,
  Text,
  StyleSheet,
  ScrollView,
  TextInput,
  TouchableOpacity,
  FlatList,
  Dimensions,
  Modal,
  Image,
  ActivityIndicator,
  StatusBar,
} from 'react-native';
import { SafeAreaView, useSafeAreaInsets } from 'react-native-safe-area-context';
import { colors, spacing, typography } from '../../theme/theme';
import { useLocale } from '../../context/LocaleContext';

const { width } = Dimensions.get('window');

interface Lesson {
  id: string;
  title: string;
  description: string;
  thumbnail: string;
  thumbnailSemanticLabel: string;
  duration: string;
  difficulty: string;
  formats: string[];
  isCompleted: boolean;
  isDownloaded: boolean;
  progress: number;
  category: string;
}

const LessonsScreen = () => {
  const { t } = useLocale();
  const insets = useSafeAreaInsets();
  const [selectedTab, setSelectedTab] = useState(0);
  const [searchQuery, setSearchQuery] = useState('');
  const [selectedFilter, setSelectedFilter] = useState('All');
  const [showDownloadManager, setShowDownloadManager] = useState(false);
  
  const categories = ['Mental Health', 'Financial Literacy', 'Crisis Coping'];
  const filters = ['All', 'New', 'In Progress', 'Completed', 'Downloaded'];

  // Mock data - Mental Health Lessons
  const mentalHealthLessons: Lesson[] = [
    {
      id: 'mh_001',
      title: 'Understanding Anxiety: Your Mind\'s Alarm System',
      description: 'Learn how anxiety works in your brain and discover practical techniques to manage overwhelming feelings.',
      thumbnail: 'https://images.pexels.com/photos/3807738/pexels-photo-3807738.jpeg?auto=compress&cs=tinysrgb&w=800',
      thumbnailSemanticLabel: 'Person sitting peacefully in meditation pose',
      duration: '8 min',
      difficulty: 'Beginner',
      formats: ['text', 'audio'],
      isCompleted: false,
      isDownloaded: true,
      progress: 0.3,
      category: 'Mental Health',
    },
    {
      id: 'mh_002',
      title: 'Building Daily Mindfulness Habits',
      description: 'Simple mindfulness exercises you can practice anywhere to reduce stress and improve focus.',
      thumbnail: 'https://images.unsplash.com/photo-1679771650989-1d79c12c79a9',
      thumbnailSemanticLabel: 'Close-up of hands in meditation mudra position',
      duration: '12 min',
      difficulty: 'Beginner',
      formats: ['text', 'audio', 'video'],
      isCompleted: true,
      isDownloaded: false,
      progress: 1.0,
      category: 'Mental Health',
    },
    {
      id: 'mh_003',
      title: 'Healthy Boundaries in Relationships',
      description: 'Learn to set and maintain healthy boundaries while preserving meaningful connections.',
      thumbnail: 'https://images.unsplash.com/photo-1693244479819-6fb9c7c1e0e5',
      thumbnailSemanticLabel: 'Two people having a calm conversation',
      duration: '15 min',
      difficulty: 'Intermediate',
      formats: ['text', 'video'],
      isCompleted: false,
      isDownloaded: false,
      progress: 0.0,
      category: 'Mental Health',
    },
    {
      id: 'mh_004',
      title: 'Sleep Hygiene for Better Mental Health',
      description: 'Discover how quality sleep impacts your mental wellbeing and learn practical sleep improvement strategies.',
      thumbnail: 'https://images.unsplash.com/photo-1653204095671-3ed81a4bc561',
      thumbnailSemanticLabel: 'Peaceful bedroom scene with soft lighting',
      duration: '10 min',
      difficulty: 'Beginner',
      formats: ['text', 'audio'],
      isCompleted: false,
      isDownloaded: true,
      progress: 0.6,
      category: 'Mental Health',
    },
  ];

  // Mock data - Financial Literacy Lessons
  const financialLiteracyLessons: Lesson[] = [
    {
      id: 'fl_001',
      title: 'Creating Your First Budget',
      description: 'Step-by-step guide to building a realistic budget that works for your lifestyle and goals.',
      thumbnail: 'https://images.unsplash.com/photo-1579488086113-cdc707216326',
      thumbnailSemanticLabel: 'Person writing in a budget planner',
      duration: '18 min',
      difficulty: 'Beginner',
      formats: ['text', 'video'],
      isCompleted: false,
      isDownloaded: false,
      progress: 0.0,
      category: 'Financial Literacy',
    },
    {
      id: 'fl_002',
      title: 'Emergency Fund Essentials',
      description: 'Learn why emergency funds matter and how to build one even on a tight budget.',
      thumbnail: 'https://images.unsplash.com/photo-1578091436046-ecd3f4fe6992',
      thumbnailSemanticLabel: 'Glass jar filled with coins',
      duration: '14 min',
      difficulty: 'Beginner',
      formats: ['text', 'audio'],
      isCompleted: true,
      isDownloaded: true,
      progress: 1.0,
      category: 'Financial Literacy',
    },
    {
      id: 'fl_003',
      title: 'Understanding Mobile Money Safety',
      description: 'Essential security tips for using mobile money services safely and avoiding common scams.',
      thumbnail: 'https://images.unsplash.com/photo-1584433144859-1fc3ab64a957',
      thumbnailSemanticLabel: 'Smartphone displaying mobile banking app',
      duration: '12 min',
      difficulty: 'Intermediate',
      formats: ['text', 'video'],
      isCompleted: false,
      isDownloaded: false,
      progress: 0.4,
      category: 'Financial Literacy',
    },
  ];

  // Mock data - Crisis Coping Lessons
  const crisisCopingLessons: Lesson[] = [
    {
      id: 'cc_001',
      title: 'Immediate Anxiety Relief Techniques',
      description: 'Quick, effective methods to calm yourself during panic attacks or overwhelming anxiety.',
      thumbnail: 'https://images.unsplash.com/photo-1720873160840-d5934323bb23',
      thumbnailSemanticLabel: 'Person practicing deep breathing exercises',
      duration: '6 min',
      difficulty: 'Beginner',
      formats: ['text', 'audio'],
      isCompleted: false,
      isDownloaded: true,
      progress: 0.0,
      category: 'Crisis Coping',
    },
    {
      id: 'cc_002',
      title: 'When to Seek Professional Help',
      description: 'Recognize warning signs and learn how to access mental health support in your community.',
      thumbnail: 'https://images.unsplash.com/photo-1714976694895-d38078c1a3c0',
      thumbnailSemanticLabel: 'Supportive counseling session',
      duration: '20 min',
      difficulty: 'Intermediate',
      formats: ['text', 'video'],
      isCompleted: false,
      isDownloaded: false,
      progress: 0.0,
      category: 'Crisis Coping',
    },
  ];

  const [downloadQueue, setDownloadQueue] = useState([
    { lessonId: 'mh_003', title: 'Healthy Boundaries in Relationships', progress: 0.65, status: 'downloading', size: '45 MB' },
    { lessonId: 'fl_001', title: 'Creating Your First Budget', progress: 0.0, status: 'paused', size: '78 MB' },
  ]);

  const getCurrentLessons = () => {
    switch (selectedTab) {
      case 0:
        return mentalHealthLessons;
      case 1:
        return financialLiteracyLessons;
      case 2:
        return crisisCopingLessons;
      default:
        return mentalHealthLessons;
    }
  };

  const getFilteredLessons = () => {
    let lessons = getCurrentLessons();

    if (searchQuery) {
      lessons = lessons.filter((lesson) =>
        lesson.title.toLowerCase().includes(searchQuery.toLowerCase()) ||
        lesson.description.toLowerCase().includes(searchQuery.toLowerCase())
      );
    }

    switch (selectedFilter) {
      case 'New':
        lessons = lessons.filter((l) => l.progress === 0 && !l.isCompleted);
        break;
      case 'In Progress':
        lessons = lessons.filter((l) => l.progress > 0 && !l.isCompleted);
        break;
      case 'Completed':
        lessons = lessons.filter((l) => l.isCompleted);
        break;
      case 'Downloaded':
        lessons = lessons.filter((l) => l.isDownloaded);
        break;
    }

    return lessons;
  };

  const getOverallProgress = () => {
    const lessons = getCurrentLessons();
    if (lessons.length === 0) return 0;
    const totalProgress = lessons.reduce((sum, lesson) => sum + lesson.progress, 0);
    return totalProgress / lessons.length;
  };

  const getCompletedLessons = () => {
    return getCurrentLessons().filter((l) => l.isCompleted).length;
  };

  const renderLessonCard = ({ item }: { item: Lesson }) => (
    <TouchableOpacity style={styles.lessonCard} activeOpacity={0.8}>
      <Image source={{ uri: item.thumbnail }} style={styles.lessonThumbnail} />
      <View style={styles.lessonContent}>
        <Text style={styles.lessonTitle}>{item.title}</Text>
        <Text style={styles.lessonDescription} numberOfLines={2}>{item.description}</Text>
        <View style={styles.lessonMeta}>
          <Text style={styles.lessonDuration}>{item.duration}</Text>
          <Text style={styles.lessonDifficulty}>{item.difficulty}</Text>
        </View>
        {item.progress > 0 && (
          <View style={styles.progressBar}>
            <View style={[styles.progressFill, { width: `${item.progress * 100}%` }]} />
          </View>
        )}
      </View>
      {item.isDownloaded && (
        <View style={styles.downloadBadge}>
          <Text style={styles.downloadBadgeText}>↓</Text>
        </View>
      )}
      {item.isCompleted && (
        <View style={styles.completedBadge}>
          <Text style={styles.completedBadgeText}>✓</Text>
        </View>
      )}
    </TouchableOpacity>
  );

  const filteredLessons = getFilteredLessons();

  return (
    <SafeAreaView style={styles.container} edges={['top','bottom']}>
      <StatusBar barStyle="dark-content" backgroundColor={colors.white} />
      
      {/* Header */}
      <View style={[styles.header, { paddingTop: insets.top + spacing.sm }]}>
        <Text style={styles.headerTitle}>Micro Lessons</Text>
        <TouchableOpacity onPress={() => setShowDownloadManager(!showDownloadManager)}>
          <View style={styles.downloadIcon}>
            <Text>↓</Text>
            {downloadQueue.length > 0 && (
              <View style={styles.downloadBadgeCount}>
                <Text style={styles.downloadBadgeCountText}>{downloadQueue.length}</Text>
              </View>
            )}
          </View>
        </TouchableOpacity>
      </View>

      {/* Category Tabs */}
      <View style={styles.tabs}>
        {categories.map((category, index) => (
          <TouchableOpacity
            key={index}
            style={[styles.tab, selectedTab === index && styles.tabActive]}
            onPress={() => {
              setSelectedTab(index);
              setSelectedFilter('All');
              setSearchQuery('');
            }}
          >
            <Text style={[styles.tabText, selectedTab === index && styles.tabTextActive]}>
              {category}
            </Text>
          </TouchableOpacity>
        ))}
      </View>

      {/* Progress Header */}
      <View style={styles.progressHeader}>
        <Text style={styles.progressCategory}>{categories[selectedTab]}</Text>
        <View style={styles.progressStats}>
          <Text style={styles.progressText}>
            {getCompletedLessons()}/{getCurrentLessons().length} Completed
          </Text>
          <View style={styles.overallProgressBar}>
            <View style={[styles.overallProgressFill, { width: `${getOverallProgress() * 100}%` }]} />
          </View>
        </View>
      </View>

      {/* Search Bar */}
      <View style={styles.searchContainer}>
        <TextInput
          style={styles.searchInput}
          placeholder={`Search ${categories[selectedTab]} lessons...`}
          value={searchQuery}
          onChangeText={setSearchQuery}
        />
      </View>

      {/* Filter Chips */}
      <ScrollView horizontal showsHorizontalScrollIndicator={false} style={styles.filterContainer}>
        {filters.map((filter) => (
          <TouchableOpacity
            key={filter}
            style={[styles.filterChip, selectedFilter === filter && styles.filterChipActive]}
            onPress={() => setSelectedFilter(filter)}
          >
            <Text style={[styles.filterChipText, selectedFilter === filter && styles.filterChipTextActive]}>
              {filter}
            </Text>
          </TouchableOpacity>
        ))}
      </ScrollView>

      {/* Download Manager */}
      {showDownloadManager && downloadQueue.length > 0 && (
        <View style={styles.downloadManager}>
          <Text style={styles.downloadManagerTitle}>Downloads</Text>
          {downloadQueue.map((item) => (
            <View key={item.lessonId} style={styles.downloadItem}>
              <Text style={styles.downloadItemTitle} numberOfLines={1}>{item.title}</Text>
              <View style={styles.downloadProgress}>
                <View style={[styles.downloadProgressFill, { width: `${item.progress * 100}%` }]} />
              </View>
              <Text style={styles.downloadItemSize}>{item.size}</Text>
            </View>
          ))}
        </View>
      )}

      {/* Lessons List */}
      {filteredLessons.length === 0 ? (
        <View style={styles.emptyState}>
          <Text style={styles.emptyStateTitle}>No lessons found</Text>
          <Text style={styles.emptyStateText}>
            {searchQuery ? 'Try adjusting your search terms or filters' : 'Check back later for new content'}
          </Text>
        </View>
      ) : (
        <FlatList
          data={filteredLessons}
          renderItem={renderLessonCard}
          keyExtractor={(item) => item.id}
          contentContainerStyle={[styles.lessonsList, { paddingBottom: insets.bottom + spacing.xl + 24 }]}
          showsVerticalScrollIndicator={false}
        />
      )}
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
  downloadIcon: {
    width: 40,
    height: 40,
    borderRadius: 20,
    backgroundColor: colors.gray100,
    justifyContent: 'center',
    alignItems: 'center',
  },
  downloadBadgeCount: {
    position: 'absolute',
    top: 0,
    right: 0,
    backgroundColor: colors.error,
    borderRadius: 10,
    width: 16,
    height: 16,
    justifyContent: 'center',
    alignItems: 'center',
  },
  downloadBadgeCountText: {
    color: colors.white,
    fontSize: typography.fontSize.xs,
    fontWeight: typography.fontWeight.bold,
  },
  tabs: {
    flexDirection: 'row',
    backgroundColor: colors.white,
    paddingHorizontal: spacing.sm,
  },
  tab: {
    paddingHorizontal: spacing.md,
    paddingVertical: spacing.sm,
    marginRight: spacing.xs,
  },
  tabActive: {
    borderBottomWidth: 2,
    borderBottomColor: colors.primary,
  },
  tabText: {
    fontSize: typography.fontSize.sm,
    color: colors.textSecondary,
  },
  tabTextActive: {
    color: colors.primary,
    fontWeight: typography.fontWeight.bold,
  },
  progressHeader: {
    backgroundColor: colors.primarySoft,
    padding: spacing.md,
  },
  progressCategory: {
    fontSize: typography.fontSize.md,
    fontWeight: typography.fontWeight.bold,
    color: colors.text,
    marginBottom: spacing.xs,
  },
  progressStats: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  progressText: {
    fontSize: typography.fontSize.sm,
    color: colors.textSecondary,
    marginRight: spacing.sm,
  },
  overallProgressBar: {
    flex: 1,
    height: 6,
    backgroundColor: colors.gray200,
    borderRadius: 3,
  },
  overallProgressFill: {
    height: '100%',
    backgroundColor: colors.primary,
    borderRadius: 3,
  },
  searchContainer: {
    paddingHorizontal: spacing.md,
    paddingVertical: spacing.sm,
  },
  searchInput: {
    backgroundColor: colors.white,
    borderRadius: 8,
    paddingHorizontal: spacing.md,
    paddingVertical: spacing.sm,
    fontSize: typography.fontSize.sm,
    borderWidth: 1,
    borderColor: colors.border,
  },
  filterContainer: {
    paddingHorizontal: spacing.md,
    paddingVertical: spacing.sm,
  },
  filterChip: {
    backgroundColor: colors.white,
    borderRadius: 16,
    paddingHorizontal: spacing.md,
    paddingVertical: spacing.xs,
    marginRight: spacing.xs,
    borderWidth: 1,
    borderColor: colors.border,
  },
  filterChipActive: {
    backgroundColor: colors.primary,
    borderColor: colors.primary,
  },
  filterChipText: {
    fontSize: typography.fontSize.sm,
    color: colors.text,
  },
  filterChipTextActive: {
    color: colors.white,
    fontWeight: typography.fontWeight.bold,
  },
  downloadManager: {
    backgroundColor: colors.white,
    margin: spacing.md,
    padding: spacing.md,
    borderRadius: 8,
    borderWidth: 1,
    borderColor: colors.border,
  },
  downloadManagerTitle: {
    fontSize: typography.fontSize.md,
    fontWeight: typography.fontWeight.bold,
    marginBottom: spacing.sm,
  },
  downloadItem: {
    marginBottom: spacing.sm,
  },
  downloadItemTitle: {
    fontSize: typography.fontSize.sm,
    marginBottom: spacing.xs,
  },
  downloadProgress: {
    height: 4,
    backgroundColor: colors.gray200,
    borderRadius: 2,
    marginBottom: spacing.xs,
  },
  downloadProgressFill: {
    height: '100%',
    backgroundColor: colors.primary,
    borderRadius: 2,
  },
  downloadItemSize: {
    fontSize: typography.fontSize.xs,
    color: colors.textSecondary,
  },
  lessonsList: {
    padding: spacing.md,
  },
  lessonCard: {
    flexDirection: 'row',
    backgroundColor: colors.white,
    borderRadius: 12,
    marginBottom: spacing.md,
    overflow: 'hidden',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 1 },
    shadowOpacity: 0.05,
    shadowRadius: 2,
    elevation: 1,
  },
  lessonThumbnail: {
    width: 100,
    height: 100,
  },
  lessonContent: {
    flex: 1,
    padding: spacing.sm,
  },
  lessonTitle: {
    fontSize: typography.fontSize.sm,
    fontWeight: typography.fontWeight.bold,
    color: colors.text,
    marginBottom: spacing.xs,
  },
  lessonDescription: {
    fontSize: typography.fontSize.xs,
    color: colors.textSecondary,
    marginBottom: spacing.xs,
  },
  lessonMeta: {
    flexDirection: 'row',
    gap: spacing.sm,
  },
  lessonDuration: {
    fontSize: typography.fontSize.xs,
    color: colors.primary,
  },
  lessonDifficulty: {
    fontSize: typography.fontSize.xs,
    color: colors.textSecondary,
  },
  progressBar: {
    height: 3,
    backgroundColor: colors.gray200,
    borderRadius: 2,
    marginTop: spacing.xs,
  },
  progressFill: {
    height: '100%',
    backgroundColor: colors.accent,
    borderRadius: 2,
  },
  downloadBadge: {
    position: 'absolute',
    top: spacing.xs,
    right: spacing.xs,
    width: 24,
    height: 24,
    borderRadius: 12,
    backgroundColor: colors.accent,
    justifyContent: 'center',
    alignItems: 'center',
  },
  downloadBadgeText: {
    color: colors.white,
    fontSize: typography.fontSize.xs,
  },
  completedBadge: {
    position: 'absolute',
    top: spacing.xs,
    right: spacing.xs,
    width: 24,
    height: 24,
    borderRadius: 12,
    backgroundColor: colors.success,
    justifyContent: 'center',
    alignItems: 'center',
  },
  completedBadgeText: {
    color: colors.white,
    fontSize: typography.fontSize.xs,
  },
  emptyState: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: spacing.xl,
  },
  emptyStateTitle: {
    fontSize: typography.fontSize.lg,
    fontWeight: typography.fontWeight.bold,
    color: colors.text,
    marginBottom: spacing.sm,
  },
  emptyStateText: {
    fontSize: typography.fontSize.sm,
    color: colors.textSecondary,
    textAlign: 'center',
  },
});

export default LessonsScreen;

import React, { useState, useRef } from 'react';
import {
  View,
  Text,
  StyleSheet,
  ScrollView,
  TouchableOpacity,
  Dimensions,
  StatusBar,
  Animated,
} from 'react-native';
import { LinearGradient } from 'expo-linear-gradient';
import { colors, spacing, typography } from '../../theme/theme';
import { useNavigation } from '@react-navigation/native';

const { width } = Dimensions.get('window');

interface OnboardingSlide {
  id: number;
  emoji: string;
  title: string;
  description: string;
  color: string;
}

const slides: OnboardingSlide[] = [
  {
    id: 1,
    emoji: '🧠',
    title: 'Mental Wellness Support',
    description: 'Access personalized mental health resources, coping strategies, and professional guidance tailored for your journey.',
    color: '#6366F1',
  },
  {
    id: 2,
    emoji: '💰',
    title: 'Financial Literacy',
    description: 'Learn to manage your finances effectively with budgeting tools, savings goals, and practical financial education.',
    color: '#10B981',
  },
  {
    id: 3,
    emoji: '🤝',
    title: 'AI Wellness Companion',
    description: 'Get 24/7 support from our AI wellness companion. Receive immediate help, coping techniques, and crisis support whenever you need it.',
    color: '#F59E0B',
  },
  {
    id: 4,
    emoji: '📚',
    title: 'Micro-Learning Lessons',
    description: 'Build resilience with bite-sized lessons on mental health, financial wellness, and personal growth—designed to fit your busy life.',
    color: '#EC4899',
  },
];

const WelcomeScreen = () => {
  const navigation = useNavigation();
  const [currentSlide, setCurrentSlide] = useState(0);
  const scrollViewRef = useRef<ScrollView>(null);
  const scrollX = useRef(new Animated.Value(0)).current;

  const handleScroll = Animated.event(
    [{ nativeEvent: { contentOffset: { x: scrollX } } }],
    {
      useNativeDriver: false,
      listener: (event: any) => {
        const slideIndex = Math.round(event.nativeEvent.contentOffset.x / width);
        setCurrentSlide(slideIndex);
      },
    }
  );

  const goToNextSlide = () => {
    if (currentSlide < slides.length - 1) {
      scrollViewRef.current?.scrollTo({
        x: width * (currentSlide + 1),
        animated: true,
      });
    } else {
      // Navigate to phone registration
      navigation.navigate('PhoneRegistration' as never);
    }
  };

  const skipToEnd = () => {
    navigation.navigate('PhoneRegistration' as never);
  };

  return (
    <View style={styles.container}>
      <StatusBar barStyle="dark-content" />
      
      {/* Skip Button */}
      {currentSlide < slides.length - 1 && (
        <TouchableOpacity style={styles.skipButton} onPress={skipToEnd}>
          <Text style={styles.skipText}>Skip</Text>
        </TouchableOpacity>
      )}

      {/* Slides */}
      <ScrollView
        ref={scrollViewRef}
        horizontal
        pagingEnabled
        showsHorizontalScrollIndicator={false}
        onScroll={handleScroll}
        scrollEventThrottle={16}
        style={styles.scrollView}
      >
        {slides.map((slide) => (
          <View key={slide.id} style={styles.slide}>
            <LinearGradient
              colors={[slide.color + '20', colors.background]}
              style={styles.slideGradient}
            >
              <View style={styles.slideContent}>
                {/* Emoji */}
                <View style={[styles.emojiContainer, { backgroundColor: slide.color + '20' }]}>
                  <Text style={styles.emoji}>{slide.emoji}</Text>
                </View>

                {/* Title */}
                <Text style={styles.slideTitle}>{slide.title}</Text>

                {/* Description */}
                <Text style={styles.slideDescription}>{slide.description}</Text>
              </View>
            </LinearGradient>
          </View>
        ))}
      </ScrollView>

      {/* Pagination Dots */}
      <View style={styles.pagination}>
        {slides.map((_, index) => {
          const inputRange = [(index - 1) * width, index * width, (index + 1) * width];
          const dotWidth = scrollX.interpolate({
            inputRange,
            outputRange: [8, 24, 8],
            extrapolate: 'clamp',
          });
          const opacity = scrollX.interpolate({
            inputRange,
            outputRange: [0.3, 1, 0.3],
            extrapolate: 'clamp',
          });

          return (
            <Animated.View
              key={index}
              style={[
                styles.dot,
                {
                  width: dotWidth,
                  opacity,
                  backgroundColor: slides[currentSlide].color,
                },
              ]}
            />
          );
        })}
      </View>

      {/* Next/Get Started Button */}
      <TouchableOpacity
        style={[styles.nextButton, { backgroundColor: slides[currentSlide].color }]}
        onPress={goToNextSlide}
        activeOpacity={0.9}
      >
        <Text style={styles.nextButtonText}>
          {currentSlide === slides.length - 1 ? 'Get Started' : 'Next'}
        </Text>
      </TouchableOpacity>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: colors.background,
  },
  skipButton: {
    position: 'absolute',
    top: spacing.xl,
    right: spacing.md,
    zIndex: 10,
    paddingHorizontal: spacing.md,
    paddingVertical: spacing.sm,
  },
  skipText: {
    fontSize: typography.fontSize.sm,
    color: colors.textSecondary,
    fontWeight: typography.fontWeight.bold,
  },
  scrollView: {
    flex: 1,
  },
  slide: {
    width,
    flex: 1,
  },
  slideGradient: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  slideContent: {
    alignItems: 'center',
    paddingHorizontal: spacing.xl,
    paddingTop: spacing.xxl * 2,
  },
  emojiContainer: {
    width: 120,
    height: 120,
    borderRadius: 60,
    justifyContent: 'center',
    alignItems: 'center',
    marginBottom: spacing.xxl,
  },
  emoji: {
    fontSize: 64,
  },
  slideTitle: {
    fontSize: typography.fontSize.xxl,
    fontWeight: typography.fontWeight.bold,
    color: colors.text,
    textAlign: 'center',
    marginBottom: spacing.md,
  },
  slideDescription: {
    fontSize: typography.fontSize.md,
    color: colors.textSecondary,
    textAlign: 'center',
    lineHeight: 24,
    paddingHorizontal: spacing.md,
  },
  pagination: {
    flexDirection: 'row',
    justifyContent: 'center',
    alignItems: 'center',
    paddingVertical: spacing.xl,
    gap: spacing.xs,
  },
  dot: {
    height: 8,
    borderRadius: 4,
  },
  nextButton: {
    marginHorizontal: spacing.md,
    marginBottom: spacing.xl,
    paddingVertical: spacing.md,
    borderRadius: 16,
    alignItems: 'center',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.2,
    shadowRadius: 8,
    elevation: 6,
  },
  nextButtonText: {
    fontSize: typography.fontSize.md,
    fontWeight: typography.fontWeight.bold,
    color: colors.white,
    letterSpacing: 0.5,
  },
});

export default WelcomeScreen;

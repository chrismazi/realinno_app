import React, { useState, useEffect } from 'react';
import {
  View,
  Text,
  StyleSheet,
  StatusBar,
  Animated,
  Easing,
} from 'react-native';
import { LinearGradient } from 'expo-linear-gradient';
import { colors, spacing, typography } from '../../theme/theme';
import { useNavigation } from '@react-navigation/native';

const SplashScreen = () => {
  const navigation = useNavigation();
  const [loadingProgress, setLoadingProgress] = useState(0);
  const [loadingMessage, setLoadingMessage] = useState('');
  const [hasError, setHasError] = useState(false);
  
  const fadeAnim = useState(new Animated.Value(0))[0];
  const scaleAnim = useState(new Animated.Value(0.8))[0];
  const progressAnim = useState(new Animated.Value(0))[0];

  useEffect(() => {
    // Start animations
    Animated.parallel([
      Animated.timing(fadeAnim, {
        toValue: 1,
        duration: 1000,
        useNativeDriver: true,
        easing: Easing.ease,
      }),
      Animated.spring(scaleAnim, {
        toValue: 1,
        tension: 20,
        friction: 7,
        useNativeDriver: true,
      }),
    ]).start();

    // Start initialization
    initializeApp();
  }, []);

  const initializeApp = async () => {
    const steps = [
      { message: 'Checking authentication...', duration: 400 },
      { message: 'Loading language preferences...', duration: 300 },
      { message: 'Fetching configuration...', duration: 500 },
      { message: 'Preparing mental health content...', duration: 600 },
      { message: 'Initializing crisis support...', duration: 400 },
      { message: 'Finalizing setup...', duration: 300 },
    ];

    for (let i = 0; i < steps.length; i++) {
      const step = steps[i];
      const progress = (i + 1) / steps.length;
      
      setLoadingMessage(step.message);
      setLoadingProgress(progress);

      // Animate progress bar
      Animated.timing(progressAnim, {
        toValue: progress,
        duration: step.duration,
        useNativeDriver: false,
        easing: Easing.ease,
      }).start();

      await new Promise(resolve => setTimeout(resolve, step.duration));
    }

    // Complete
    setLoadingMessage('Ready!');
    await new Promise(resolve => setTimeout(resolve, 500));
    
    // Navigate to welcome intro
    navigation.navigate('Welcome' as never);
  };

  const retryInitialization = () => {
    setHasError(false);
    setLoadingProgress(0);
    setLoadingMessage('');
    progressAnim.setValue(0);
    initializeApp();
  };

  return (
    <View style={styles.container}>
      <StatusBar barStyle="light-content" backgroundColor="transparent" translucent />
      
      <LinearGradient
        colors={[colors.primary, colors.primaryDark]}
        style={styles.gradient}
        start={{ x: 0, y: 0 }}
        end={{ x: 1, y: 1 }}
      >
        <Animated.View
          style={[
            styles.content,
            {
              opacity: fadeAnim,
              transform: [{ scale: scaleAnim }],
            },
          ]}
        >
          {/* Logo */}
          <View style={styles.logoContainer}>
            <View style={styles.logo}>
              <Text style={styles.logoText}>RW</Text>
            </View>
          </View>

          {/* App Title */}
          <Text style={styles.appTitle}>RealWorks</Text>
          <Text style={styles.appSubtitle}>Mental Wellness Platform</Text>

          {/* Loading Indicator */}
          <View style={styles.loadingContainer}>
            <View style={styles.progressBarContainer}>
              <Animated.View
                style={[
                  styles.progressBar,
                  {
                    width: progressAnim.interpolate({
                      inputRange: [0, 1],
                      outputRange: ['0%', '100%'],
                    }),
                  },
                ]}
              />
            </View>
            <Text style={styles.loadingMessage}>{loadingMessage}</Text>
            <Text style={styles.loadingPercent}>
              {Math.round(loadingProgress * 100)}%
            </Text>
          </View>
        </Animated.View>
      </LinearGradient>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  gradient: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  content: {
    alignItems: 'center',
    width: '100%',
    paddingHorizontal: spacing.xl,
  },
  logoContainer: {
    marginBottom: spacing.xl,
  },
  logo: {
    width: 100,
    height: 100,
    borderRadius: 24,
    backgroundColor: colors.white,
    justifyContent: 'center',
    alignItems: 'center',
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 8 },
    shadowOpacity: 0.3,
    shadowRadius: 16,
    elevation: 12,
  },
  logoText: {
    fontSize: 40,
    fontWeight: typography.fontWeight.bold,
    color: colors.primary,
  },
  appTitle: {
    fontSize: typography.fontSize.xxxl,
    fontWeight: typography.fontWeight.bold,
    color: colors.white,
    marginBottom: spacing.xs,
  },
  appSubtitle: {
    fontSize: typography.fontSize.md,
    color: colors.white,
    opacity: 0.9,
    marginBottom: spacing.xxl * 2,
  },
  loadingContainer: {
    width: '100%',
    alignItems: 'center',
  },
  progressBarContainer: {
    width: '80%',
    height: 4,
    backgroundColor: 'rgba(255, 255, 255, 0.3)',
    borderRadius: 2,
    overflow: 'hidden',
    marginBottom: spacing.md,
  },
  progressBar: {
    height: '100%',
    backgroundColor: colors.white,
    borderRadius: 2,
  },
  loadingMessage: {
    fontSize: typography.fontSize.sm,
    color: colors.white,
    opacity: 0.9,
    marginBottom: spacing.xs,
  },
  loadingPercent: {
    fontSize: typography.fontSize.xs,
    color: colors.white,
    opacity: 0.7,
  },
});

export default SplashScreen;

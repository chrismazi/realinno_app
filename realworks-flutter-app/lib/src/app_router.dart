import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/splash_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/signin_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/notifications_screen.dart';
import 'screens/counseling_screen.dart';
import 'screens/financial_literacy_screen.dart';
import 'screens/settings_screen.dart';
import 'services/mock_auth_service.dart';

/// App router configuration using GoRouter
final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: '/splash',
    redirect: (context, state) {
      // Check if we're still loading auth state
      if (authState.isLoading) {
        return null;
      }

      final isLoggedIn = authState.value ?? false;
      final isOnAuthPage = state.matchedLocation == '/signin' ||
          state.matchedLocation == '/signup' ||
          state.matchedLocation == '/splash' ||
          state.matchedLocation == '/onboarding';

      // If user is not logged in and not on an auth page, redirect to signin
      if (!isLoggedIn && !isOnAuthPage && state.matchedLocation != '/splash') {
        return '/signin';
      }

      // If user is logged in and on auth page, redirect to home
      if (isLoggedIn && isOnAuthPage && state.matchedLocation != '/splash') {
        return '/home';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: '/signin',
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: '/notifications',
        builder: (context, state) => const NotificationsScreen(),
      ),
      GoRoute(
        path: '/counseling',
        builder: (context, state) => const CounselingScreen(),
      ),
      GoRoute(
        path: '/financial-literacy',
        builder: (context, state) => const FinancialLiteracyScreen(),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Page not found: ${state.matchedLocation}'),
      ),
    ),
  );
});

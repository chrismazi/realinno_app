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
import 'screens/budget_planner_screen.dart';
import 'screens/add_transaction_screen.dart';
import 'screens/savings_goals_screen.dart';
import 'screens/transactions_list_screen.dart';
import 'screens/expense_categories_screen.dart';
import 'screens/goal_setup_screen.dart';
import 'screens/income_setup_screen.dart';
import 'screens/learning_hub_screen.dart';
import 'screens/environmental_wellbeing_screen.dart';
import 'screens/srh_family_planning_screen.dart';
import 'screens/about_help_screen.dart';
import 'screens/ai_companion_chat_screen.dart';
import 'screens/ai_companion_home_screen.dart';
import 'screens/ai_companion_history_screen.dart';
import 'screens/ai_companion_welcome_screen.dart';
import 'screens/admin_dashboard_screen.dart';
import 'screens/counseling_mood_selector_screen.dart';
import 'screens/ai_thinking_screen.dart';
import 'screens/learning_hub_courses_screen.dart';
import 'screens/alt_home_wellbeing_screen.dart';
import 'screens/alt_splash_screen.dart';
import 'screens/chatbot_topics_screen.dart';
import 'screens/counselor_booking_screen.dart';
import 'screens/chat_resources_screen.dart';
import 'screens/emergency_support_screen.dart';
import 'screens/session_history_screen.dart';
import 'screens/self_assessment_screen.dart';
import 'screens/all_screens_demo.dart';
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
      // Budget & Finance Routes
      GoRoute(
        path: '/budget-planner',
        builder: (context, state) => const BudgetPlannerScreen(),
      ),
      GoRoute(
        path: '/add-transaction',
        builder: (context, state) => const AddTransactionScreen(),
      ),
      GoRoute(
        path: '/savings-goals',
        builder: (context, state) => const SavingsGoalsScreen(),
      ),
      GoRoute(
        path: '/transactions',
        builder: (context, state) => const TransactionsListScreen(),
      ),
      GoRoute(
        path: '/expense-categories',
        builder: (context, state) => const ExpenseCategoriesScreen(),
      ),
      GoRoute(
        path: '/goal-setup',
        builder: (context, state) => const GoalSetupScreen(),
      ),
      GoRoute(
        path: '/income-setup',
        builder: (context, state) => const IncomeSetupScreen(),
      ),
      // Wellbeing & Learning Routes
      GoRoute(
        path: '/learning-hub',
        builder: (context, state) => const LearningHubScreen(),
      ),
      GoRoute(
        path: '/environmental-wellbeing',
        builder: (context, state) => const EnvironmentalWellbeingScreen(),
      ),
      GoRoute(
        path: '/srh-family-planning',
        builder: (context, state) => const SrhFamilyPlanningScreen(),
      ),
      // Other Routes
      GoRoute(
        path: '/about-help',
        builder: (context, state) => const AboutHelpScreen(),
      ),
      // AI Companion/Chatbot Routes
      GoRoute(
        path: '/ai-companion-welcome',
        builder: (context, state) => const AiCompanionWelcomeScreen(),
      ),
      GoRoute(
        path: '/ai-companion-home',
        builder: (context, state) => const AiCompanionHomeScreen(),
      ),
      GoRoute(
        path: '/ai-companion-chat',
        builder: (context, state) => const AiCompanionChatScreen(),
      ),
      GoRoute(
        path: '/ai-companion-history',
        builder: (context, state) => const AiCompanionHistoryScreen(),
      ),
      // Admin Routes
      GoRoute(
        path: '/admin-dashboard',
        builder: (context, state) => const AdminDashboardScreen(),
      ),
      // Additional Counseling/Support Routes
      GoRoute(
        path: '/counseling-mood-selector',
        builder: (context, state) => const CounselingMoodSelectorScreen(),
      ),
      GoRoute(
        path: '/ai-thinking',
        builder: (context, state) => const AiThinkingScreen(),
      ),
      GoRoute(
        path: '/chatbot-topics',
        builder: (context, state) => const ChatbotTopicsScreen(),
      ),
      GoRoute(
        path: '/counselor-booking',
        builder: (context, state) => const CounselorBookingScreen(),
      ),
      GoRoute(
        path: '/chat-resources',
        builder: (context, state) => const ChatResourcesScreen(),
      ),
      GoRoute(
        path: '/emergency-support',
        builder: (context, state) => const EmergencySupportScreen(),
      ),
      GoRoute(
        path: '/session-history',
        builder: (context, state) => const SessionHistoryScreen(),
      ),
      GoRoute(
        path: '/self-assessment',
        builder: (context, state) => const SelfAssessmentScreen(),
      ),
      // Additional Learning Route
      GoRoute(
        path: '/learning-hub-courses',
        builder: (context, state) => const LearningHubCoursesScreen(),
      ),
      // Alternative Screen Variants
      GoRoute(
        path: '/alt-home-wellbeing',
        builder: (context, state) => const AltHomeWellbeingScreen(),
      ),
      GoRoute(
        path: '/alt-splash',
        builder: (context, state) => const AltSplashScreen(),
      ),
      // Demo/Testing Route
      GoRoute(
        path: '/all-screens',
        builder: (context, state) => const AllScreensDemo(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Page not found: ${state.matchedLocation}'),
      ),
    ),
  );
});

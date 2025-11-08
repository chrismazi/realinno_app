import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';

/// Demo screen showing all 37 screens for easy navigation and testing
class AllScreensDemo extends StatelessWidget {
  const AllScreensDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        title: const Text('All Screens Demo (37 Total)'),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          _buildCategoryHeader('Authentication & Onboarding (4)'),
          _buildScreenTile(context, 'Splash Screen', '/splash', Icons.water_drop),
          _buildScreenTile(context, 'Onboarding', '/onboarding', Icons.swipe),
          _buildScreenTile(context, 'Sign Up', '/signup', Icons.person_add),
          _buildScreenTile(context, 'Sign In', '/signin', Icons.login),
          
          _buildCategoryHeader('Core Screens (4)'),
          _buildScreenTile(context, 'Home Dashboard', '/home', Icons.home),
          _buildScreenTile(context, 'Profile', '/profile', Icons.person),
          _buildScreenTile(context, 'Notifications', '/notifications', Icons.notifications),
          _buildScreenTile(context, 'Settings', '/settings', Icons.settings),
          
          _buildCategoryHeader('Budget & Finance (7)'),
          _buildScreenTile(context, 'Budget Planner', '/budget-planner', Icons.account_balance_wallet),
          _buildScreenTile(context, 'Add Transaction', '/add-transaction', Icons.add_circle),
          _buildScreenTile(context, 'Transactions List', '/transactions-list', Icons.list),
          _buildScreenTile(context, 'Savings Goals', '/savings-goals', Icons.savings),
          _buildScreenTile(context, 'Expense Categories', '/expense-categories', Icons.category),
          _buildScreenTile(context, 'Goal Setup', '/goal-setup', Icons.flag),
          _buildScreenTile(context, 'Income Setup', '/income-setup', Icons.attach_money),
          
          _buildCategoryHeader('Wellbeing & Support (15)'),
          _buildScreenTile(context, 'Counseling Hub', '/counseling', Icons.health_and_safety),
          _buildScreenTile(context, 'AI Companion Welcome', '/ai-companion-welcome', Icons.waving_hand),
          _buildScreenTile(context, 'AI Companion Home', '/ai-companion-home', Icons.home_outlined),
          _buildScreenTile(context, 'AI Companion Chat', '/ai-companion-chat', Icons.chat),
          _buildScreenTile(context, 'AI Companion History', '/ai-companion-history', Icons.history),
          _buildScreenTile(context, 'Counseling Mood Selector', '/counseling-mood-selector', Icons.psychology),
          _buildScreenTile(context, 'AI Thinking', '/ai-thinking', Icons.more_horiz),
          _buildScreenTile(context, 'Chatbot Topics', '/chatbot-topics', Icons.topic),
          _buildScreenTile(context, 'Counselor Booking', '/counselor-booking', Icons.calendar_today),
          _buildScreenTile(context, 'Chat Resources', '/chat-resources', Icons.library_books),
          _buildScreenTile(context, 'Emergency Support', '/emergency-support', Icons.emergency),
          _buildScreenTile(context, 'Session History', '/session-history', Icons.event_note),
          _buildScreenTile(context, 'Self Assessment', '/self-assessment', Icons.assignment),
          _buildScreenTile(context, 'Environmental Wellbeing', '/environmental-wellbeing', Icons.eco),
          _buildScreenTile(context, 'SRH & Family Planning', '/srh-family-planning', Icons.family_restroom),
          
          _buildCategoryHeader('Learning & Education (3)'),
          _buildScreenTile(context, 'Financial Literacy', '/financial-literacy', Icons.school),
          _buildScreenTile(context, 'Learning Hub (Certificates)', '/learning-hub', Icons.workspace_premium),
          _buildScreenTile(context, 'Learning Hub (Courses)', '/learning-hub-courses', Icons.video_library),
          
          _buildCategoryHeader('Admin & Other (4)'),
          _buildScreenTile(context, 'Admin Dashboard', '/admin-dashboard', Icons.dashboard),
          _buildScreenTile(context, 'About & Help', '/about-help', Icons.info),
          _buildScreenTile(context, 'Alt Home Wellbeing', '/alt-home-wellbeing', Icons.home_work),
          _buildScreenTile(context, 'Alt Splash', '/alt-splash', Icons.water),
          
          const SizedBox(height: AppSpacing.xl),
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.success.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
              border: Border.all(color: AppColors.success),
            ),
            child: const Column(
              children: [
                Icon(Icons.check_circle, color: AppColors.success, size: 48),
                SizedBox(height: AppSpacing.sm),
                Text(
                  '✅ ALL 37 SCREENS IMPLEMENTED!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.success,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: AppSpacing.xs),
                Text(
                  'Tap any screen above to navigate and test',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textLight,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
        ],
      ),
    );
  }

  Widget _buildCategoryHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.lg, bottom: AppSpacing.sm),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
        ),
      ),
    );
  }

  Widget _buildScreenTile(
    BuildContext context,
    String title,
    String route,
    IconData icon,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      elevation: 2,
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(AppSpacing.sm),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
          ),
          child: Icon(icon, color: AppColors.primary, size: 24),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.textDark,
          ),
        ),
        subtitle: Text(
          route,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textLight,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.textLight),
        onTap: () {
          context.push(route);
        },
      ),
    );
  }
}

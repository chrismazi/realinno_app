import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../widgets/primary_button.dart';

/// Learning and training hub screen
class LearningHubScreen extends StatelessWidget {
  const LearningHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              context.push('/notifications');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Celebration Header
            Container(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  15,
                  (index) => Container(
                    width: 8,
                    height: 24,
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      color: [
                        Colors.orange,
                        Colors.blue,
                        Colors.yellow,
                        AppColors.primary,
                      ][index % 4],
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
            ),
            // Congratulations Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              child: Column(
                children: [
                  const Text(
                    'Congratulations, Alex!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  const Text(
                    "You've earned a new certificate",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.textLight,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  // Certificate
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF4A3728),
                      borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.shadowMedium,
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(AppSpacing.lg),
                    child: Container(
                      padding: const EdgeInsets.all(AppSpacing.xl),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'CERTIFICATE',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                              color: AppColors.textDark,
                            ),
                          ),
                          const SizedBox(height: AppSpacing.xs),
                          const Text(
                            'EMPLOYEE ASSISTANCE PROJECT OF',
                            style: TextStyle(
                              fontSize: 10,
                              color: AppColors.textLight,
                            ),
                          ),
                          const Text(
                            'SAFETY COURSE',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textDark,
                            ),
                          ),
                          const SizedBox(height: AppSpacing.md),
                          const Divider(),
                          const SizedBox(height: AppSpacing.md),
                          const Text(
                            'This is Awarded to',
                            style: TextStyle(
                              fontSize: 10,
                              color: AppColors.textLight,
                            ),
                          ),
                          const SizedBox(height: AppSpacing.xs),
                          const Text(
                            "Nazaretten Sophomo O'Vintus",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textDark,
                            ),
                          ),
                          const SizedBox(height: AppSpacing.xs),
                          const Text(
                            'Occupation Service Engineer',
                            style: TextStyle(
                              fontSize: 10,
                              color: AppColors.textLight,
                            ),
                          ),
                          const SizedBox(height: AppSpacing.md),
                          // Gold Seal
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.amber.shade700,
                                width: 3,
                              ),
                            ),
                            child: const Icon(
                              Icons.verified,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.xxl),
            // Action Buttons
            Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                children: [
                  PrimaryButton(
                    text: 'Download Certificate',
                    icon: Icons.download,
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Certificate downloaded'),
                          backgroundColor: AppColors.success,
                        ),
                      );
                    },
                    isFullWidth: true,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  OutlinedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Shared to profile'),
                          backgroundColor: AppColors.success,
                        ),
                      );
                    },
                    icon: const Icon(Icons.share),
                    label: const Text('Share to Profile'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primary,
                      side: const BorderSide(color: AppColors.primary, width: 2),
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.xl,
                        vertical: AppSpacing.md,
                      ),
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.sm,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home_outlined, 'Home', false, () {
                context.go('/home');
              }),
              _buildNavItem(Icons.school, 'Learning', true, () {}),
              _buildNavItem(Icons.chat_bubble_outline, 'Support', false, () {
                context.push('/counseling');
              }),
              _buildNavItem(Icons.account_circle_outlined, 'Profile', false, () {
                context.push('/profile');
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    IconData icon,
    String label,
    bool isActive,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isActive ? AppColors.primary : AppColors.textLight,
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: isActive ? AppColors.primary : AppColors.textLight,
            ),
          ),
        ],
      ),
    );
  }
}

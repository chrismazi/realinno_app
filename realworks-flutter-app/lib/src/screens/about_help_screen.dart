import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../widgets/app_card.dart';
import '../widgets/section_title.dart';

/// About and help screen
class AboutHelpScreen extends StatelessWidget {
  const AboutHelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        title: const Text('About & Help'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App Info
            Center(
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                    ),
                    child: const Icon(
                      Icons.work,
                      size: 56,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  const Text(
                    'RealWorks EAP',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  const Text(
                    'Version 1.0.0',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textLight,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            const SectionTitle(title: 'About This App'),
            const SizedBox(height: AppSpacing.sm),
            AppCard(
              child: const Text(
                'RealWorks Employee Assistance Program provides comprehensive support for your wellbeing, financial literacy, mental health, and professional development. Access counseling, learning resources, and tools to help you thrive at work and in life.',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textLight,
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            const SectionTitle(title: 'Help & Support'),
            const SizedBox(height: AppSpacing.md),
            _buildHelpOption(
              icon: Icons.phone,
              title: 'Contact Support',
              subtitle: '24/7 helpline available',
              onTap: () {},
            ),
            const SizedBox(height: AppSpacing.sm),
            _buildHelpOption(
              icon: Icons.email,
              title: 'Email Us',
              subtitle: 'support@realworks-eap.com',
              onTap: () {},
            ),
            const SizedBox(height: AppSpacing.sm),
            _buildHelpOption(
              icon: Icons.question_answer,
              title: 'FAQ',
              subtitle: 'Frequently asked questions',
              onTap: () {},
            ),
            const SizedBox(height: AppSpacing.sm),
            _buildHelpOption(
              icon: Icons.bug_report,
              title: 'Report a Problem',
              subtitle: 'Help us improve the app',
              onTap: () {},
            ),
            const SizedBox(height: AppSpacing.lg),
            const SectionTitle(title: 'Legal'),
            const SizedBox(height: AppSpacing.md),
            _buildHelpOption(
              icon: Icons.description,
              title: 'Terms of Service',
              subtitle: '',
              onTap: () {},
            ),
            const SizedBox(height: AppSpacing.sm),
            _buildHelpOption(
              icon: Icons.privacy_tip,
              title: 'Privacy Policy',
              subtitle: '',
              onTap: () {},
            ),
            const SizedBox(height: AppSpacing.sm),
            _buildHelpOption(
              icon: Icons.shield,
              title: 'Data Protection',
              subtitle: '',
              onTap: () {},
            ),
            const SizedBox(height: AppSpacing.xl),
            Center(
              child: Text(
                '© 2024 RealWorks EAP. All rights reserved.',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.textGray,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHelpOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return AppCard(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textDark,
                  ),
                ),
                if (subtitle.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textLight,
                    ),
                  ),
                ],
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: AppColors.textLight),
        ],
      ),
    );
  }
}

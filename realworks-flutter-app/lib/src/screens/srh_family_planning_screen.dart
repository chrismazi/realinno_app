import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../widgets/app_card.dart';
import '../widgets/section_title.dart';
import '../widgets/primary_button.dart';

/// Sexual & Reproductive Health and Family Planning screen
class SrhFamilyPlanningScreen extends StatelessWidget {
  const SrhFamilyPlanningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        title: const Text('SRH & Family Planning'),
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
            // Hero Card
            AppCard(
              color: AppColors.info.withOpacity(0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.favorite,
                    size: 48,
                    color: Colors.pink,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  const Text(
                    'Your Health Matters',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  const Text(
                    'Access confidential support and resources for sexual and reproductive health, family planning, and wellness.',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textLight,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            const SectionTitle(title: 'Services Available'),
            const SizedBox(height: AppSpacing.md),
            _buildServiceCard(
              icon: Icons.medical_services,
              title: 'Family Planning Counseling',
              description: 'Get expert advice on contraception and family planning',
            ),
            const SizedBox(height: AppSpacing.sm),
            _buildServiceCard(
              icon: Icons.pregnant_woman,
              title: 'Prenatal & Postnatal Care',
              description: 'Support for expecting and new mothers',
            ),
            const SizedBox(height: AppSpacing.sm),
            _buildServiceCard(
              icon: Icons.health_and_safety,
              title: 'STI Testing & Prevention',
              description: 'Confidential testing and education',
            ),
            const SizedBox(height: AppSpacing.sm),
            _buildServiceCard(
              icon: Icons.psychology,
              title: 'Reproductive Health Education',
              description: 'Learn about your body and health',
            ),
            const SizedBox(height: AppSpacing.lg),
            const SectionTitle(title: 'Resources'),
            const SizedBox(height: AppSpacing.md),
            _buildResourceCard(
              'Understanding Contraception',
              'Guide to different methods',
              '10 min read',
            ),
            const SizedBox(height: AppSpacing.sm),
            _buildResourceCard(
              'Healthy Pregnancy Tips',
              'Essential care during pregnancy',
              '8 min read',
            ),
            const SizedBox(height: AppSpacing.lg),
            PrimaryButton(
              text: 'Book Consultation',
              icon: Icons.calendar_today,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Consultation booking coming soon'),
                    backgroundColor: AppColors.info,
                  ),
                );
              },
              isFullWidth: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return AppCard(
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: Colors.pink.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            ),
            child: Icon(icon, color: Colors.pink, size: 28),
          ),
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
                const SizedBox(height: AppSpacing.xs),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textLight,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResourceCard(String title, String subtitle, String readTime) {
    return AppCard(
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.info.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            ),
            child: const Icon(
              Icons.article,
              color: AppColors.info,
              size: 24,
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$subtitle • $readTime',
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textLight,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: AppColors.textLight),
        ],
      ),
    );
  }
}

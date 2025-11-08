import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../widgets/app_card.dart';
import '../widgets/section_title.dart';
import '../widgets/primary_button.dart';

/// Counseling and support screen
class CounselingScreen extends StatelessWidget {
  const CounselingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        title: const Text('Counseling & Support'),
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
            // Hero section
            AppCard(
              color: AppColors.primary,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.psychology,
                    size: 48,
                    color: AppColors.white,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  const Text(
                    'Professional Support',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  const Text(
                    'Connect with licensed counselors for mental health support, stress management, and personal guidance.',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  PrimaryButton(
                    text: 'Book Appointment',
                    onPressed: () {
                      // TODO: Navigate to booking
                    },
                    isFullWidth: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            const SectionTitle(
              title: 'Support Categories',
              subtitle: 'Choose the area where you need help',
            ),
            const SizedBox(height: AppSpacing.md),
            _buildCategoryCard(
              icon: Icons.psychology_outlined,
              title: 'Mental Health',
              description: 'Depression, anxiety, and emotional support',
            ),
            const SizedBox(height: AppSpacing.sm),
            _buildCategoryCard(
              icon: Icons.work_outline,
              title: 'Work Stress',
              description: 'Manage workplace pressure and burnout',
            ),
            const SizedBox(height: AppSpacing.sm),
            GestureDetector(
              onTap: () {
                context.push('/srh-family-planning');
              },
              child: _buildCategoryCard(
                icon: Icons.family_restroom,
                title: 'SRH & Family Planning',
                description: 'Reproductive health and family resources',
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            _buildCategoryCard(
              icon: Icons.healing,
              title: 'Substance Abuse',
              description: 'Recovery support and treatment guidance',
            ),
            const SizedBox(height: AppSpacing.lg),
            const SectionTitle(title: 'Available Counselors'),
            const SizedBox(height: AppSpacing.md),
            _buildCounselorCard(
              name: 'Dr. Sarah Evans',
              specialty: 'Clinical Psychologist',
              experience: '15+ years experience',
              rating: 4.9,
            ),
            const SizedBox(height: AppSpacing.sm),
            _buildCounselorCard(
              name: 'Dr. Michael Chen',
              specialty: 'Family Therapist',
              experience: '12+ years experience',
              rating: 4.8,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard({
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
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            ),
            child: Icon(icon, color: AppColors.primary, size: 28),
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
          const Icon(Icons.chevron_right, color: AppColors.textLight),
        ],
      ),
    );
  }

  Widget _buildCounselorCard({
    required String name,
    required String specialty,
    required String experience,
    required double rating,
  }) {
    return AppCard(
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                name[0],
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  specialty,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textLight,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Row(
                  children: [
                    const Icon(Icons.star, size: 16, color: AppColors.warning),
                    const SizedBox(width: 4),
                    Text(
                      rating.toString(),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Text(
                      '• $experience',
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textLight,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

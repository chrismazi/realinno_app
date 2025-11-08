import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../widgets/app_card.dart';
import '../widgets/section_title.dart';

/// Financial literacy and education screen
class FinancialLiteracyScreen extends StatelessWidget {
  const FinancialLiteracyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        title: const Text('Financial Literacy'),
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
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.school,
                    size: 48,
                    color: AppColors.white,
                  ),
                  SizedBox(height: AppSpacing.md),
                  Text(
                    'Build Financial Confidence',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: AppSpacing.sm),
                  Text(
                    'Learn essential financial skills to manage your money, plan for the future, and achieve your goals.',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            const SectionTitle(
              title: 'Featured Courses',
              subtitle: 'Start learning today',
            ),
            const SizedBox(height: AppSpacing.md),
            _buildCourseCard(
              title: 'Budgeting Basics',
              description: 'Learn how to create and stick to a budget',
              duration: '30 min',
              level: 'Beginner',
              progress: 0.0,
            ),
            const SizedBox(height: AppSpacing.sm),
            _buildCourseCard(
              title: 'Saving Strategies',
              description: 'Build an emergency fund and save for goals',
              duration: '45 min',
              level: 'Beginner',
              progress: 0.35,
            ),
            const SizedBox(height: AppSpacing.sm),
            _buildCourseCard(
              title: 'Understanding Credit',
              description: 'How credit scores work and why they matter',
              duration: '40 min',
              level: 'Intermediate',
              progress: 0.0,
            ),
            const SizedBox(height: AppSpacing.sm),
            _buildCourseCard(
              title: 'Investing 101',
              description: 'Introduction to stocks, bonds, and retirement',
              duration: '60 min',
              level: 'Intermediate',
              progress: 0.0,
            ),
            const SizedBox(height: AppSpacing.lg),
            const SectionTitle(title: 'Articles & Resources'),
            const SizedBox(height: AppSpacing.md),
            _buildArticleCard(
              title: '5 Ways to Reduce Monthly Expenses',
              readTime: '5 min read',
              category: 'Budgeting',
            ),
            const SizedBox(height: AppSpacing.sm),
            _buildArticleCard(
              title: 'Understanding Your Paycheck',
              readTime: '4 min read',
              category: 'Income',
            ),
            const SizedBox(height: AppSpacing.sm),
            _buildArticleCard(
              title: 'Planning for Retirement in Your 20s',
              readTime: '7 min read',
              category: 'Investing',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseCard({
    required String title,
    required String description,
    required String duration,
    required String level,
    required double progress,
  }) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                ),
                child: const Icon(
                  Icons.play_circle_outline,
                  color: AppColors.primary,
                  size: 28,
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
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Row(
                      children: [
                        const Icon(Icons.access_time,
                            size: 14, color: AppColors.textLight),
                        const SizedBox(width: 4),
                        Text(
                          duration,
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.textLight,
                          ),
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.sm,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.info.withOpacity(0.1),
                            borderRadius:
                                BorderRadius.circular(AppSpacing.radiusSm),
                          ),
                          child: Text(
                            level,
                            style: const TextStyle(
                              fontSize: 10,
                              color: AppColors.info,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textLight,
            ),
          ),
          if (progress > 0) ...[
            const SizedBox(height: AppSpacing.sm),
            ClipRRect(
              borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: AppColors.gray200,
                valueColor:
                    const AlwaysStoppedAnimation<Color>(AppColors.primary),
                minHeight: 6,
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              '${(progress * 100).toInt()}% complete',
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.textLight,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildArticleCard({
    required String title,
    required String readTime,
    required String category,
  }) {
    return AppCard(
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            ),
            child: const Icon(
              Icons.article,
              color: AppColors.primary,
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
                const SizedBox(height: AppSpacing.xs),
                Row(
                  children: [
                    Text(
                      category,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Text(
                      '• $readTime',
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
          const Icon(Icons.chevron_right, color: AppColors.textLight),
        ],
      ),
    );
  }
}

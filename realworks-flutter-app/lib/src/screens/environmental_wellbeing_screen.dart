import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../widgets/app_card.dart';
import '../widgets/section_title.dart';

/// Environmental wellbeing screen
class EnvironmentalWellbeingScreen extends StatelessWidget {
  const EnvironmentalWellbeingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        title: const Text('Environmental Wellbeing'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Image
            Container(
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFFB8E986),
                    const Color(0xFF7CB342),
                  ],
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 20,
                    left: 20,
                    child: Icon(
                      Icons.eco,
                      size: 80,
                      color: Colors.white.withOpacity(0.3),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: Icon(
                      Icons.eco,
                      size: 100,
                      color: Colors.white.withOpacity(0.2),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Challenge Tracker
                  AppCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Challenge Tracker',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        const Text(
                          'Complete 3 eco-tasks this week',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textDark,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        const Text(
                          'Track your progress and make a positive impact on the environment.',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.textLight,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.md),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "This Week's Challenge",
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.textDark,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '1/3 Complete',
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.textLight,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(AppSpacing.radiusSm),
                          child: LinearProgressIndicator(
                            value: 0.33,
                            backgroundColor: AppColors.gray200,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                AppColors.primary),
                            minHeight: 8,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  const SectionTitle(title: 'Tips for a Greener Routine'),
                  const SizedBox(height: AppSpacing.md),
                  _buildTipItem(
                    icon: Icons.recycling,
                    iconColor: AppColors.primary,
                    title: 'Reduce Your Waste',
                    description: 'Learn simple ways to minimize your daily waste.',
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  _buildTipItem(
                    icon: Icons.water_drop,
                    iconColor: Colors.blue,
                    title: 'Conserve Water',
                    description: 'Discover easy tricks to save water at home.',
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  _buildTipItem(
                    icon: Icons.lightbulb,
                    iconColor: Colors.amber,
                    title: 'Save Energy at Home',
                    description:
                        'Cut down on your electricity consumption effortlessly.',
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  _buildTipItem(
                    icon: Icons.directions_bus,
                    iconColor: Colors.green,
                    title: 'Choose Sustainable Transport',
                    description: 'Opt for greener ways to get around town.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTipItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String description,
  }) {
    return AppCard(
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            ),
            child: Icon(
              icon,
              color: iconColor,
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
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 4),
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
}

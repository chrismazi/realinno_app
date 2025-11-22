import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:realworks_app/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../widgets/app_card.dart';
import '../widgets/chip_button.dart';
import '../services/supabase_auth_service.dart';
import '../services/supabase_profile_service.dart';

/// Alternative home screen with wellbeing summary (Onboarding 1_2 variant)
class AltHomeWellbeingScreen extends ConsumerWidget {
  const AltHomeWellbeingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final user = ref.watch(supabaseAuthProvider).currentUser;
    
    // Get display name with fallback logic
    String displayName = 'User';
    
    print('User object: $user');
    print('User metadata: ${user?.userMetadata}');
    
    // First try user metadata (most reliable)
    if (user != null && user.userMetadata != null && user.userMetadata!['display_name'] != null) {
      displayName = user.userMetadata!['display_name']!;
      print('Found display name in metadata: $displayName');
    }
    // Fallback to email prefix if no metadata
    else if (user?.email != null) {
      displayName = user!.email!.split('@')[0];
      print('Using email prefix: $displayName');
    }
    
    print('Final display name: $displayName');
    print('Greeting text: ${l10n.altHomeGreeting(displayName)}');
    
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      l10n.altHomeGreeting(displayName),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.notifications_outlined),
                    onPressed: () {
                      context.push('/notifications');
                    },
                  ),
                ],
              ),
              Text(
                l10n.altHomeSummary,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textLight,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              // Wellbeing Score Card
              AppCard(
                color: AppColors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.altHomeScoreLabel,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.textLight,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          '82',
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.trending_up,
                                color: AppColors.primary,
                                size: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                l10n.altHomeScoreTrend('2'),
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      l10n.altHomeScoreDescription,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.textLight,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(
                l10n.altHomeQuickAccess,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ChipButton(
                      label: l10n.commonQuickAccessCounseling,
                      isSelected: true,
                      onTap: () {
                        context.push('/counseling');
                      },
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    ChipButton(
                      label: l10n.commonQuickAccessFinancialAid,
                      isSelected: false,
                      onTap: () {
                        context.push('/budget-planner');
                      },
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    ChipButton(
                      label: l10n.commonQuickAccessLegal,
                      isSelected: false,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(
                l10n.altHomeRecommended,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              _buildRecommendationCard(
                icon: Icons.self_improvement,
                title: l10n.altHomeRecommendationMeditationTitle,
                subtitle: l10n.altHomeRecommendationMeditationSubtitle,
                color: AppColors.primary,
                actionIcon: Icons.play_circle,
                onTap: () {},
              ),
              const SizedBox(height: AppSpacing.sm),
              _buildRecommendationCard(
                icon: Icons.article,
                title: l10n.altHomeRecommendationResilienceTitle,
                subtitle: l10n.altHomeRecommendationResilienceSubtitle,
                color: AppColors.info,
                actionIcon: Icons.arrow_forward,
                onTap: () {},
              ),
              const SizedBox(height: AppSpacing.sm),
              _buildRecommendationCard(
                icon: Icons.chat_bubble_outline,
                title: l10n.altHomeRecommendationCounselorTitle,
                subtitle: l10n.altHomeRecommendationCounselorSubtitle,
                color: AppColors.success,
                actionIcon: Icons.arrow_forward,
                onTap: () {
                  context.push('/counseling');
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  Widget _buildRecommendationCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required IconData actionIcon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
              ),
              child: Icon(icon, color: color, size: 24),
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
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textLight,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(actionIcon, color: color, size: 20),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
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
              _buildNavItem(context, Icons.home, l10n.navHome, true, () {}),
              _buildNavItem(context, Icons.explore_outlined, l10n.navDiscover, false, () {}),
              _buildNavItem(context, Icons.chat_bubble_outline, l10n.navSupport, false, () {
                context.push('/counseling');
              }),
              _buildNavItem(context, Icons.account_circle_outlined, l10n.navProfile, false, () {
                context.push('/profile');
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
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

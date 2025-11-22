import 'package:flutter/material.dart';
import 'package:realworks_app/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../widgets/app_card.dart';
import '../widgets/section_title.dart';
import '../widgets/chip_button.dart';
import '../widgets/icon_badge.dart';
import '../services/mock_auth_service.dart';

/// Home dashboard screen
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  String _selectedQuickAccess = 'counseling';
  String _userName = 'User';

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    final authService = ref.read(authServiceProvider);
    final name = await authService.getUserName();
    if (name != null && mounted) {
      setState(() {
        _userName = name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(l10n),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.lg,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppSpacing.md),
                    _buildWellbeingCard(l10n),
                    const SizedBox(height: AppSpacing.lg),
                    _buildQuickAccess(l10n),
                    const SizedBox(height: AppSpacing.lg),
                    _buildTodaysHighlights(l10n),
                    const SizedBox(height: AppSpacing.xl),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(AppLocalizations l10n) {
    final timeOfDay = DateTime.now().hour;
    String greeting = l10n.homeGreetingMorning;
    if (timeOfDay >= 12 && timeOfDay < 18) {
      greeting = l10n.homeGreetingAfternoon;
    } else if (timeOfDay >= 18) {
      greeting = l10n.homeGreetingEvening;
    }

    return Padding(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$greeting, $_userName',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  l10n.homeGreetingSummary,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textLight,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              context.push('/notifications');
            },
            icon: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.gray200),
              ),
              child: const Icon(
                Icons.notifications_outlined,
                color: AppColors.textLight,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWellbeingCard(AppLocalizations l10n) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.homeWellbeingScoreTitle,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.textLight,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.homeWellbeingScoreValue,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.trending_up,
                  color: AppColors.primary,
                  size: 24,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            l10n.homeWellbeingImprovement,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textLight,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAccess(AppLocalizations l10n) {
    final categories = [
      {'id': 'counseling', 'label': l10n.homeQuickAccessCounseling},
      {'id': 'financial', 'label': l10n.homeQuickAccessFinancial},
      {'id': 'legal', 'label': l10n.homeQuickAccessLegal},
      {'id': 'fitness', 'label': l10n.homeQuickAccessFitness},
      {'id': 'nutrition', 'label': l10n.homeQuickAccessNutrition},
      {'id': 'mindfulness', 'label': l10n.homeQuickAccessMindfulness},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: l10n.homeQuickAccessTitle),
        const SizedBox(height: AppSpacing.sm),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: categories.map((category) {
              return Padding(
                padding: const EdgeInsets.only(right: AppSpacing.sm),
                child: ChipButton(
                  label: category['label']!,
                  isSelected: _selectedQuickAccess == category['id'],
                  onTap: () {
                    setState(() {
                      _selectedQuickAccess = category['id']!;
                    });
                    // Navigate to specific category
                    if (category['id'] == 'counseling') {
                      context.push('/counseling');
                    } else if (category['id'] == 'financial') {
                      context.push('/financial-literacy');
                    }
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildTodaysHighlights(AppLocalizations l10n) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: l10n.homeHighlightsTitle),
          const SizedBox(height: AppSpacing.md),
          _buildHighlightItem(
            icon: Icons.calendar_month,
            title: l10n.homeHighlightAppointmentTitle,
            subtitle: l10n.homeHighlightAppointmentSubtitle,
          ),
          const SizedBox(height: AppSpacing.md),
          _buildHighlightItem(
            icon: Icons.self_improvement,
            title: l10n.homeHighlightMindfulnessTitle,
            subtitle: l10n.homeHighlightMindfulnessSubtitle,
          ),
          const SizedBox(height: AppSpacing.md),
          _buildHighlightItem(
            icon: Icons.article,
            title: l10n.homeHighlightArticleTitle,
            subtitle: l10n.homeHighlightArticleSubtitle,
          ),
        ],
      ),
    );
  }

  Widget _buildHighlightItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: AppColors.primary,
            size: 20,
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
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.textLight,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

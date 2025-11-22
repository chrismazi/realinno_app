import 'package:flutter/material.dart';
import 'package:realworks_app/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../widgets/app_card.dart';
import '../services/supabase_auth_service.dart';
import '../services/supabase_profile_service.dart';

/// Profile screen showing user information
class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  String _userName = '';
  String _userEmail = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final user = ref.read(supabaseAuthProvider).currentUser;
    final profile = ref.read(supabaseProfileProvider);
    
    if (user != null) {
      final userProfile = await profile.getProfile(user.id);
      if (mounted) {
        setState(() {
          _userName = userProfile?.displayName ?? user.userMetadata?['display_name'] ?? 'User';
          _userEmail = user.email ?? 'No email';
        });
      }
    } else {
      if (mounted) {
        setState(() {
          _userName = 'User';
          _userEmail = 'No email';
        });
      }
    }
  }

  Future<void> _handleLogout() async {
    await ref.read(supabaseAuthProvider).signOut();
    if (mounted) {
      context.go('/signin');
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final displayName = _userName.isNotEmpty ? _userName : l10n.profileDefaultName;
    final displayEmail =
        _userEmail.isNotEmpty ? _userEmail : l10n.profileDefaultEmail;
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        title: Text(l10n.profileScreenTitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.push('/settings'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          children: [
            // Profile header
            AppCard(
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        displayName.isNotEmpty
                            ? displayName[0].toUpperCase()
                            : '',
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Text(
                    displayName,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    displayEmail,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textLight,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            // Profile options
            _buildOptionItem(
              icon: Icons.person_outline,
              title: l10n.profileOptionEditProfile,
              onTap: () {
                // TODO: Navigate to edit profile
              },
            ),
            const SizedBox(height: AppSpacing.sm),
            _buildOptionItem(
              icon: Icons.health_and_safety_outlined,
              title: l10n.profileOptionHealthRecords,
              onTap: () {
                // TODO: Navigate to health records
              },
            ),
            const SizedBox(height: AppSpacing.sm),
            _buildOptionItem(
              icon: Icons.psychology_outlined,
              title: l10n.profileOptionCounselingHistory,
              onTap: () {
                // TODO: Navigate to counseling history
              },
            ),
            const SizedBox(height: AppSpacing.sm),
            _buildOptionItem(
              icon: Icons.account_balance_wallet_outlined,
              title: l10n.profileOptionFinancialGoals,
              onTap: () {
                // TODO: Navigate to financial goals
              },
            ),
            const SizedBox(height: AppSpacing.sm),
            _buildOptionItem(
              icon: Icons.notifications_outlined,
              title: l10n.profileOptionNotifications,
              onTap: () => context.push('/notifications'),
            ),
            const SizedBox(height: AppSpacing.sm),
            _buildOptionItem(
              icon: Icons.help_outline,
              title: l10n.profileOptionHelpSupport,
              onTap: () {
                // TODO: Navigate to help
              },
            ),
            const SizedBox(height: AppSpacing.sm),
            _buildOptionItem(
              icon: Icons.info_outline,
              title: l10n.profileOptionAbout,
              onTap: () {
                // TODO: Show about dialog
              },
            ),
            const SizedBox(height: AppSpacing.lg),
            // Logout button
            AppCard(
              onTap: _handleLogout,
              color: AppColors.error.withOpacity(0.1),
              child: Row(
                children: [
                  const Icon(Icons.logout, color: AppColors.error),
                  const SizedBox(width: AppSpacing.md),
                  Text(
                    l10n.profileLogout,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.error,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return AppCard(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: AppColors.textDark),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.textDark,
              ),
            ),
          ),
          const Icon(Icons.chevron_right, color: AppColors.textLight),
        ],
      ),
    );
  }
}

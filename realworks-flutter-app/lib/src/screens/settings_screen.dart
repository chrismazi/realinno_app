import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../widgets/app_card.dart';
import '../widgets/section_title.dart';

/// Settings screen
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _emailNotifications = true;
  bool _pushNotifications = true;
  bool _darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        title: const Text('Settings'),
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
            const SectionTitle(title: 'Notifications'),
            const SizedBox(height: AppSpacing.md),
            AppCard(
              child: Column(
                children: [
                  _buildSwitchItem(
                    title: 'Enable Notifications',
                    subtitle: 'Receive app notifications',
                    value: _notificationsEnabled,
                    onChanged: (value) {
                      setState(() {
                        _notificationsEnabled = value;
                      });
                    },
                  ),
                  const Divider(height: AppSpacing.lg),
                  _buildSwitchItem(
                    title: 'Push Notifications',
                    subtitle: 'Get notified on your device',
                    value: _pushNotifications,
                    onChanged: (value) {
                      setState(() {
                        _pushNotifications = value;
                      });
                    },
                  ),
                  const Divider(height: AppSpacing.lg),
                  _buildSwitchItem(
                    title: 'Email Notifications',
                    subtitle: 'Receive updates via email',
                    value: _emailNotifications,
                    onChanged: (value) {
                      setState(() {
                        _emailNotifications = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            const SectionTitle(title: 'Appearance'),
            const SizedBox(height: AppSpacing.md),
            AppCard(
              child: _buildSwitchItem(
                title: 'Dark Mode',
                subtitle: 'Use dark theme',
                value: _darkModeEnabled,
                onChanged: (value) {
                  setState(() {
                    _darkModeEnabled = value;
                  });
                  // TODO: Implement theme switching
                },
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            const SectionTitle(title: 'Account'),
            const SizedBox(height: AppSpacing.md),
            _buildOptionItem(
              icon: Icons.lock_outline,
              title: 'Change Password',
              onTap: () {
                // TODO: Navigate to change password
              },
            ),
            const SizedBox(height: AppSpacing.sm),
            _buildOptionItem(
              icon: Icons.privacy_tip_outlined,
              title: 'Privacy Settings',
              onTap: () {
                // TODO: Navigate to privacy settings
              },
            ),
            const SizedBox(height: AppSpacing.sm),
            _buildOptionItem(
              icon: Icons.security,
              title: 'Security',
              onTap: () {
                // TODO: Navigate to security
              },
            ),
            const SizedBox(height: AppSpacing.lg),
            const SectionTitle(title: 'Support'),
            const SizedBox(height: AppSpacing.md),
            _buildOptionItem(
              icon: Icons.help_outline,
              title: 'Help Center',
              onTap: () {
                // TODO: Navigate to help
              },
            ),
            const SizedBox(height: AppSpacing.sm),
            _buildOptionItem(
              icon: Icons.feedback_outlined,
              title: 'Send Feedback',
              onTap: () {
                // TODO: Show feedback form
              },
            ),
            const SizedBox(height: AppSpacing.sm),
            _buildOptionItem(
              icon: Icons.description_outlined,
              title: 'Terms of Service',
              onTap: () {
                // TODO: Show terms
              },
            ),
            const SizedBox(height: AppSpacing.sm),
            _buildOptionItem(
              icon: Icons.shield_outlined,
              title: 'Privacy Policy',
              onTap: () {
                // TODO: Show privacy policy
              },
            ),
            const SizedBox(height: AppSpacing.lg),
            const Center(
              child: Text(
                'RealWorks EAP v1.0.0',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.textGray,
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchItem({
    required String title,
    required String subtitle,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Row(
      children: [
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
                subtitle,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textLight,
                ),
              ),
            ],
          ),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: AppColors.primary,
        ),
      ],
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

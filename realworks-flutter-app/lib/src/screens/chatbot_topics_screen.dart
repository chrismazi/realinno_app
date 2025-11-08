import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../widgets/app_card.dart';

/// Chatbot topics/categories screen
class ChatbotTopicsScreen extends StatelessWidget {
  const ChatbotTopicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        title: const Text('Choose a Topic'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          const Text(
            'What would you like to talk about?',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          _buildTopicCard(
            icon: Icons.psychology_outlined,
            title: 'Mental Wellbeing',
            subtitle: 'Stress, anxiety, and emotional health',
            color: Colors.purple,
            onTap: () => context.push('/ai-companion-chat'),
          ),
          const SizedBox(height: AppSpacing.sm),
          _buildTopicCard(
            icon: Icons.account_balance_wallet_outlined,
            title: 'Financial Planning',
            subtitle: 'Budgeting, saving, and money management',
            color: Colors.green,
            onTap: () => context.push('/ai-companion-chat'),
          ),
          const SizedBox(height: AppSpacing.sm),
          _buildTopicCard(
            icon: Icons.health_and_safety_outlined,
            title: 'Physical Health',
            subtitle: 'Exercise, nutrition, and wellness',
            color: Colors.red,
            onTap: () => context.push('/ai-companion-chat'),
          ),
          const SizedBox(height: AppSpacing.sm),
          _buildTopicCard(
            icon: Icons.work_outline,
            title: 'Work-Life Balance',
            subtitle: 'Managing shift work and time',
            color: Colors.blue,
            onTap: () => context.push('/ai-companion-chat'),
          ),
          const SizedBox(height: AppSpacing.sm),
          _buildTopicCard(
            icon: Icons.family_restroom,
            title: 'Family & Relationships',
            subtitle: 'Support for family matters',
            color: Colors.orange,
            onTap: () => context.push('/ai-companion-chat'),
          ),
          const SizedBox(height: AppSpacing.sm),
          _buildTopicCard(
            icon: Icons.school_outlined,
            title: 'Learning & Development',
            subtitle: 'Skills training and education',
            color: Colors.indigo,
            onTap: () => context.push('/learning-hub-courses'),
          ),
        ],
      ),
    );
  }

  Widget _buildTopicCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AppCard(
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
              ),
              child: Icon(icon, color: color, size: 28),
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
                    subtitle,
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
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../widgets/app_card.dart';

/// Chat resources and articles screen
class ChatResourcesScreen extends StatelessWidget {
  const ChatResourcesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        title: const Text('Resources'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          const Text(
            'Recommended Resources',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          _buildResourceCard(
            title: 'Managing Stress at Work',
            category: 'Mental Health',
            duration: '8 min read',
            icon: Icons.article,
            color: Colors.blue,
          ),
          const SizedBox(height: AppSpacing.sm),
          _buildResourceCard(
            title: 'Building Financial Resilience',
            category: 'Finance',
            duration: '12 min read',
            icon: Icons.account_balance_wallet,
            color: Colors.green,
          ),
          const SizedBox(height: AppSpacing.sm),
          _buildResourceCard(
            title: 'Mindful Breathing Exercises',
            category: 'Wellness',
            duration: '5 min',
            icon: Icons.self_improvement,
            color: Colors.purple,
          ),
          const SizedBox(height: AppSpacing.sm),
          _buildResourceCard(
            title: 'Sleep Better with Shift Work',
            category: 'Health',
            duration: '10 min read',
            icon: Icons.bedtime,
            color: Colors.indigo,
          ),
          const SizedBox(height: AppSpacing.sm),
          _buildResourceCard(
            title: 'Conflict Resolution Tips',
            category: 'Relationships',
            duration: '7 min read',
            icon: Icons.people,
            color: Colors.orange,
          ),
        ],
      ),
    );
  }

  Widget _buildResourceCard({
    required String title,
    required String category,
    required String duration,
    required IconData icon,
    required Color color,
  }) {
    return AppCard(
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
                  '$category • $duration',
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

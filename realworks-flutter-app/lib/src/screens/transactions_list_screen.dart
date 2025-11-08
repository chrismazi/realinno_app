import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../widgets/app_card.dart';
import '../widgets/section_title.dart';

/// All transactions list screen
class TransactionsListScreen extends StatelessWidget {
  const TransactionsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        title: const Text('All Transactions'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // Show filter options
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          const SectionTitle(title: 'Today'),
          const SizedBox(height: AppSpacing.sm),
          _buildTransactionItem(
            icon: Icons.restaurant,
            category: 'Food',
            description: 'Lunch at Cafe',
            amount: -25.50,
            time: '12:30 PM',
          ),
          const SizedBox(height: AppSpacing.sm),
          _buildTransactionItem(
            icon: Icons.local_gas_station,
            category: 'Transport',
            description: 'Fuel',
            amount: -60.00,
            time: '09:15 AM',
          ),
          const SizedBox(height: AppSpacing.lg),
          const SectionTitle(title: 'Yesterday'),
          const SizedBox(height: AppSpacing.sm),
          _buildTransactionItem(
            icon: Icons.shopping_bag,
            category: 'Shopping',
            description: 'Groceries',
            amount: -120.75,
            time: '06:45 PM',
          ),
          const SizedBox(height: AppSpacing.sm),
          _buildTransactionItem(
            icon: Icons.account_balance_wallet,
            category: 'Income',
            description: 'Salary',
            amount: 4500.00,
            time: '09:00 AM',
          ),
          const SizedBox(height: AppSpacing.lg),
          const SectionTitle(title: 'This Week'),
          const SizedBox(height: AppSpacing.sm),
          _buildTransactionItem(
            icon: Icons.movie,
            category: 'Entertainment',
            description: 'Movie Tickets',
            amount: -45.00,
            time: 'Mon 7:30 PM',
          ),
          const SizedBox(height: AppSpacing.sm),
          _buildTransactionItem(
            icon: Icons.receipt_long,
            category: 'Bills',
            description: 'Electricity Bill',
            amount: -89.50,
            time: 'Mon 2:00 PM',
          ),
          const SizedBox(height: AppSpacing.sm),
          _buildTransactionItem(
            icon: Icons.phone_android,
            category: 'Bills',
            description: 'Phone Bill',
            amount: -55.00,
            time: 'Sun 10:00 AM',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/add-transaction');
        },
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: AppColors.white),
      ),
    );
  }

  Widget _buildTransactionItem({
    required IconData icon,
    required String category,
    required String description,
    required double amount,
    required String time,
  }) {
    final isIncome = amount > 0;
    final color = isIncome ? AppColors.success : AppColors.textDark;

    return AppCard(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            ),
            child: Icon(
              icon,
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
                  category,
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
                const SizedBox(height: 2),
                Text(
                  time,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.textGray,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '${isIncome ? '+' : ''}\$${amount.abs().toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:realworks_app/l10n/app_localizations.dart';
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
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        title: Text(l10n.transactionsListTitle),
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
          SectionTitle(title: l10n.transactionsSectionToday),
          const SizedBox(height: AppSpacing.sm),
          _buildTransactionItem(
            icon: Icons.restaurant,
            category: l10n.budgetCategoryFood,
            description: l10n.transactionsDescriptionLunchCafe,
            amount: -25.50,
            time: l10n.transactionsTimeLunchCafe,
          ),
          const SizedBox(height: AppSpacing.sm),
          _buildTransactionItem(
            icon: Icons.local_gas_station,
            category: l10n.budgetCategoryTransport,
            description: l10n.transactionsDescriptionFuel,
            amount: -60.00,
            time: l10n.transactionsTimeFuel,
          ),
          const SizedBox(height: AppSpacing.lg),
          SectionTitle(title: l10n.transactionsSectionYesterday),
          const SizedBox(height: AppSpacing.sm),
          _buildTransactionItem(
            icon: Icons.shopping_bag,
            category: l10n.transactionsCategoryShopping,
            description: l10n.transactionsDescriptionGroceries,
            amount: -120.75,
            time: l10n.transactionsTimeGroceries,
          ),
          const SizedBox(height: AppSpacing.sm),
          _buildTransactionItem(
            icon: Icons.account_balance_wallet,
            category: l10n.transactionsCategoryIncome,
            description: l10n.transactionsDescriptionSalary,
            amount: 4500.00,
            time: l10n.transactionsTimeSalary,
          ),
          const SizedBox(height: AppSpacing.lg),
          SectionTitle(title: l10n.transactionsSectionWeek),
          const SizedBox(height: AppSpacing.sm),
          _buildTransactionItem(
            icon: Icons.movie,
            category: l10n.transactionsCategoryEntertainment,
            description: l10n.transactionsDescriptionMovieTickets,
            amount: -45.00,
            time: l10n.transactionsTimeMovieTickets,
          ),
          const SizedBox(height: AppSpacing.sm),
          _buildTransactionItem(
            icon: Icons.receipt_long,
            category: l10n.transactionsCategoryBills,
            description: l10n.transactionsDescriptionElectricityBill,
            amount: -89.50,
            time: l10n.transactionsTimeElectricityBill,
          ),
          const SizedBox(height: AppSpacing.sm),
          _buildTransactionItem(
            icon: Icons.phone_android,
            category: l10n.transactionsCategoryBills,
            description: l10n.transactionsDescriptionPhoneBill,
            amount: -55.00,
            time: l10n.transactionsTimePhoneBill,
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
            'RWF ${amount.abs().toStringAsFixed(2)}',
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

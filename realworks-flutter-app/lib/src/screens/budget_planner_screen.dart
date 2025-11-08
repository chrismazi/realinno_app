import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../widgets/app_card.dart';
import '../widgets/section_title.dart';
import '../widgets/primary_button.dart';

/// Budget planner dashboard screen
class BudgetPlannerScreen extends StatelessWidget {
  const BudgetPlannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        title: const Text('Budget Planner'),
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
            // Total Balance Card
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total Balance',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.textLight,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.visibility_outlined),
                        onPressed: () {
                          // Toggle visibility
                        },
                        color: AppColors.textLight,
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  const Text(
                    '\$12,854.67',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Row(
                    children: [
                      const Icon(
                        Icons.trending_up,
                        color: AppColors.success,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '12.5% this month',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.success,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),
                  // Chart placeholder
                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                      color: AppColors.gray900,
                      borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.show_chart,
                        size: 48,
                        color: AppColors.primary.withOpacity(0.5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            // Expense by Category
            const SectionTitle(title: 'Expense by Category'),
            const SizedBox(height: AppSpacing.md),
            AppCard(
              child: Row(
                children: [
                  // Donut chart
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: CircularProgressIndicator(
                            value: 0.7,
                            strokeWidth: 16,
                            backgroundColor: AppColors.gray200,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                AppColors.primary),
                          ),
                        ),
                        const Text(
                          '\$2,140',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textDark,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: AppSpacing.lg),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildCategoryItem(
                          'Food',
                          '\$1280',
                          AppColors.primary,
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        _buildCategoryItem(
                          'Transport',
                          '\$540',
                          AppColors.info,
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        _buildCategoryItem(
                          'Family Support',
                          '\$320',
                          Colors.purple,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.xxl),
            // Add Transaction Button
            Center(
              child: PrimaryButton(
                text: 'Add Transaction',
                icon: Icons.add,
                onPressed: () {
                  context.push('/add-transaction');
                },
                isFullWidth: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(String label, String amount, Color color) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textDark,
            ),
          ),
        ),
        Text(
          amount,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.textDark,
          ),
        ),
      ],
    );
  }
}

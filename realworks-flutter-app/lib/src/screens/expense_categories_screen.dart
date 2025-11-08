import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../widgets/app_card.dart';
import '../widgets/primary_button.dart';

/// Expense categories setup screen
class ExpenseCategoriesScreen extends StatefulWidget {
  const ExpenseCategoriesScreen({super.key});

  @override
  State<ExpenseCategoriesScreen> createState() =>
      _ExpenseCategoriesScreenState();
}

class _ExpenseCategoriesScreenState extends State<ExpenseCategoriesScreen> {
  final List<CategoryItem> _categories = [
    CategoryItem(icon: Icons.restaurant, name: 'Food', color: Colors.orange),
    CategoryItem(icon: Icons.directions_car, name: 'Transport', color: Colors.blue),
    CategoryItem(icon: Icons.shopping_bag, name: 'Shopping', color: Colors.purple),
    CategoryItem(icon: Icons.home, name: 'Housing', color: Colors.green),
    CategoryItem(icon: Icons.medical_services, name: 'Healthcare', color: Colors.red),
    CategoryItem(icon: Icons.school, name: 'Education', color: Colors.indigo),
    CategoryItem(icon: Icons.movie, name: 'Entertainment', color: Colors.pink),
    CategoryItem(icon: Icons.fitness_center, name: 'Fitness', color: Colors.teal),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        title: const Text('Expense Categories'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Set up your expense categories',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                const Text(
                  'Choose the categories that match your spending habits',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textLight,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(AppSpacing.lg),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: AppSpacing.md,
                crossAxisSpacing: AppSpacing.md,
                childAspectRatio: 1.2,
              ),
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                return _buildCategoryCard(_categories[index]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: PrimaryButton(
              text: 'Save Categories',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Categories saved successfully'),
                    backgroundColor: AppColors.success,
                  ),
                );
                context.pop();
              },
              isFullWidth: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(CategoryItem category) {
    return AppCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: category.color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              category.icon,
              color: category.color,
              size: 28,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            category.name,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.textDark,
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryItem {
  final IconData icon;
  final String name;
  final Color color;

  CategoryItem({
    required this.icon,
    required this.name,
    required this.color,
  });
}

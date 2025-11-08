import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../widgets/app_text_field.dart';
import '../widgets/primary_button.dart';

/// Goal setup screen
class GoalSetupScreen extends StatefulWidget {
  const GoalSetupScreen({super.key});

  @override
  State<GoalSetupScreen> createState() => _GoalSetupScreenState();
}

class _GoalSetupScreenState extends State<GoalSetupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _goalNameController = TextEditingController();
  final _targetAmountController = TextEditingController();
  final _currentAmountController = TextEditingController();
  
  DateTime _targetDate = DateTime.now().add(const Duration(days: 365));

  @override
  void dispose() {
    _goalNameController.dispose();
    _targetAmountController.dispose();
    _currentAmountController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _targetDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
    );
    if (picked != null && picked != _targetDate) {
      setState(() {
        _targetDate = picked;
      });
    }
  }

  void _saveGoal() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Goal created successfully'),
          backgroundColor: AppColors.success,
        ),
      );
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        title: const Text('Create Savings Goal'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Set your financial goal',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              const Text(
                'Track your progress towards achieving your financial objectives',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textLight,
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              const Text(
                'Goal Name',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              AppTextField(
                controller: _goalNameController,
                hintText: 'e.g. Emergency Fund, New Car',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a goal name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: AppSpacing.lg),
              const Text(
                'Target Amount',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              AppTextField(
                controller: _targetAmountController,
                hintText: '\$5,000',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a target amount';
                  }
                  return null;
                },
              ),
              const SizedBox(height: AppSpacing.lg),
              const Text(
                'Current Amount (Optional)',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              AppTextField(
                controller: _currentAmountController,
                hintText: '\$0',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: AppSpacing.lg),
              const Text(
                'Target Date',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: Container(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    color: AppColors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${_targetDate.day}/${_targetDate.month}/${_targetDate.year}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.textDark,
                        ),
                      ),
                      const Icon(
                        Icons.calendar_today,
                        color: AppColors.textLight,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.xxl),
              PrimaryButton(
                text: 'Create Goal',
                onPressed: _saveGoal,
                isFullWidth: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../widgets/app_text_field.dart';
import '../widgets/primary_button.dart';

/// Income setup screen
class IncomeSetupScreen extends StatefulWidget {
  const IncomeSetupScreen({super.key});

  @override
  State<IncomeSetupScreen> createState() => _IncomeSetupScreenState();
}

class _IncomeSetupScreenState extends State<IncomeSetupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _monthlyIncomeController = TextEditingController();
  final _additionalIncomeController = TextEditingController();
  
  String _incomeFrequency = 'Monthly';
  String _incomeSource = 'Salary';

  @override
  void dispose() {
    _monthlyIncomeController.dispose();
    _additionalIncomeController.dispose();
    super.dispose();
  }

  void _saveIncome() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Income information saved successfully'),
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
        title: const Text('Income Setup'),
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
                'Set up your income',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              const Text(
                'Help us understand your financial situation',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textLight,
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              const Text(
                'Primary Income Source',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              DropdownButtonFormField<String>(
                value: _incomeSource,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.white.withOpacity(0.7),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                    vertical: AppSpacing.md,
                  ),
                ),
                items: ['Salary', 'Business', 'Freelance', 'Pension', 'Other']
                    .map((source) {
                  return DropdownMenuItem(
                    value: source,
                    child: Text(source),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _incomeSource = value!;
                  });
                },
              ),
              const SizedBox(height: AppSpacing.lg),
              const Text(
                'Income Amount',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              AppTextField(
                controller: _monthlyIncomeController,
                hintText: '\$4,500',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your income amount';
                  }
                  return null;
                },
              ),
              const SizedBox(height: AppSpacing.lg),
              const Text(
                'Income Frequency',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              DropdownButtonFormField<String>(
                value: _incomeFrequency,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.white.withOpacity(0.7),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                    vertical: AppSpacing.md,
                  ),
                ),
                items: ['Weekly', 'Bi-weekly', 'Monthly', 'Annually']
                    .map((frequency) {
                  return DropdownMenuItem(
                    value: frequency,
                    child: Text(frequency),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _incomeFrequency = value!;
                  });
                },
              ),
              const SizedBox(height: AppSpacing.lg),
              const Text(
                'Additional Income (Optional)',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              AppTextField(
                controller: _additionalIncomeController,
                hintText: '\$0',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: AppSpacing.sm),
              const Text(
                'Include any side income, investments, or other sources',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.textGray,
                ),
              ),
              const SizedBox(height: AppSpacing.xxl),
              PrimaryButton(
                text: 'Save Income',
                onPressed: _saveIncome,
                isFullWidth: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

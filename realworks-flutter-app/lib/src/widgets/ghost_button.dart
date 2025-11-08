import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';

/// Ghost/Text button for secondary actions
class GhostButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? color;
  final FontWeight? fontWeight;

  const GhostButton({
    required this.text,
    this.onPressed,
    this.color,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: color ?? AppColors.textLight,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          fontWeight: fontWeight ?? FontWeight.w500,
        ),
      ),
    );
  }
}

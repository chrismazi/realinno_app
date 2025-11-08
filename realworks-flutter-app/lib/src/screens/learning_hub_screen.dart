import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../widgets/primary_button.dart';

/// Certificate celebration screen shown from Learning tab
class LearningHubScreen extends StatelessWidget {
  const LearningHubScreen({super.key, this.extra});

  final Map<String, dynamic>? extra;

  @override
  Widget build(BuildContext context) {
    final certificateTitle = extra?['title'] as String? ?? 'Heavy Machinery Safety';
    final certificateSubtitle = extra?['subtitle'] as String? ?? 'Completed: 15 Oct 2023';
    final imageUrl = extra?['imageUrl'] as String?;

    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Certificate Earned'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildConfettiHeader(),
            const SizedBox(height: AppSpacing.lg),
            const Text(
              'Congratulations!',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w700,
                color: AppColors.textDark,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              certificateSubtitle,
              style: const TextStyle(
                fontSize: 15,
                color: AppColors.textLight,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.xl),
            _buildCertificateCard(title: certificateTitle, imageUrl: imageUrl),
            const SizedBox(height: AppSpacing.xxl),
            _buildActions(context, certificateTitle),
          ],
        ),
      ),
    );
  }

  Widget _buildConfettiHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        18,
        (index) => Container(
          width: 8,
          height: 24,
          margin: const EdgeInsets.symmetric(horizontal: 3),
          decoration: BoxDecoration(
            color: [
              const Color(0xFFF97316),
              const Color(0xFF38BDF8),
              const Color(0xFFFB923C),
              const Color(0xFF6366F1),
            ][index % 4],
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }

  Widget _buildCertificateCard({required String title, String? imageUrl}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF4A3728),
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowMedium,
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (imageUrl != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                child: Image.network(
                  imageUrl,
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            if (imageUrl != null) const SizedBox(height: AppSpacing.md),
            const Text(
              'CERTIFICATE',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            const Text(
              'REALWORKS EMPLOYEE ASSISTANCE PROGRAM',
              style: TextStyle(
                fontSize: 10,
                color: AppColors.textLight,
                letterSpacing: 1.1,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.textDark,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.xs),
            const Text(
              'Awarded to Alex Johnson',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textLight,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.lg),
            Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                color: Color(0xFFF97316),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.verified,
                color: Colors.white,
                size: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActions(BuildContext context, String title) {
    return Column(
      children: [
        PrimaryButton(
          text: 'Download Certificate',
          icon: Icons.download,
          isFullWidth: true,
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('$title downloaded'),
                backgroundColor: AppColors.success,
              ),
            );
          },
        ),
        const SizedBox(height: AppSpacing.md),
        OutlinedButton.icon(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('$title shared to profile'),
                backgroundColor: AppColors.success,
              ),
            );
          },
          icon: const Icon(Icons.share),
          label: const Text('Share to Profile'),
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.primary,
            side: const BorderSide(color: AppColors.primary, width: 2),
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.xl,
              vertical: AppSpacing.md,
            ),
            minimumSize: const Size(double.infinity, 52),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';

/// SRH & Family Planning educational screen - matching clean design
class SrhFamilyPlanningScreen extends StatelessWidget {
  const SrhFamilyPlanningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        backgroundColor: AppColors.offWhite,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'SRH & Family Planning',
          style: TextStyle(
            color: AppColors.textDark,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Understanding Contraception Card
              _buildHealthCard(
                icon: Icons.shield_outlined,
                iconColor: AppColors.primary,
                title: 'Understanding Contraception',
                subtitle: 'Explore different methods and find what\'s right for you.',
                imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAv9eKUvF9G7gPr3ggKbg1CoJ-PGUc-XtNfFcG0wAxfJ5iBLDl3HihiPxVQz3m50BsK3-oxZU6J1TjroZXDB4X_O3o-hv_y9igGuXita-DXCvbZpT9OCIfHm04yuOstWYpMxemZmUEEakqW85LpXFMWyg8n6hImyA6k0qWYyz4m-SeEbRGmofgA87PvA643VNtFNTEEbaTbwyLoXBu0RsyqEYzIyeyIPsuD1iZoEw1XW7znTi5tJeVUX6sWt5Uornb-6KPeX7CNwb4',
                backgroundColor: const Color(0xFFB0E0E6).withOpacity(0.2),
                onTap: () {},
              ),
              const SizedBox(height: 16),
              
              // Planning for a Family Card
              _buildHealthCard(
                icon: Icons.family_restroom,
                iconColor: AppColors.primary,
                title: 'Planning for a Family',
                subtitle: 'Resources and support for your journey to parenthood.',
                imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuB-Y694N-6I_QDJAtNbTba7QN2gUnkU1Sf9q2msvZGBN7DKSkeL0nJtZQp8lrC8ZYsMYPYcoqN91kUHQddtqBFGMsqHgB07yzHwwLxZSmZSJR1EbEae3koqzGeTxX7zEQn29J08Yo3sOBCX031_D_odruOWAm02ULmSMd6ImmeU81B50h1vOkKlASDmeKO3WWqRKI7XCTj1_6yKvqJhVwBeVSl5Zrv31tqJ6cjuQK8qUsAA1kGitIicyOwAbZy_EP_5gWAICio7-mU',
                backgroundColor: const Color(0xFFB0E0E6).withOpacity(0.2),
                onTap: () {},
              ),
              const SizedBox(height: 16),
              
              // Men's Reproductive Health Card
              _buildHealthCard(
                icon: Icons.male,
                iconColor: AppColors.primary,
                title: "Men's Reproductive Health",
                subtitle: 'Information on health, wellness, and preventative care.',
                imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBenVMuDCMT1GgC_J5KgOd9CwYdJtC5BJ5PZvbM2BDDCh7awvd29VIg2V45ArvvN5lQK1KGvkHwja0v3xC0hq9vaGjz-DRl8NQOK-D2dJ7Vqzt9o5fV5V8S3DWJr9ahCZHvRlaj5nVevPgYZPsYK3Avca1CqGWTIcB4HpqF_RsRoCKpqMviSZG6bR0WoxeneCu4R-drljH-p5mU_KRp-TwuXKs1xGJ64MDzBj9ALenF_-4WtjfJE44Yv82oSp6If8rN_yW3-vPBr5A',
                backgroundColor: const Color(0xFFFFDAB9).withOpacity(0.2),
                onTap: () {},
              ),
              const SizedBox(height: 16),
              
              // Women's Reproductive Health Card
              _buildHealthCard(
                icon: Icons.female,
                iconColor: AppColors.primary,
                title: "Women's Reproductive Health",
                subtitle: 'Guidance on cycles, health screenings, and more.',
                imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCNdM0AGZDhQS2qvyp08uKmBmqpYocEGxlowZjBpwfP5Uj2pSfu4572EOfFgBzUJIVwc2IP9F2IjrBDAFZXE1vFmp-_CyHqsoXamjIrOwhDyMfrNDAHsrMWBHRu0cCApmKa1dRbvlVxKIVmoC7EiANyYul8gCTHRVCZ_ohoq6bxAC87LvCjNbTCynicHIGmBHFhUkcXi_H4S547hmchdVr43blj4sefeX19gAOS-efP6i9xMyPkEfw5TLgBRZEA_0raXaVOmPqUCBw',
                backgroundColor: const Color(0xFFB0E0E6).withOpacity(0.2),
                onTap: () {},
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHealthCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String imageUrl,
    required Color backgroundColor,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with icon and text
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFDAB9).withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    color: iconColor,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
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
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Image container
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: backgroundColor,
                      child: Icon(
                        icon,
                        size: 48,
                        color: iconColor.withOpacity(0.3),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Learn More button
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: onTap,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Learn More',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../widgets/app_card.dart';

/// Session history and past appointments screen
class SessionHistoryScreen extends StatelessWidget {
  const SessionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        title: const Text('Session History'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          const Text(
            'Upcoming Sessions',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          _buildSessionCard(
            counselor: 'Dr. Sarah Johnson',
            specialty: 'Clinical Psychologist',
            date: 'Monday, Nov 13',
            time: '10:00 AM',
            status: 'Upcoming',
            statusColor: AppColors.primary,
          ),
          const SizedBox(height: AppSpacing.lg),
          const Text(
            'Past Sessions',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          _buildSessionCard(
            counselor: 'Dr. Michael Chen',
            specialty: 'Mental Health Counselor',
            date: 'Friday, Nov 3',
            time: '02:00 PM',
            status: 'Completed',
            statusColor: AppColors.success,
          ),
          const SizedBox(height: AppSpacing.sm),
          _buildSessionCard(
            counselor: 'Dr. Sarah Johnson',
            specialty: 'Clinical Psychologist',
            date: 'Monday, Oct 23',
            time: '10:00 AM',
            status: 'Completed',
            statusColor: AppColors.success,
          ),
          const SizedBox(height: AppSpacing.sm),
          _buildSessionCard(
            counselor: 'Dr. Emily Rodriguez',
            specialty: 'Family Therapist',
            date: 'Wednesday, Oct 11',
            time: '03:00 PM',
            status: 'Completed',
            statusColor: AppColors.success,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.push('/counselor-booking');
        },
        backgroundColor: AppColors.primary,
        icon: const Icon(Icons.add, color: AppColors.white),
        label: const Text(
          'Book Session',
          style: TextStyle(color: AppColors.white),
        ),
      ),
    );
  }

  Widget _buildSessionCard({
    required String counselor,
    required String specialty,
    required String date,
    required String time,
    required String status,
    required Color statusColor,
  }) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: AppColors.primary.withOpacity(0.1),
                child: const Icon(
                  Icons.person,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      counselor,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textDark,
                      ),
                    ),
                    Text(
                      specialty,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textLight,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: statusColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              const Icon(Icons.calendar_today, size: 16, color: AppColors.textLight),
              const SizedBox(width: 4),
              Text(
                date,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textLight,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              const Icon(Icons.access_time, size: 16, color: AppColors.textLight),
              const SizedBox(width: 4),
              Text(
                time,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textLight,
                ),
              ),
            ],
          ),
          if (status == 'Upcoming') ...[
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.error,
                      side: const BorderSide(color: AppColors.error),
                    ),
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                    ),
                    child: const Text('Join'),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

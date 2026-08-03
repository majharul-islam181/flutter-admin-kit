import 'package:flutter/material.dart';
import 'package:flutter_admin_kit/core/theme/app_colors.dart';
import 'package:flutter_admin_kit/features/dashboard/data/models/dashboard_models.dart';

class StatCard extends StatelessWidget {
  final DashboardStat stat;
  final IconData icon;

  const StatCard({
    super.key,
    required this.stat,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: AppColors.getCardShadow(context),
            offset: const Offset(0, 1),
            blurRadius: 4,
          ),
        ],
        border: Border.all(
          color: theme.colorScheme.outline.withOpacity(isDark ? 0.2 : 0.5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.tailAdminPrimary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: AppColors.tailAdminPrimary,
              size: 24,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            stat.value,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                stat.title,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${stat.percentageChange}%',
                    style: TextStyle(
                      color: stat.isPositive ? AppColors.success : AppColors.info, // Down uses blue in Tailadmin reference for users
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                  Icon(
                    stat.isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                    color: stat.isPositive ? AppColors.success : AppColors.info,
                    size: 14,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

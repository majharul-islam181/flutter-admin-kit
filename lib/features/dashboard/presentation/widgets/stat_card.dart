import 'package:flutter/material.dart';
import 'package:flutter_admin_kit/core/theme/app_colors.dart';
import 'package:flutter_admin_kit/features/dashboard/data/models/dashboard_models.dart';

class StatCard extends StatefulWidget {
  final DashboardStat stat;
  final IconData icon;

  const StatCard({super.key, required this.stat, required this.icon});

  @override
  State<StatCard> createState() => _StatCardState();
}

class _StatCardState extends State<StatCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? AppColors.getCardShadow(context).withValues(alpha: 0.15)
                  : AppColors.getCardShadow(context),
              offset: Offset(0, _isHovered ? 8 : 1),
              blurRadius: _isHovered ? 12 : 4,
            ),
          ],
          border: Border.all(
            color: _isHovered
                ? theme.colorScheme.primary.withValues(alpha: 0.3)
                : theme.colorScheme.outline.withValues(
                    alpha: isDark ? 0.2 : 0.5,
                  ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.tailAdminPrimary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                widget.icon,
                color: AppColors.tailAdminPrimary,
                size: 24,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.stat.value,
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
                  widget.stat.title,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '${widget.stat.percentageChange}%',
                      style: TextStyle(
                        color: widget.stat.isPositive
                            ? AppColors.success
                            : AppColors.info,
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                    ),
                    Icon(
                      widget.stat.isPositive
                          ? Icons.arrow_upward
                          : Icons.arrow_downward,
                      color: widget.stat.isPositive
                          ? AppColors.success
                          : AppColors.info,
                      size: 14,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

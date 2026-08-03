import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_admin_kit/core/theme/app_colors.dart';
import 'package:flutter_admin_kit/features/dashboard/data/models/dashboard_models.dart';

class RevenueSalesChart extends StatelessWidget {
  final List<ChartDataPoint> data;

  const RevenueSalesChart({super.key, required this.data});

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
          color: theme.colorScheme.outline.withValues(
            alpha: isDark ? 0.2 : 0.5,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(
                spacing: 24,
                children: [
                  _LegendItem(
                    title: 'Total Revenue',
                    dateRange: '12.04.2022 - 12.05.2022',
                    color: AppColors.tailAdminPrimary,
                  ),
                  _LegendItem(
                    title: 'Total Sales',
                    dateRange: '12.04.2022 - 12.05.2022',
                    color: AppColors.tailAdminChartBlue,
                  ),
                ],
              ),
              Row(
                children: [
                  _DateToggle(label: 'Day', isSelected: false),
                  _DateToggle(label: 'Week', isSelected: true),
                  _DateToggle(label: 'Month', isSelected: false),
                ],
              ),
            ],
          ),
          const SizedBox(height: 32),
          // Chart
          SizedBox(
            height: 300,
            child: RepaintBoundary(
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: true,
                    horizontalInterval: 10,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: theme.colorScheme.outline.withValues(
                          alpha: isDark ? 0.2 : 0.5,
                        ),
                        strokeWidth: 1,
                      );
                    },
                    getDrawingVerticalLine: (value) {
                      return FlLine(
                        color: theme.colorScheme.outline.withValues(
                          alpha: isDark ? 0.2 : 0.5,
                        ),
                        strokeWidth: 1,
                      );
                    },
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        interval: 1,
                        getTitlesWidget: (value, meta) {
                          if (value.toInt() >= 0 &&
                              value.toInt() < data.length) {
                            return SideTitleWidget(
                              axisSide: meta.axisSide,
                              space: 8,
                              child: Text(
                                data[value.toInt()].label,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: theme.colorScheme.onSurfaceVariant,
                                ),
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 10,
                        reservedSize: 42,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            value.toInt().toString(),
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                            textAlign: TextAlign.left,
                          );
                        },
                      ),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border(
                      bottom: BorderSide(
                        color: theme.colorScheme.outline.withValues(
                          alpha: isDark ? 0.2 : 0.5,
                        ),
                      ),
                      left: BorderSide(
                        color: theme.colorScheme.outline.withValues(
                          alpha: isDark ? 0.2 : 0.5,
                        ),
                      ),
                    ),
                  ),
                  minX: 0,
                  maxX: (data.length - 1).toDouble(),
                  minY: 0,
                  maxY: 100,
                  lineBarsData: [
                    LineChartBarData(
                      spots: data
                          .asMap()
                          .entries
                          .map((e) => FlSpot(e.key.toDouble(), e.value.revenue))
                          .toList(),
                      isCurved: true,
                      color: AppColors.tailAdminPrimary,
                      barWidth: 2,
                      isStrokeCapRound: true,
                      dotData: const FlDotData(show: true),
                      belowBarData: BarAreaData(
                        show: true,
                        color: AppColors.tailAdminPrimary.withValues(
                          alpha: 0.1,
                        ),
                      ),
                    ),
                    LineChartBarData(
                      spots: data
                          .asMap()
                          .entries
                          .map((e) => FlSpot(e.key.toDouble(), e.value.sales))
                          .toList(),
                      isCurved: true,
                      color: AppColors.tailAdminChartBlue,
                      barWidth: 2,
                      isStrokeCapRound: true,
                      dotData: const FlDotData(show: true),
                      belowBarData: BarAreaData(
                        show: true,
                        color: AppColors.tailAdminChartBlue.withValues(
                          alpha: 0.1,
                        ),
                      ),
                    ),
                  ],
                ),
                duration: Duration.zero,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  final String title;
  final String dateRange;
  final Color color;

  const _LegendItem({
    required this.title,
    required this.dateRange,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: color, width: 3),
          ),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(color: color, fontWeight: FontWeight.bold),
            ),
            Text(
              dateRange,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _DateToggle extends StatefulWidget {
  final String label;
  final bool isSelected;

  const _DateToggle({required this.label, required this.isSelected});

  @override
  State<_DateToggle> createState() => _DateToggleState();
}

class _DateToggleState extends State<_DateToggle> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: widget.isSelected
              ? theme.colorScheme.surfaceContainerHighest
              : _isHovered
              ? theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(4),
          border: _isHovered && !widget.isSelected
              ? Border.all(
                  color: theme.colorScheme.outline.withValues(alpha: 0.5),
                )
              : null,
        ),
        child: Text(
          widget.label,
          style: TextStyle(
            color: widget.isSelected
                ? theme.colorScheme.onSurface
                : theme.colorScheme.onSurfaceVariant,
            fontWeight: widget.isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

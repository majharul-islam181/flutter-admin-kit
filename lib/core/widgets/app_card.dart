import 'package:flutter/material.dart';
import 'package:flutter_admin_kit/core/theme/app_colors.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final String? title;
  final Widget? headerAction;
  final EdgeInsetsGeometry padding;
  final Color? backgroundColor;
  final BorderSide? borderSide;

  const AppCard({
    super.key,
    required this.child,
    this.title,
    this.headerAction,
    this.padding = const EdgeInsets.all(24.0),
    this.backgroundColor,
    this.borderSide,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleText = title;
    final action = headerAction;

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? theme.cardTheme.color,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: borderSide?.color ?? theme.cardTheme.shape?.let((s) {
                if (s is RoundedRectangleBorder && s.side != BorderSide.none) {
                  return s.side.color;
                }
                return theme.colorScheme.outline;
              }) ??
              theme.colorScheme.outline,
          width: borderSide?.width ?? 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.getCardShadow(context),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (titleText != null || action != null) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (titleText != null)
                      Text(
                        titleText,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                    ?action,
                  ],
                ),
                const SizedBox(height: 20),
              ],
              child,
            ],
          ),
        ),
      ),
    );
  }
}

extension _LetExtension<T> on T {
  R let<R>(R Function(T) block) => block(this);
}

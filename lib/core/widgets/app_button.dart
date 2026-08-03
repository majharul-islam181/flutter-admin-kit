import 'package:flutter/material.dart';

enum AppButtonVariant { elevated, outlined }

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isDisabled;
  final IconData? icon;
  final AppButtonVariant variant;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? width;
  final double height;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.icon,
    this.variant = AppButtonVariant.elevated,
    this.backgroundColor,
    this.foregroundColor,
    this.width,
    this.height = 48.0,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final buttonOnPressed = (isLoading || isDisabled) ? null : onPressed;

    Widget child = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null && !isLoading) ...[
          Icon(icon, size: 18),
          const SizedBox(width: 8),
        ],
        if (isLoading)
          SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2.5,
              valueColor: AlwaysStoppedAnimation<Color>(
                variant == AppButtonVariant.elevated
                    ? theme.colorScheme.onPrimary
                    : theme.colorScheme.primary,
              ),
            ),
          )
        else
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              letterSpacing: 0.5,
            ),
          ),
      ],
    );

    if (variant == AppButtonVariant.outlined) {
      return SizedBox(
        width: width ?? double.infinity,
        height: height,
        child: OutlinedButton(
          onPressed: buttonOnPressed,
          style: theme.outlinedButtonTheme.style?.copyWith(
            foregroundColor: foregroundColor != null
                ? WidgetStateProperty.all(foregroundColor)
                : null,
            side: foregroundColor != null
                ? WidgetStateProperty.all(BorderSide(color: foregroundColor!))
                : null,
          ),
          child: child,
        ),
      );
    }

    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: buttonOnPressed,
        style: theme.elevatedButtonTheme.style?.copyWith(
          backgroundColor: backgroundColor != null
              ? WidgetStateProperty.all(backgroundColor)
              : null,
          foregroundColor: foregroundColor != null
              ? WidgetStateProperty.all(foregroundColor)
              : null,
        ),
        child: child,
      ),
    );
  }
}

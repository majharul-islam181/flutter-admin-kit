import 'package:flutter/material.dart';

/// Centralized color palette configuration for the application.
/// Uses cohesive slate, indigo, and teal hues.
class AppColors {
  // Common Colors
  static const Color success = Color(0xFF10B981); // Emerald-500
  static const Color warning = Color(0xFFF59E0B); // Amber-500
  static const Color info = Color(0xFF3B82F6); // Blue-500

  // Light Palette Colors
  static const Color lightPrimary = Color(0xFF4F46E5); // Indigo-600
  static const Color lightOnPrimary = Colors.white;
  static const Color lightPrimaryContainer = Color(0xFFE0E7FF); // Indigo-100
  static const Color lightSecondary = Color(0xFF0D9488); // Teal-600
  static const Color lightOnSecondary = Colors.white;
  static const Color lightBackground = Color(0xFFF8FAFC); // Slate-50
  static const Color lightOnBackground = Color(0xFF0F172A); // Slate-900
  static const Color lightSurface = Colors.white;
  static const Color lightOnSurface = Color(0xFF0F172A); // Slate-900
  static const Color lightSurfaceVariant = Color(0xFFF1F5F9); // Slate-100
  static const Color lightOnSurfaceVariant = Color(0xFF475569); // Slate-600
  static const Color lightOutline = Color(0xFFE2E8F0); // Slate-200
  static const Color lightError = Color(0xFFEF4444); // Red-500
  static const Color lightOnError = Colors.white;

  // Dark Palette Colors
  static const Color darkPrimary = Color(0xFF6366F1); // Indigo-500
  static const Color darkOnPrimary = Colors.white;
  static const Color darkPrimaryContainer = Color(0xFF312E81); // Indigo-950
  static const Color darkSecondary = Color(0xFF14B8A6); // Teal-500
  static const Color darkOnSecondary = Colors.white;
  static const Color darkBackground = Color(0xFF0B0F19); // Obsidian Dark
  static const Color darkOnBackground = Color(0xFFF1F5F9); // Slate-100
  static const Color darkSurface = Color(0xFF111827); // Gray-900
  static const Color darkOnSurface = Color(0xFFF1F5F9); // Slate-100
  static const Color darkSurfaceVariant = Color(0xFF1F2937); // Gray-800
  static const Color darkOnSurfaceVariant = Color(0xFF9CA3AF); // Gray-400
  static const Color darkOutline = Color(0xFF374151); // Gray-700
  static const Color darkError = Color(0xFFF87171); // Red-400
  static const Color darkOnError = Colors.white;

  // Glassmorphic / Overlay Colors
  static Color getCardShadow(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? const Color(0x080F172A)
        : const Color(0x3F000000);
  }
}

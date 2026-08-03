import 'package:flutter/material.dart';

/// Centralized color palette configuration for the application.
/// Uses cohesive slate, indigo, and teal hues.
class AppColors {
  // Common Colors
  static const Color success = Color(0xFF10B981); // Emerald-500
  static const Color warning = Color(0xFFF59E0B); // Amber-500
  static const Color info = Color(0xFF3B82F6); // Blue-500
  
  static const Color tailAdminPrimary = Color(0xFF3C50E0); // Blue from TailAdmin
  static const Color tailAdminSidebar = Color(0xFF1C2434); // Dark slate sidebar
  static const Color tailAdminSidebarHover = Color(0xFF333A48); // Sidebar hover
  static const Color tailAdminChartBlue = Color(0xFF80CAEE); // Light blue chart fill

  // Light Palette Colors
  static const Color lightPrimary = tailAdminPrimary;
  static const Color lightOnPrimary = Colors.white;
  static const Color lightPrimaryContainer = Color(0xFFE0E7FF);
  static const Color lightSecondary = Color(0xFF80CAEE); // Chart light blue
  static const Color lightOnSecondary = Colors.white;
  static const Color lightBackground = Color(0xFFF1F5F9); // Light Gray background
  static const Color lightOnBackground = Color(0xFF1C2434); 
  static const Color lightSurface = Colors.white;
  static const Color lightOnSurface = Color(0xFF1C2434); 
  static const Color lightSurfaceVariant = Color(0xFFF1F5F9); 
  static const Color lightOnSurfaceVariant = Color(0xFF64748B); 
  static const Color lightOutline = Color(0xFFE2E8F0); 
  static const Color lightError = Color(0xFFEF4444); 
  static const Color lightOnError = Colors.white;

  // Dark Palette Colors
  static const Color darkPrimary = tailAdminPrimary; 
  static const Color darkOnPrimary = Colors.white;
  static const Color darkPrimaryContainer = Color(0xFF312E81); 
  static const Color darkSecondary = Color(0xFF80CAEE); 
  static const Color darkOnSecondary = Colors.white;
  static const Color darkBackground = tailAdminSidebar; // Dark mode background is same as sidebar
  static const Color darkOnBackground = Color(0xFFF1F5F9); 
  static const Color darkSurface = Color(0xFF24303F); // slightly lighter than sidebar for cards
  static const Color darkOnSurface = Color(0xFFF1F5F9); 
  static const Color darkSurfaceVariant = Color(0xFF313D4A); 
  static const Color darkOnSurfaceVariant = Color(0xFF8A99AF); 
  static const Color darkOutline = Color(0xFF374151); 
  static const Color darkError = Color(0xFFF87171); 
  static const Color darkOnError = Colors.white;

  // Glassmorphic / Overlay Colors
  static Color getCardShadow(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? const Color(0x080F172A)
        : const Color(0x3F000000);
  }
}

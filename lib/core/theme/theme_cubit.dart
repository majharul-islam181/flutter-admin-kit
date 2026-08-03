import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_admin_kit/core/services/local_storage_service.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ThemeCubit extends Cubit<ThemeMode> {
  final LocalStorageService _localStorageService;

  ThemeCubit(this._localStorageService) : super(ThemeMode.system) {
    _loadTheme();
  }

  void _loadTheme() {
    final cachedTheme = _localStorageService.getThemeMode();
    if (cachedTheme != null) {
      if (cachedTheme == ThemeMode.light.name) {
        emit(ThemeMode.light);
      } else if (cachedTheme == ThemeMode.dark.name) {
        emit(ThemeMode.dark);
      } else {
        emit(ThemeMode.system);
      }
    } else {
      emit(ThemeMode.system);
    }
  }

  /// Toggles between Light and Dark mode based on current context brightness.
  void toggleTheme(BuildContext context) {
    final currentBrightness = Theme.of(context).brightness;
    final newMode = currentBrightness == Brightness.dark ? ThemeMode.light : ThemeMode.dark;
    
    emit(newMode);
    _localStorageService.saveThemeMode(newMode.name);
  }

  /// Directly set a specific [ThemeMode].
  void setThemeMode(ThemeMode mode) {
    emit(mode);
    _localStorageService.saveThemeMode(mode.name);
  }
}

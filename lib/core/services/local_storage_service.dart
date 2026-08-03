import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class LocalStorageService {
  final SharedPreferences _prefs;

  LocalStorageService(this._prefs);

  static const String _keyAuthToken = 'auth_token';
  static const String _keyThemeMode = 'theme_mode';
  static const String _keyLanguageCode = 'language_code';

  /// Save authentication token.
  Future<bool> saveAuthToken(String token) async {
    return _prefs.setString(_keyAuthToken, token);
  }

  /// Get authentication token.
  String? getAuthToken() {
    return _prefs.getString(_keyAuthToken);
  }

  /// Remove authentication token.
  Future<bool> clearAuthToken() async {
    return _prefs.remove(_keyAuthToken);
  }

  /// Save theme mode preference.
  Future<bool> saveThemeMode(String mode) async {
    return _prefs.setString(_keyThemeMode, mode);
  }

  /// Get theme mode preference.
  String? getThemeMode() {
    return _prefs.getString(_keyThemeMode);
  }

  /// Save language code preference.
  Future<bool> saveLanguageCode(String languageCode) async {
    return _prefs.setString(_keyLanguageCode, languageCode);
  }

  /// Get language code preference.
  String? getLanguageCode() {
    return _prefs.getString(_keyLanguageCode);
  }

  /// Clear all stored preferences.
  Future<bool> clearAll() async {
    return _prefs.clear();
  }
}

/// A module to register SharedPreferences dependency in GetIt.
@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}

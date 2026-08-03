import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_admin_kit/core/services/local_storage_service.dart';
import 'package:injectable/injectable.dart';
import 'auth_state.dart';

@lazySingleton
class AuthCubit extends Cubit<AuthState> {
  final LocalStorageService _localStorageService;

  AuthCubit(this._localStorageService) : super(AuthInitial()) {
    checkAuth();
  }

  /// Checks if there's a cached token to determine initial authentication state.
  void checkAuth() {
    final token = _localStorageService.getAuthToken();
    if (token != null && token.isNotEmpty) {
      emit(AuthAuthenticated(token));
    } else {
      emit(AuthUnauthenticated());
    }
  }

  /// Mock login method.
  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    // Simulate API network call delay
    await Future.delayed(const Duration(milliseconds: 800));

    if (email.isNotEmpty && password.length >= 6) {
      const mockToken = 'mock_jwt_token_for_admin_dashboard';
      await _localStorageService.saveAuthToken(mockToken);
      emit(const AuthAuthenticated(mockToken));
    } else {
      emit(const AuthError('Invalid email or password. Password must be at least 6 characters.'));
      emit(AuthUnauthenticated());
    }
  }

  /// Logout method.
  Future<void> logout() async {
    emit(AuthLoading());
    await _localStorageService.clearAuthToken();
    emit(AuthUnauthenticated());
  }
}

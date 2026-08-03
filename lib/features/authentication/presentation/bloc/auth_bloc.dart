import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_admin_kit/core/services/local_storage_service.dart';
import 'package:injectable/injectable.dart';
import 'auth_event.dart';
import 'auth_state.dart';

@lazySingleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LocalStorageService _localStorageService;

  AuthBloc(this._localStorageService) : super(AuthInitial()) {
    on<AuthCheckRequested>(_onAuthCheckRequested);
    on<AuthLoginRequested>(_onAuthLoginRequested);
    on<AuthLogoutRequested>(_onAuthLogoutRequested);
    add(const AuthCheckRequested());
  }

  void _onAuthCheckRequested(
    AuthCheckRequested event,
    Emitter<AuthState> emit,
  ) {
    final token = _localStorageService.getAuthToken();
    if (token != null && token.isNotEmpty) {
      emit(AuthAuthenticated(token));
    } else {
      emit(AuthUnauthenticated());
    }
  }

  Future<void> _onAuthLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    // Simulate API network call delay.
    await Future<void>.delayed(const Duration(milliseconds: 800));

    if (event.email.isNotEmpty && event.password.length >= 6) {
      const mockToken = 'mock_jwt_token_for_admin_dashboard';
      await _localStorageService.saveAuthToken(mockToken);
      emit(const AuthAuthenticated(mockToken));
    } else {
      emit(
        const AuthError(
          'Invalid email or password. Password must be at least 6 characters.',
        ),
      );
      emit(AuthUnauthenticated());
    }
  }

  Future<void> _onAuthLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    await _localStorageService.clearAuthToken();
    emit(AuthUnauthenticated());
  }
}

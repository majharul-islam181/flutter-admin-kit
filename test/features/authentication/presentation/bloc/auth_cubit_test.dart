import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_admin_kit/core/services/local_storage_service.dart';
import 'package:flutter_admin_kit/features/authentication/presentation/bloc/auth_cubit.dart';
import 'package:flutter_admin_kit/features/authentication/presentation/bloc/auth_state.dart';

class FakeLocalStorageService implements LocalStorageService {
  String? token;
  String? theme;
  String? lang;

  @override
  String? getAuthToken() => token;

  @override
  Future<bool> saveAuthToken(String token) async {
    this.token = token;
    return true;
  }

  @override
  Future<bool> clearAuthToken() async {
    token = null;
    return true;
  }

  @override
  String? getThemeMode() => theme;

  @override
  Future<bool> saveThemeMode(String mode) async {
    theme = mode;
    return true;
  }

  @override
  String? getLanguageCode() => lang;

  @override
  Future<bool> saveLanguageCode(String code) async {
    lang = code;
    return true;
  }

  @override
  Future<bool> clearAll() async {
    token = null;
    theme = null;
    lang = null;
    return true;
  }
}

void main() {
  late FakeLocalStorageService fakeStorage;
  late AuthCubit authCubit;

  setUp(() {
    fakeStorage = FakeLocalStorageService();
    // Default constructor will call checkAuth() automatically
    authCubit = AuthCubit(fakeStorage);
  });

  tearDown(() {
    authCubit.close();
  });

  test('initial state is AuthUnauthenticated when no token is saved', () {
    expect(authCubit.state, equals(AuthUnauthenticated()));
  });

  test('initial state is AuthAuthenticated when a token is pre-saved', () {
    fakeStorage.token = 'existing_token';
    // Re-instantiate to trigger constructor checkAuth
    final cubit = AuthCubit(fakeStorage);
    expect(cubit.state, equals(const AuthAuthenticated('existing_token')));
    cubit.close();
  });

  test('login emits loading then authenticated on valid credentials', () async {
    final expectedStates = [
      AuthLoading(),
      const AuthAuthenticated('mock_jwt_token_for_admin_dashboard'),
    ];

    expectLater(authCubit.stream, emitsInOrder(expectedStates));

    await authCubit.login('admin@flutteradminkit.com', 'password123');
    expect(fakeStorage.token, equals('mock_jwt_token_for_admin_dashboard'));
  });

  test('logout clears token and emits unauthenticated', () async {
    fakeStorage.token = 'active_token';
    final cubit = AuthCubit(fakeStorage);

    final expectedStates = [
      AuthLoading(),
      AuthUnauthenticated(),
    ];

    expectLater(cubit.stream, emitsInOrder(expectedStates));

    await cubit.logout();
    expect(fakeStorage.token, isNull);
    cubit.close();
  });
}

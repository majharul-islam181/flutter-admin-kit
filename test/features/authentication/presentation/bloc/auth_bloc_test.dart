import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_admin_kit/core/services/local_storage_service.dart';
import 'package:flutter_admin_kit/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:flutter_admin_kit/features/authentication/presentation/bloc/auth_event.dart';
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
  late AuthBloc authBloc;

  setUp(() {
    fakeStorage = FakeLocalStorageService();
    authBloc = AuthBloc(fakeStorage);
  });

  tearDown(() async {
    if (!authBloc.isClosed) {
      await authBloc.close();
    }
  });

  test('resolves AuthUnauthenticated when no token is saved', () async {
    await Future<void>.delayed(Duration.zero);

    expect(authBloc.state, equals(AuthUnauthenticated()));
  });

  test('resolves AuthAuthenticated when a token is pre-saved', () async {
    await authBloc.close();
    fakeStorage.token = 'existing_token';
    final bloc = AuthBloc(fakeStorage);

    await Future<void>.delayed(Duration.zero);

    expect(bloc.state, equals(const AuthAuthenticated('existing_token')));

    await bloc.close();
  });

  test('login emits loading then authenticated on valid credentials', () async {
    final expectedStates = [
      AuthLoading(),
      const AuthAuthenticated('mock_jwt_token_for_admin_dashboard'),
    ];

    final expectation = expectLater(
      authBloc.stream,
      emitsInOrder(expectedStates),
    );

    authBloc.add(
      const AuthLoginRequested(
        email: 'admin@flutteradminkit.com',
        password: 'password123',
      ),
    );

    await expectation;
    expect(fakeStorage.token, equals('mock_jwt_token_for_admin_dashboard'));
  });

  test('logout clears token and emits unauthenticated', () async {
    await authBloc.close();
    fakeStorage.token = 'active_token';
    final bloc = AuthBloc(fakeStorage);
    await Future<void>.delayed(Duration.zero);

    expect(bloc.state, equals(const AuthAuthenticated('active_token')));

    final expectedStates = [AuthLoading(), AuthUnauthenticated()];

    final expectation = expectLater(bloc.stream, emitsInOrder(expectedStates));

    bloc.add(const AuthLogoutRequested());

    await expectation;
    expect(fakeStorage.token, isNull);
    await bloc.close();
  });
}

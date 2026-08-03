import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_admin_kit/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:flutter_admin_kit/features/authentication/presentation/bloc/auth_state.dart';
import 'package:flutter_admin_kit/features/authentication/presentation/pages/login_page.dart';
import 'package:flutter_admin_kit/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:flutter_admin_kit/features/users/presentation/pages/users_page.dart';
import 'package:flutter_admin_kit/features/products/presentation/pages/products_page.dart';
import 'package:flutter_admin_kit/features/orders/presentation/pages/orders_page.dart';
import 'package:flutter_admin_kit/features/analytics/presentation/pages/analytics_page.dart';
import 'package:flutter_admin_kit/features/settings/presentation/pages/settings_page.dart';
import 'package:flutter_admin_kit/core/widgets/admin_layout.dart';

@lazySingleton
class AppRouter {
  final AuthBloc _authBloc;
  late final GoRouter router;

  AppRouter(this._authBloc) {
    router = GoRouter(
      initialLocation: '/dashboard',
      refreshListenable: GoRouterRefreshStream(_authBloc.stream),
      redirect: (context, state) {
        final authState = _authBloc.state;
        final isLoggingIn = state.uri.toString() == '/login';

        if (authState is AuthUnauthenticated || authState is AuthInitial) {
          return '/login';
        }

        if (authState is AuthAuthenticated) {
          if (isLoggingIn) {
            return '/dashboard';
          }
        }

        return null;
      },
      routes: [
        GoRoute(
          path: '/login',
          name: 'login',
          builder: (context, state) => const LoginPage(),
        ),
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return AdminLayout(navigationShell: navigationShell);
          },
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/dashboard',
                  name: 'dashboard',
                  builder: (context, state) => const DashboardPage(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/users',
                  name: 'users',
                  builder: (context, state) => const UsersPage(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/products',
                  name: 'products',
                  builder: (context, state) => const ProductsPage(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/orders',
                  name: 'orders',
                  builder: (context, state) => const OrdersPage(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/analytics',
                  name: 'analytics',
                  builder: (context, state) => const AnalyticsPage(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/settings',
                  name: 'settings',
                  builder: (context, state) => const SettingsPage(),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

/// Helper class to bridge BLoC state streams with GoRouter's Listenable update mechanism.
class GoRouterRefreshStream extends ChangeNotifier {
  late final StreamSubscription<dynamic> _subscription;

  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_admin_kit/core/router/app_router.dart';
import 'package:flutter_admin_kit/core/theme/app_theme.dart';
import 'package:flutter_admin_kit/features/authentication/presentation/bloc/auth_cubit.dart';
import 'package:flutter_admin_kit/injection/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize service locator and async dependencies (SharedPreferences, etc.)
  await configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtain dependencies from injection
    final appRouter = getIt<AppRouter>();

    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => getIt<AuthCubit>(),
        ),
      ],
      child: MaterialApp.router(
        title: 'AdminKit - Flutter Admin Dashboard',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        routerConfig: appRouter.router,
        builder: (context, child) => ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: [
            const Breakpoint(start: 0, end: 450, name: MOBILE),
            const Breakpoint(start: 451, end: 800, name: TABLET),
            const Breakpoint(start: 801, end: 1920, name: DESKTOP),
            const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],
        ),
      ),
    );
  }
}

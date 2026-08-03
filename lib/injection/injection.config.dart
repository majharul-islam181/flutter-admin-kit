// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../core/network/dio_client.dart' as _i393;
import '../core/router/app_router.dart' as _i877;
import '../core/services/local_storage_service.dart' as _i1003;
import '../core/theme/theme_cubit.dart' as _i596;
import '../features/authentication/presentation/bloc/auth_cubit.dart' as _i970;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    final networkModule = _$NetworkModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i974.Logger>(() => networkModule.logger);
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio);
    gh.lazySingleton<_i1003.LocalStorageService>(
      () => _i1003.LocalStorageService(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i970.AuthCubit>(
      () => _i970.AuthCubit(gh<_i1003.LocalStorageService>()),
    );
    gh.lazySingleton<_i596.ThemeCubit>(
      () => _i596.ThemeCubit(gh<_i1003.LocalStorageService>()),
    );
    gh.lazySingleton<_i393.DioClient>(
      () => _i393.DioClient(
        gh<_i361.Dio>(),
        gh<_i1003.LocalStorageService>(),
        gh<_i974.Logger>(),
      ),
    );
    gh.lazySingleton<_i877.AppRouter>(
      () => _i877.AppRouter(gh<_i970.AuthCubit>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i1003.RegisterModule {}

class _$NetworkModule extends _i393.NetworkModule {}

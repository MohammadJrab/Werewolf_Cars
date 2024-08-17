// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i4;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

import '../../features/app/data/repository/prefs_repository_impl.dart' as _i10;
import '../../features/app/domin/repositories/prefs_repository.dart' as _i9;
import '../../features/app/presentation/bloc/app_manager_cubit.dart' as _i11;
import '../../features/auth/data/data_sources/auth_datasource.dart' as _i13;
import '../../features/auth/domain/use_cases/login_usecase.dart' as _i15;
import '../../features/auth/domain/use_cases/logout_usecase.dart' as _i14;
import '../../features/auth/domain/use_cases/register_usecase.dart' as _i16;
import '../../features/auth/domain/use_cases/resend_code_usecase.dart' as _i17;
import '../../features/auth/domain/use_cases/reset_password_check_usecase.dart'
    as _i18;
import '../../features/auth/domain/use_cases/reset_password_generate_usecase.dart'
    as _i19;
import '../../features/auth/domain/use_cases/reset_password_usecase.dart'
    as _i20;
import '../../features/auth/domain/use_cases/verification_usecase.dart' as _i21;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i24;
import '../../features/home/data/datasources/home_datasource.dart' as _i22;
import '../../features/home/presentation/manager/home_cubit/home_cubit.dart'
    as _i6;
import '../../features/notifications/data/datasources/notifications_datasource.dart'
    as _i23;
import '../api/client.dart' as _i12;
import '../storage/prefs_repository.dart' as _i7;
import '../storage/prefs_repository_impl.dart' as _i8;
import 'di_container.dart' as _i25;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  gh.factory<_i3.BaseOptions>(() => appModule.dioOption);
  gh.singleton<_i4.Logger>(() => appModule.logger);
  await gh.singletonAsync<_i5.SharedPreferences>(
    () => appModule.sharedPreferences,
    preResolve: true,
  );
  gh.lazySingleton<_i6.HomeCubit>(() => _i6.HomeCubit());
  gh.lazySingleton<_i3.Dio>(() => appModule.dio(
        gh<_i3.BaseOptions>(),
        gh<_i4.Logger>(),
      ));
  gh.factory<_i7.PrefsRepository>(
      () => _i8.PrefsRepositoryImpl(gh<_i5.SharedPreferences>()));
  gh.factory<_i9.PrefsRepository>(
      () => _i10.PrefsRepositoryImpl(gh<_i5.SharedPreferences>()));
  gh.singleton<_i11.AppManagerCubit>(
      () => _i11.AppManagerCubit(gh<_i9.PrefsRepository>()));
  gh.factory<_i12.ClientApi>(() => _i12.ClientApi(gh<_i3.Dio>()));
  gh.factory<_i13.AuthDatasource>(() => _i13.AuthDatasource(
        gh<_i9.PrefsRepository>(),
        clientApi: gh<_i12.ClientApi>(),
      ));
  gh.factory<_i14.LogoutUsecase>(
      () => _i14.LogoutUsecase(source: gh<_i13.AuthDatasource>()));
  gh.factory<_i15.LoginUsecase>(
      () => _i15.LoginUsecase(gh<_i13.AuthDatasource>()));
  gh.factory<_i16.RegisterUsecase>(
      () => _i16.RegisterUsecase(gh<_i13.AuthDatasource>()));
  gh.factory<_i17.ResendCodeUsecase>(
      () => _i17.ResendCodeUsecase(gh<_i13.AuthDatasource>()));
  gh.factory<_i18.ResetPasswordCheckUsecase>(
      () => _i18.ResetPasswordCheckUsecase(gh<_i13.AuthDatasource>()));
  gh.factory<_i19.ResetPasswordGenerateUsecase>(
      () => _i19.ResetPasswordGenerateUsecase(gh<_i13.AuthDatasource>()));
  gh.factory<_i20.ResetPasswordUsecase>(
      () => _i20.ResetPasswordUsecase(gh<_i13.AuthDatasource>()));
  gh.factory<_i21.VerificationUsecase>(
      () => _i21.VerificationUsecase(gh<_i13.AuthDatasource>()));
  gh.factory<_i22.HomeDatasource>(
      () => _i22.HomeDatasource(clientApi: gh<_i12.ClientApi>()));
  gh.factory<_i23.NotificationsDatasource>(
      () => _i23.NotificationsDatasource(clientApi: gh<_i12.ClientApi>()));
  gh.lazySingleton<_i24.AuthBloc>(() => _i24.AuthBloc(
        gh<_i16.RegisterUsecase>(),
        gh<_i15.LoginUsecase>(),
        gh<_i14.LogoutUsecase>(),
        gh<_i20.ResetPasswordUsecase>(),
        gh<_i19.ResetPasswordGenerateUsecase>(),
        gh<_i18.ResetPasswordCheckUsecase>(),
        gh<_i21.VerificationUsecase>(),
        gh<_i17.ResendCodeUsecase>(),
        gh<_i11.AppManagerCubit>(),
        gh<_i9.PrefsRepository>(),
      ));
  return getIt;
}

class _$AppModule extends _i25.AppModule {}

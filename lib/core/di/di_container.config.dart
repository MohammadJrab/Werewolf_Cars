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

import '../../features/app/data/repository/prefs_repository_impl.dart' as _i9;
import '../../features/app/domin/repositories/prefs_repository.dart' as _i8;
import '../../features/app/presentation/bloc/app_manager_cubit.dart' as _i10;
import '../../features/auth/data/data_sources/auth_datasource.dart' as _i12;
import '../../features/auth/domain/use_cases/login_usecase.dart' as _i14;
import '../../features/auth/domain/use_cases/logout_usecase.dart' as _i13;
import '../../features/auth/domain/use_cases/register_usecase.dart' as _i15;
import '../../features/auth/domain/use_cases/resend_code_usecase.dart' as _i16;
import '../../features/auth/domain/use_cases/reset_password_check_usecase.dart'
    as _i17;
import '../../features/auth/domain/use_cases/reset_password_generate_usecase.dart'
    as _i18;
import '../../features/auth/domain/use_cases/reset_password_usecase.dart'
    as _i19;
import '../../features/auth/domain/use_cases/verification_usecase.dart' as _i20;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i23;
import '../../features/home/data/datasources/home_datasource.dart' as _i21;
import '../../features/notifications/data/datasources/notifications_datasource.dart'
    as _i22;
import '../api/client.dart' as _i11;
import '../storage/prefs_repository.dart' as _i6;
import '../storage/prefs_repository_impl.dart' as _i7;
import 'di_container.dart' as _i24;

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
  gh.lazySingleton<_i3.Dio>(() => appModule.dio(
        gh<_i3.BaseOptions>(),
        gh<_i4.Logger>(),
      ));
  gh.factory<_i6.PrefsRepository>(
      () => _i7.PrefsRepositoryImpl(gh<_i5.SharedPreferences>()));
  gh.factory<_i8.PrefsRepository>(
      () => _i9.PrefsRepositoryImpl(gh<_i5.SharedPreferences>()));
  gh.singleton<_i10.AppManagerCubit>(
      () => _i10.AppManagerCubit(gh<_i8.PrefsRepository>()));
  gh.factory<_i11.ClientApi>(() => _i11.ClientApi(gh<_i3.Dio>()));
  gh.factory<_i12.AuthDatasource>(() => _i12.AuthDatasource(
        gh<_i8.PrefsRepository>(),
        clientApi: gh<_i11.ClientApi>(),
      ));
  gh.factory<_i13.LogoutUsecase>(
      () => _i13.LogoutUsecase(source: gh<_i12.AuthDatasource>()));
  gh.factory<_i14.LoginUsecase>(
      () => _i14.LoginUsecase(gh<_i12.AuthDatasource>()));
  gh.factory<_i15.RegisterUsecase>(
      () => _i15.RegisterUsecase(gh<_i12.AuthDatasource>()));
  gh.factory<_i16.ResendCodeUsecase>(
      () => _i16.ResendCodeUsecase(gh<_i12.AuthDatasource>()));
  gh.factory<_i17.ResetPasswordCheckUsecase>(
      () => _i17.ResetPasswordCheckUsecase(gh<_i12.AuthDatasource>()));
  gh.factory<_i18.ResetPasswordGenerateUsecase>(
      () => _i18.ResetPasswordGenerateUsecase(gh<_i12.AuthDatasource>()));
  gh.factory<_i19.ResetPasswordUsecase>(
      () => _i19.ResetPasswordUsecase(gh<_i12.AuthDatasource>()));
  gh.factory<_i20.VerificationUsecase>(
      () => _i20.VerificationUsecase(gh<_i12.AuthDatasource>()));
  gh.factory<_i21.HomeDatasource>(
      () => _i21.HomeDatasource(clientApi: gh<_i11.ClientApi>()));
  gh.factory<_i22.NotificationsDatasource>(
      () => _i22.NotificationsDatasource(clientApi: gh<_i11.ClientApi>()));
  gh.lazySingleton<_i23.AuthBloc>(() => _i23.AuthBloc(
        gh<_i15.RegisterUsecase>(),
        gh<_i14.LoginUsecase>(),
        gh<_i13.LogoutUsecase>(),
        gh<_i19.ResetPasswordUsecase>(),
        gh<_i18.ResetPasswordGenerateUsecase>(),
        gh<_i17.ResetPasswordCheckUsecase>(),
        gh<_i20.VerificationUsecase>(),
        gh<_i16.ResendCodeUsecase>(),
        gh<_i10.AppManagerCubit>(),
        gh<_i8.PrefsRepository>(),
      ));
  return getIt;
}

class _$AppModule extends _i24.AppModule {}

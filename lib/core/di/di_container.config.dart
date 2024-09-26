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

import '../../features/app/data/repository/prefs_repository_impl.dart' as _i13;
import '../../features/app/domin/repositories/prefs_repository.dart' as _i12;
import '../../features/app/presentation/bloc/app_manager_cubit.dart' as _i23;
import '../../features/auth/data/data_sources/auth_datasource.dart' as _i14;
import '../../features/auth/domain/use_cases/login_usecase.dart' as _i16;
import '../../features/auth/domain/use_cases/logout_usecase.dart' as _i15;
import '../../features/auth/domain/use_cases/register_usecase.dart' as _i17;
import '../../features/auth/domain/use_cases/resend_code_usecase.dart' as _i18;
import '../../features/auth/domain/use_cases/reset_password_check_usecase.dart'
    as _i19;
import '../../features/auth/domain/use_cases/reset_password_generate_usecase.dart'
    as _i20;
import '../../features/auth/domain/use_cases/reset_password_usecase.dart'
    as _i21;
import '../../features/auth/domain/use_cases/verification_usecase.dart' as _i22;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i26;
import '../../features/chat/presentation/manager/chat_bloc.dart' as _i6;
import '../../features/home/data/datasources/home_datasource.dart' as _i24;
import '../../features/home/presentation/manager/home_cubit/home_cubit.dart'
    as _i7;
import '../../features/notifications/data/datasources/notifications_datasource.dart'
    as _i25;
import '../../features/search_and_filteration/presentation/manager/search_cubit/search_cubit.dart'
    as _i8;
import '../api/client.dart' as _i11;
import '../storage/prefs_repository.dart' as _i9;
import '../storage/prefs_repository_impl.dart' as _i10;
import 'di_container.dart' as _i27;

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
  gh.lazySingleton<_i6.ChatBloc>(() => _i6.ChatBloc());
  gh.lazySingleton<_i7.HomeCubit>(() => _i7.HomeCubit());
  gh.lazySingleton<_i8.SearchCubit>(() => _i8.SearchCubit());
  gh.lazySingleton<_i3.Dio>(() => appModule.dio(
        gh<_i3.BaseOptions>(),
        gh<_i4.Logger>(),
      ));
  gh.factory<_i9.PrefsRepository>(
      () => _i10.PrefsRepositoryImpl(gh<_i5.SharedPreferences>()));
  gh.factory<_i11.ClientApi>(() => _i11.ClientApi(gh<_i3.Dio>()));
  gh.factory<_i12.PrefsRepository>(
      () => _i13.PrefsRepositoryImpl(gh<_i5.SharedPreferences>()));
  gh.factory<_i14.AuthDatasource>(() => _i14.AuthDatasource(
        gh<_i12.PrefsRepository>(),
        clientApi: gh<_i11.ClientApi>(),
      ));
  gh.factory<_i15.LogoutUsecase>(
      () => _i15.LogoutUsecase(source: gh<_i14.AuthDatasource>()));
  gh.factory<_i16.LoginUsecase>(
      () => _i16.LoginUsecase(gh<_i14.AuthDatasource>()));
  gh.factory<_i17.RegisterUsecase>(
      () => _i17.RegisterUsecase(gh<_i14.AuthDatasource>()));
  gh.factory<_i18.ResendCodeUsecase>(
      () => _i18.ResendCodeUsecase(gh<_i14.AuthDatasource>()));
  gh.factory<_i19.ResetPasswordCheckUsecase>(
      () => _i19.ResetPasswordCheckUsecase(gh<_i14.AuthDatasource>()));
  gh.factory<_i20.ResetPasswordGenerateUsecase>(
      () => _i20.ResetPasswordGenerateUsecase(gh<_i14.AuthDatasource>()));
  gh.factory<_i21.ResetPasswordUsecase>(
      () => _i21.ResetPasswordUsecase(gh<_i14.AuthDatasource>()));
  gh.factory<_i22.VerificationUsecase>(
      () => _i22.VerificationUsecase(gh<_i14.AuthDatasource>()));
  gh.singleton<_i23.AppManagerCubit>(
      () => _i23.AppManagerCubit(gh<_i12.PrefsRepository>()));
  gh.factory<_i24.HomeDatasource>(
      () => _i24.HomeDatasource(clientApi: gh<_i11.ClientApi>()));
  gh.factory<_i25.NotificationsDatasource>(
      () => _i25.NotificationsDatasource(clientApi: gh<_i11.ClientApi>()));
  gh.lazySingleton<_i26.AuthBloc>(() => _i26.AuthBloc(
        gh<_i17.RegisterUsecase>(),
        gh<_i16.LoginUsecase>(),
        gh<_i15.LogoutUsecase>(),
        gh<_i21.ResetPasswordUsecase>(),
        gh<_i20.ResetPasswordGenerateUsecase>(),
        gh<_i19.ResetPasswordCheckUsecase>(),
        gh<_i22.VerificationUsecase>(),
        gh<_i18.ResendCodeUsecase>(),
        gh<_i23.AppManagerCubit>(),
        gh<_i12.PrefsRepository>(),
      ));
  return getIt;
}

class _$AppModule extends _i27.AppModule {}

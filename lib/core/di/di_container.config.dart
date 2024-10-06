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

import '../../features/app/data/repository/prefs_repository_impl.dart' as _i15;
import '../../features/app/domin/repositories/prefs_repository.dart' as _i14;
import '../../features/app/presentation/bloc/app_manager_cubit.dart' as _i25;
import '../../features/auth/data/data_sources/auth_datasource.dart' as _i16;
import '../../features/auth/domain/use_cases/login_usecase.dart' as _i18;
import '../../features/auth/domain/use_cases/logout_usecase.dart' as _i17;
import '../../features/auth/domain/use_cases/register_usecase.dart' as _i19;
import '../../features/auth/domain/use_cases/resend_code_usecase.dart' as _i20;
import '../../features/auth/domain/use_cases/reset_password_check_usecase.dart'
    as _i21;
import '../../features/auth/domain/use_cases/reset_password_generate_usecase.dart'
    as _i22;
import '../../features/auth/domain/use_cases/reset_password_usecase.dart'
    as _i23;
import '../../features/auth/domain/use_cases/verification_usecase.dart' as _i24;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i28;
import '../../features/chat/presentation/manager/chat_bloc.dart' as _i6;
import '../../features/home/data/datasources/home_datasource.dart' as _i26;
import '../../features/home/presentation/manager/home_cubit/home_cubit.dart'
    as _i7;
import '../../features/my_car/presentation/manager/my_cars_bloc.dart' as _i9;
import '../../features/notifications/data/datasources/notifications_datasource.dart'
    as _i27;
import '../../features/search_and_filteration/presentation/manager/search_cubit/search_cubit.dart'
    as _i10;
import '../../services/search_and_filters_service.dart' as _i8;
import '../api/client.dart' as _i13;
import '../storage/prefs_repository.dart' as _i11;
import '../storage/prefs_repository_impl.dart' as _i12;
import 'di_container.dart' as _i29;

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
  gh.lazySingleton<_i8.SearchFilterService>(() => _i8.SearchFilterService());
  gh.lazySingleton<_i9.MyCarsBloc>(() => _i9.MyCarsBloc());
  gh.lazySingleton<_i10.SearchCubit>(
      () => _i10.SearchCubit(gh<_i8.SearchFilterService>()));
  gh.lazySingleton<_i3.Dio>(() => appModule.dio(
        gh<_i3.BaseOptions>(),
        gh<_i4.Logger>(),
      ));
  gh.factory<_i11.PrefsRepository>(
      () => _i12.PrefsRepositoryImpl(gh<_i5.SharedPreferences>()));
  gh.factory<_i13.ClientApi>(() => _i13.ClientApi(gh<_i3.Dio>()));
  gh.factory<_i14.PrefsRepository>(
      () => _i15.PrefsRepositoryImpl(gh<_i5.SharedPreferences>()));
  gh.factory<_i16.AuthDatasource>(() => _i16.AuthDatasource(
        gh<_i14.PrefsRepository>(),
        clientApi: gh<_i13.ClientApi>(),
      ));
  gh.factory<_i17.LogoutUsecase>(
      () => _i17.LogoutUsecase(source: gh<_i16.AuthDatasource>()));
  gh.factory<_i18.LoginUsecase>(
      () => _i18.LoginUsecase(gh<_i16.AuthDatasource>()));
  gh.factory<_i19.RegisterUsecase>(
      () => _i19.RegisterUsecase(gh<_i16.AuthDatasource>()));
  gh.factory<_i20.ResendCodeUsecase>(
      () => _i20.ResendCodeUsecase(gh<_i16.AuthDatasource>()));
  gh.factory<_i21.ResetPasswordCheckUsecase>(
      () => _i21.ResetPasswordCheckUsecase(gh<_i16.AuthDatasource>()));
  gh.factory<_i22.ResetPasswordGenerateUsecase>(
      () => _i22.ResetPasswordGenerateUsecase(gh<_i16.AuthDatasource>()));
  gh.factory<_i23.ResetPasswordUsecase>(
      () => _i23.ResetPasswordUsecase(gh<_i16.AuthDatasource>()));
  gh.factory<_i24.VerificationUsecase>(
      () => _i24.VerificationUsecase(gh<_i16.AuthDatasource>()));
  gh.singleton<_i25.AppManagerCubit>(
      () => _i25.AppManagerCubit(gh<_i14.PrefsRepository>()));
  gh.factory<_i26.HomeDatasource>(
      () => _i26.HomeDatasource(clientApi: gh<_i13.ClientApi>()));
  gh.factory<_i27.NotificationsDatasource>(
      () => _i27.NotificationsDatasource(clientApi: gh<_i13.ClientApi>()));
  gh.lazySingleton<_i28.AuthBloc>(() => _i28.AuthBloc(
        gh<_i19.RegisterUsecase>(),
        gh<_i18.LoginUsecase>(),
        gh<_i17.LogoutUsecase>(),
        gh<_i23.ResetPasswordUsecase>(),
        gh<_i22.ResetPasswordGenerateUsecase>(),
        gh<_i21.ResetPasswordCheckUsecase>(),
        gh<_i24.VerificationUsecase>(),
        gh<_i20.ResendCodeUsecase>(),
        gh<_i25.AppManagerCubit>(),
        gh<_i14.PrefsRepository>(),
      ));
  return getIt;
}

class _$AppModule extends _i29.AppModule {}

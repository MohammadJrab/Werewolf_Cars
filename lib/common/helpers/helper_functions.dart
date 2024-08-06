import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:werewolf_cars/features/app/domin/repositories/prefs_repository.dart';
import 'package:werewolf_cars/features/app/presentation/bloc/app_manager_cubit.dart';
import '../../services/firebase_service.dart';
import '../constants/constants.dart';

class HelperFunctions {
  HelperFunctions._singleton();

  static HelperFunctions? _instance;

  factory HelperFunctions() {
    return instance;
  }

  Future<void> logout() async {
    await refresh();
    await FirebaseService.deleteFcmToken();
    GetIt.I<AppManagerCubit>().checkUser();
    await GetIt.I<PrefsRepository>().clearLocal();
    return;
  }

  Future<void> refresh() async {
    await GetIt.I.resetLazySingleton<Dio>();
    // await GetIt.I.resetLazySingleton<CarsCubit>();
    // await GetIt.I.resetLazySingleton<HomeCubit>();
    // await GetIt.I.resetLazySingleton<ProfileBloc>();
    // await GetIt.I.resetLazySingleton<NotificationsBloc>();
    // await GetIt.I.resetLazySingleton<SettingsCubit>();
  }

  static HelperFunctions get instance =>
      _instance ??= HelperFunctions._singleton();

  bool hasReachedMax<T>(List<T>? list) => (list ?? []).length < kPerPage;
}

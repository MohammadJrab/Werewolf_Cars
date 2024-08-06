import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:werewolf_cars/features/auth/data/models/customer_info.dart';

import '../../../../core/config/theme/app_theme.dart';
import '../../../../core/utils/nullable.dart';
import '../../domin/repositories/prefs_repository.dart';

part 'app_manager_state.dart';

@singleton
class AppManagerCubit extends Cubit<AppManagerState> {
  AppManagerCubit(this._prefsRepository)
      : super(AppManagerState(
            lightThemeData: ThemeData.light(),
            darkThemeData: ThemeData.dark()));

  final PrefsRepository _prefsRepository;

  changeAppTheme(BuildContext context) {
    emit(state.copyWith(
      darkThemeData: AppTheme.dark(context),
      lightThemeData: AppTheme.light(context),
    ));
  }

  bool get isRegisteredCustomer => _prefsRepository.registeredCustomer;
  void checkUser() {
    final user = _prefsRepository.customer;

    emit(state.copyWith(user: Nullable.value(user)));
  }
}

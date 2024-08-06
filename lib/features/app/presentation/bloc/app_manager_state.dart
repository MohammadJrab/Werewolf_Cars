part of 'app_manager_cubit.dart';

@immutable
class AppManagerState {
  const AppManagerState({
    required this.lightThemeData,
    required this.darkThemeData,
    this.user,
  });
  final ThemeData lightThemeData;
  final ThemeData darkThemeData;
  final CustomerInfo? user;

  AppManagerState copyWith({
    ThemeData? lightThemeData,
    ThemeData? darkThemeData,
    Nullable<CustomerInfo?>? user,
  }) {
    return AppManagerState(
      lightThemeData: lightThemeData ?? this.lightThemeData,
      darkThemeData: darkThemeData ?? this.darkThemeData,
      user: user != null ? user.value : this.user,
    );
  }
}

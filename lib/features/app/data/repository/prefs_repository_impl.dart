import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:werewolf_cars/features/auth/data/models/customer_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/constants/prefs_key.dart';
import '../../domin/repositories/prefs_repository.dart';

@Injectable(as: PrefsRepository)
class PrefsRepositoryImpl extends PrefsRepository {
  PrefsRepositoryImpl(this._preferences);

  final SharedPreferences _preferences;

  @override
  Future<bool> setToken(String token) =>
      _preferences.setString(PrefsKey.token, token);

  @override
  String? get token => _preferences.getString(PrefsKey.token);

  @override
  Future<bool> setTheme(ThemeMode themeMode) =>
      _preferences.setString(PrefsKey.theme, themeMode.name);

  @override
  Future<bool> clearLocal() async {
    return (await Future.wait([
      _preferences.remove(PrefsKey.token),
      _preferences.remove(PrefsKey.user),
      _preferences.clear(),
    ]))
        .reduce((value, element) => value && element);
  }

  @override
  bool get registeredCustomer => token != null;

  @override
  Future<bool> setCustomer(CustomerInfoResponse customer) async {
    await setToken(customer.token!);
    return _preferences.setString(
        PrefsKey.user, jsonEncode(customer.customer.toJson()));
  }

  @override
  Future<bool> setCustomerWithoutToken(CustomerInfoResponse customer) async {
    return _preferences.setString(
        PrefsKey.user, jsonEncode(customer.customer.toJson()));
  }

  @override
  CustomerInfo? get customer {
    final currentUser = _preferences.getString(PrefsKey.user);
    if (currentUser == null) {
      return null;
    }

    return CustomerInfo.fromJson(jsonDecode(currentUser));
  }

  @override
  ThemeMode get getTheme => throw UnimplementedError();
}

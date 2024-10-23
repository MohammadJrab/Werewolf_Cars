import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:werewolf_cars/features/auth/data/models/local_user.dart';

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

  // @override
  // Future<bool> setTheme(ThemeMode themeMode) =>
  //     _preferences.setString(PrefsKey.theme, themeMode.name);

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
  bool get registeredUser => token != null;

  @override
  Future<bool> setUser(User user) async {
    final idToken = await user.getIdToken();
    await setToken(idToken!);
    final userData = {
      'uid': user.uid,
      'email': user.email,
      'displayName': user.displayName,
      'emailVerified': user.emailVerified,
      'photoURL': user.photoURL,
    };
    return _preferences.setString(PrefsKey.user, jsonEncode(userData));
  }

  @override
  LocalUser? get user {
    final currentUser = _preferences.getString(PrefsKey.user);
    if (currentUser == null) {
      return null;
    }

    final userData = jsonDecode(currentUser);
    return LocalUser.fromJson(userData);
  }

  @override
  ThemeMode get getTheme => throw UnimplementedError();
}

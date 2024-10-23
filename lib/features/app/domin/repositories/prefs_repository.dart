import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:werewolf_cars/features/auth/data/models/local_user.dart';

abstract class PrefsRepository {
  String? get token;
  Future<bool> setToken(String token);
  ThemeMode get getTheme;
  Future<bool> clearLocal();
  bool get registeredUser;
  LocalUser? get user;
  Future<bool> setUser(User user);
}

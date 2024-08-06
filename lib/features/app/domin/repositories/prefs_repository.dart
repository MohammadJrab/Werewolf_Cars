import 'package:flutter/material.dart';
import 'package:werewolf_cars/features/auth/data/models/customer_info.dart';

abstract class PrefsRepository {
  String? get token;
  Future<bool> setToken(String token);
  ThemeMode get getTheme;
  Future<bool> clearLocal();
  bool get registeredCustomer;
  CustomerInfo? get customer;
  Future<bool> setCustomer(CustomerInfoResponse customer);
  Future<bool> setCustomerWithoutToken(CustomerInfoResponse customer);
}

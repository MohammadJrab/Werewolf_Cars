import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'authorization_response.freezed.dart';
part 'authorization_response.g.dart';

AuthorizationResponse authorizationResponseFromJson(String str) =>
    AuthorizationResponse.fromJson(json.decode(str));

Future<String> authorizationResponseToJson(AuthorizationResponse data) async {
  return json.encode(data.toJson());
}

@freezed
class AuthorizationResponse with _$AuthorizationResponse {
  const factory AuthorizationResponse({
    @JsonKey(name: "signature") required String signature,
    @JsonKey(name: "expires") required String expires,
    @JsonKey(name: "customer_id") required int customerId,
  }) = _AuthorizationResponse;

  factory AuthorizationResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthorizationResponseFromJson(json);
}

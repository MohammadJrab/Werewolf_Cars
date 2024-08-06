import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import '../../../../core/utils/extensions/datetime.dart';

part 'customer_info.freezed.dart';

part 'customer_info.g.dart';

CustomerInfoResponse customerInfoResponseFromJson(String str) => CustomerInfoResponse.fromJson(json.decode(str));

String customerInfoResponseToJson(CustomerInfoResponse data) => json.encode(data.toJson());

@freezed
class CustomerInfoResponse with _$CustomerInfoResponse {
  const factory CustomerInfoResponse({
    @JsonKey(name: "customer") required CustomerInfo customer,
    @JsonKey(name: "token") required String? token,
  }) = _CustomerInfoResponse;

  factory CustomerInfoResponse.fromJson(Map<String, dynamic> json) => _$CustomerInfoResponseFromJson(json);
}

@freezed
class CustomerInfo with _$CustomerInfo {
  const factory CustomerInfo({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "email") required String? email,
    @JsonKey(
      name: "email_verified_at",
      fromJson: dateFromJsonNullable,
      includeToJson: false,
    )
    required DateTime? emailVerifiedAt,
    @JsonKey(name: "phone") required String phone,
    @JsonKey(name: "avatar") required Avatar? avatar,
    @JsonKey(name: "phone_verified_at") required DateTime? phoneVerifiedAt,
    @JsonKey(
      name: "created_at",
      fromJson: dateFromJsonNullable,
      includeToJson: false,
    )
    required DateTime? createdAt,
  }) = _CustomerInfo;

  const CustomerInfo._();

  factory CustomerInfo.fromJson(Map<String, dynamic> json) => _$CustomerInfoFromJson(json);
}

@freezed
class Avatar with _$Avatar {
  const factory Avatar({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "url") required String? url,
    @JsonKey(name: "collection_name") required String collectionName,
  }) = _Avatar;

  factory Avatar.fromJson(Map<String, dynamic> json) => _$AvatarFromJson(json);
}

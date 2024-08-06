// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerInfoResponseImpl _$$CustomerInfoResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerInfoResponseImpl(
      customer: CustomerInfo.fromJson(json['customer'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$$CustomerInfoResponseImplToJson(
        _$CustomerInfoResponseImpl instance) =>
    <String, dynamic>{
      'customer': instance.customer,
      'token': instance.token,
    };

_$CustomerInfoImpl _$$CustomerInfoImplFromJson(Map<String, dynamic> json) =>
    _$CustomerInfoImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String?,
      emailVerifiedAt: dateFromJsonNullable(json['email_verified_at']),
      phone: json['phone'] as String,
      avatar: json['avatar'] == null
          ? null
          : Avatar.fromJson(json['avatar'] as Map<String, dynamic>),
      phoneVerifiedAt: json['phone_verified_at'] == null
          ? null
          : DateTime.parse(json['phone_verified_at'] as String),
      createdAt: dateFromJsonNullable(json['created_at']),
    );

Map<String, dynamic> _$$CustomerInfoImplToJson(_$CustomerInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'avatar': instance.avatar,
      'phone_verified_at': instance.phoneVerifiedAt?.toIso8601String(),
    };

_$AvatarImpl _$$AvatarImplFromJson(Map<String, dynamic> json) => _$AvatarImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      url: json['url'] as String?,
      collectionName: json['collection_name'] as String,
    );

Map<String, dynamic> _$$AvatarImplToJson(_$AvatarImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'collection_name': instance.collectionName,
    };

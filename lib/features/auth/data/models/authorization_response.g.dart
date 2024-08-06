// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorization_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthorizationResponseImpl _$$AuthorizationResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthorizationResponseImpl(
      signature: json['signature'] as String,
      expires: json['expires'] as String,
      customerId: (json['customer_id'] as num).toInt(),
    );

Map<String, dynamic> _$$AuthorizationResponseImplToJson(
        _$AuthorizationResponseImpl instance) =>
    <String, dynamic>{
      'signature': instance.signature,
      'expires': instance.expires,
      'customer_id': instance.customerId,
    };

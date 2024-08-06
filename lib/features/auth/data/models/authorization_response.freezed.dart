// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authorization_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthorizationResponse _$AuthorizationResponseFromJson(
    Map<String, dynamic> json) {
  return _AuthorizationResponse.fromJson(json);
}

/// @nodoc
mixin _$AuthorizationResponse {
  @JsonKey(name: "signature")
  String get signature => throw _privateConstructorUsedError;
  @JsonKey(name: "expires")
  String get expires => throw _privateConstructorUsedError;
  @JsonKey(name: "customer_id")
  int get customerId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthorizationResponseCopyWith<AuthorizationResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorizationResponseCopyWith<$Res> {
  factory $AuthorizationResponseCopyWith(AuthorizationResponse value,
          $Res Function(AuthorizationResponse) then) =
      _$AuthorizationResponseCopyWithImpl<$Res, AuthorizationResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "signature") String signature,
      @JsonKey(name: "expires") String expires,
      @JsonKey(name: "customer_id") int customerId});
}

/// @nodoc
class _$AuthorizationResponseCopyWithImpl<$Res,
        $Val extends AuthorizationResponse>
    implements $AuthorizationResponseCopyWith<$Res> {
  _$AuthorizationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signature = null,
    Object? expires = null,
    Object? customerId = null,
  }) {
    return _then(_value.copyWith(
      signature: null == signature
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String,
      expires: null == expires
          ? _value.expires
          : expires // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthorizationResponseImplCopyWith<$Res>
    implements $AuthorizationResponseCopyWith<$Res> {
  factory _$$AuthorizationResponseImplCopyWith(
          _$AuthorizationResponseImpl value,
          $Res Function(_$AuthorizationResponseImpl) then) =
      __$$AuthorizationResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "signature") String signature,
      @JsonKey(name: "expires") String expires,
      @JsonKey(name: "customer_id") int customerId});
}

/// @nodoc
class __$$AuthorizationResponseImplCopyWithImpl<$Res>
    extends _$AuthorizationResponseCopyWithImpl<$Res,
        _$AuthorizationResponseImpl>
    implements _$$AuthorizationResponseImplCopyWith<$Res> {
  __$$AuthorizationResponseImplCopyWithImpl(_$AuthorizationResponseImpl _value,
      $Res Function(_$AuthorizationResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signature = null,
    Object? expires = null,
    Object? customerId = null,
  }) {
    return _then(_$AuthorizationResponseImpl(
      signature: null == signature
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String,
      expires: null == expires
          ? _value.expires
          : expires // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthorizationResponseImpl implements _AuthorizationResponse {
  const _$AuthorizationResponseImpl(
      {@JsonKey(name: "signature") required this.signature,
      @JsonKey(name: "expires") required this.expires,
      @JsonKey(name: "customer_id") required this.customerId});

  factory _$AuthorizationResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthorizationResponseImplFromJson(json);

  @override
  @JsonKey(name: "signature")
  final String signature;
  @override
  @JsonKey(name: "expires")
  final String expires;
  @override
  @JsonKey(name: "customer_id")
  final int customerId;

  @override
  String toString() {
    return 'AuthorizationResponse(signature: $signature, expires: $expires, customerId: $customerId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthorizationResponseImpl &&
            (identical(other.signature, signature) ||
                other.signature == signature) &&
            (identical(other.expires, expires) || other.expires == expires) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, signature, expires, customerId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthorizationResponseImplCopyWith<_$AuthorizationResponseImpl>
      get copyWith => __$$AuthorizationResponseImplCopyWithImpl<
          _$AuthorizationResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthorizationResponseImplToJson(
      this,
    );
  }
}

abstract class _AuthorizationResponse implements AuthorizationResponse {
  const factory _AuthorizationResponse(
          {@JsonKey(name: "signature") required final String signature,
          @JsonKey(name: "expires") required final String expires,
          @JsonKey(name: "customer_id") required final int customerId}) =
      _$AuthorizationResponseImpl;

  factory _AuthorizationResponse.fromJson(Map<String, dynamic> json) =
      _$AuthorizationResponseImpl.fromJson;

  @override
  @JsonKey(name: "signature")
  String get signature;
  @override
  @JsonKey(name: "expires")
  String get expires;
  @override
  @JsonKey(name: "customer_id")
  int get customerId;
  @override
  @JsonKey(ignore: true)
  _$$AuthorizationResponseImplCopyWith<_$AuthorizationResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

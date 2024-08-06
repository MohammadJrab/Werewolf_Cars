// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomerInfoResponse _$CustomerInfoResponseFromJson(Map<String, dynamic> json) {
  return _CustomerInfoResponse.fromJson(json);
}

/// @nodoc
mixin _$CustomerInfoResponse {
  @JsonKey(name: "customer")
  CustomerInfo get customer => throw _privateConstructorUsedError;
  @JsonKey(name: "token")
  String? get token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerInfoResponseCopyWith<CustomerInfoResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerInfoResponseCopyWith<$Res> {
  factory $CustomerInfoResponseCopyWith(CustomerInfoResponse value,
          $Res Function(CustomerInfoResponse) then) =
      _$CustomerInfoResponseCopyWithImpl<$Res, CustomerInfoResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "customer") CustomerInfo customer,
      @JsonKey(name: "token") String? token});

  $CustomerInfoCopyWith<$Res> get customer;
}

/// @nodoc
class _$CustomerInfoResponseCopyWithImpl<$Res,
        $Val extends CustomerInfoResponse>
    implements $CustomerInfoResponseCopyWith<$Res> {
  _$CustomerInfoResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customer = null,
    Object? token = freezed,
  }) {
    return _then(_value.copyWith(
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as CustomerInfo,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerInfoCopyWith<$Res> get customer {
    return $CustomerInfoCopyWith<$Res>(_value.customer, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CustomerInfoResponseImplCopyWith<$Res>
    implements $CustomerInfoResponseCopyWith<$Res> {
  factory _$$CustomerInfoResponseImplCopyWith(_$CustomerInfoResponseImpl value,
          $Res Function(_$CustomerInfoResponseImpl) then) =
      __$$CustomerInfoResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "customer") CustomerInfo customer,
      @JsonKey(name: "token") String? token});

  @override
  $CustomerInfoCopyWith<$Res> get customer;
}

/// @nodoc
class __$$CustomerInfoResponseImplCopyWithImpl<$Res>
    extends _$CustomerInfoResponseCopyWithImpl<$Res, _$CustomerInfoResponseImpl>
    implements _$$CustomerInfoResponseImplCopyWith<$Res> {
  __$$CustomerInfoResponseImplCopyWithImpl(_$CustomerInfoResponseImpl _value,
      $Res Function(_$CustomerInfoResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customer = null,
    Object? token = freezed,
  }) {
    return _then(_$CustomerInfoResponseImpl(
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as CustomerInfo,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerInfoResponseImpl implements _CustomerInfoResponse {
  const _$CustomerInfoResponseImpl(
      {@JsonKey(name: "customer") required this.customer,
      @JsonKey(name: "token") required this.token});

  factory _$CustomerInfoResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerInfoResponseImplFromJson(json);

  @override
  @JsonKey(name: "customer")
  final CustomerInfo customer;
  @override
  @JsonKey(name: "token")
  final String? token;

  @override
  String toString() {
    return 'CustomerInfoResponse(customer: $customer, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerInfoResponseImpl &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, customer, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerInfoResponseImplCopyWith<_$CustomerInfoResponseImpl>
      get copyWith =>
          __$$CustomerInfoResponseImplCopyWithImpl<_$CustomerInfoResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerInfoResponseImplToJson(
      this,
    );
  }
}

abstract class _CustomerInfoResponse implements CustomerInfoResponse {
  const factory _CustomerInfoResponse(
          {@JsonKey(name: "customer") required final CustomerInfo customer,
          @JsonKey(name: "token") required final String? token}) =
      _$CustomerInfoResponseImpl;

  factory _CustomerInfoResponse.fromJson(Map<String, dynamic> json) =
      _$CustomerInfoResponseImpl.fromJson;

  @override
  @JsonKey(name: "customer")
  CustomerInfo get customer;
  @override
  @JsonKey(name: "token")
  String? get token;
  @override
  @JsonKey(ignore: true)
  _$$CustomerInfoResponseImplCopyWith<_$CustomerInfoResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CustomerInfo _$CustomerInfoFromJson(Map<String, dynamic> json) {
  return _CustomerInfo.fromJson(json);
}

/// @nodoc
mixin _$CustomerInfo {
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(
      name: "email_verified_at",
      fromJson: dateFromJsonNullable,
      includeToJson: false)
  DateTime? get emailVerifiedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "phone")
  String get phone => throw _privateConstructorUsedError;
  @JsonKey(name: "avatar")
  Avatar? get avatar => throw _privateConstructorUsedError;
  @JsonKey(name: "phone_verified_at")
  DateTime? get phoneVerifiedAt => throw _privateConstructorUsedError;
  @JsonKey(
      name: "created_at", fromJson: dateFromJsonNullable, includeToJson: false)
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerInfoCopyWith<CustomerInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerInfoCopyWith<$Res> {
  factory $CustomerInfoCopyWith(
          CustomerInfo value, $Res Function(CustomerInfo) then) =
      _$CustomerInfoCopyWithImpl<$Res, CustomerInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "email") String? email,
      @JsonKey(
          name: "email_verified_at",
          fromJson: dateFromJsonNullable,
          includeToJson: false)
      DateTime? emailVerifiedAt,
      @JsonKey(name: "phone") String phone,
      @JsonKey(name: "avatar") Avatar? avatar,
      @JsonKey(name: "phone_verified_at") DateTime? phoneVerifiedAt,
      @JsonKey(
          name: "created_at",
          fromJson: dateFromJsonNullable,
          includeToJson: false)
      DateTime? createdAt});

  $AvatarCopyWith<$Res>? get avatar;
}

/// @nodoc
class _$CustomerInfoCopyWithImpl<$Res, $Val extends CustomerInfo>
    implements $CustomerInfoCopyWith<$Res> {
  _$CustomerInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = freezed,
    Object? emailVerifiedAt = freezed,
    Object? phone = null,
    Object? avatar = freezed,
    Object? phoneVerifiedAt = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as Avatar?,
      phoneVerifiedAt: freezed == phoneVerifiedAt
          ? _value.phoneVerifiedAt
          : phoneVerifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AvatarCopyWith<$Res>? get avatar {
    if (_value.avatar == null) {
      return null;
    }

    return $AvatarCopyWith<$Res>(_value.avatar!, (value) {
      return _then(_value.copyWith(avatar: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CustomerInfoImplCopyWith<$Res>
    implements $CustomerInfoCopyWith<$Res> {
  factory _$$CustomerInfoImplCopyWith(
          _$CustomerInfoImpl value, $Res Function(_$CustomerInfoImpl) then) =
      __$$CustomerInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "email") String? email,
      @JsonKey(
          name: "email_verified_at",
          fromJson: dateFromJsonNullable,
          includeToJson: false)
      DateTime? emailVerifiedAt,
      @JsonKey(name: "phone") String phone,
      @JsonKey(name: "avatar") Avatar? avatar,
      @JsonKey(name: "phone_verified_at") DateTime? phoneVerifiedAt,
      @JsonKey(
          name: "created_at",
          fromJson: dateFromJsonNullable,
          includeToJson: false)
      DateTime? createdAt});

  @override
  $AvatarCopyWith<$Res>? get avatar;
}

/// @nodoc
class __$$CustomerInfoImplCopyWithImpl<$Res>
    extends _$CustomerInfoCopyWithImpl<$Res, _$CustomerInfoImpl>
    implements _$$CustomerInfoImplCopyWith<$Res> {
  __$$CustomerInfoImplCopyWithImpl(
      _$CustomerInfoImpl _value, $Res Function(_$CustomerInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = freezed,
    Object? emailVerifiedAt = freezed,
    Object? phone = null,
    Object? avatar = freezed,
    Object? phoneVerifiedAt = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$CustomerInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as Avatar?,
      phoneVerifiedAt: freezed == phoneVerifiedAt
          ? _value.phoneVerifiedAt
          : phoneVerifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerInfoImpl extends _CustomerInfo {
  const _$CustomerInfoImpl(
      {@JsonKey(name: "id") required this.id,
      @JsonKey(name: "name") required this.name,
      @JsonKey(name: "email") required this.email,
      @JsonKey(
          name: "email_verified_at",
          fromJson: dateFromJsonNullable,
          includeToJson: false)
      required this.emailVerifiedAt,
      @JsonKey(name: "phone") required this.phone,
      @JsonKey(name: "avatar") required this.avatar,
      @JsonKey(name: "phone_verified_at") required this.phoneVerifiedAt,
      @JsonKey(
          name: "created_at",
          fromJson: dateFromJsonNullable,
          includeToJson: false)
      required this.createdAt})
      : super._();

  factory _$CustomerInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerInfoImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int id;
  @override
  @JsonKey(name: "name")
  final String name;
  @override
  @JsonKey(name: "email")
  final String? email;
  @override
  @JsonKey(
      name: "email_verified_at",
      fromJson: dateFromJsonNullable,
      includeToJson: false)
  final DateTime? emailVerifiedAt;
  @override
  @JsonKey(name: "phone")
  final String phone;
  @override
  @JsonKey(name: "avatar")
  final Avatar? avatar;
  @override
  @JsonKey(name: "phone_verified_at")
  final DateTime? phoneVerifiedAt;
  @override
  @JsonKey(
      name: "created_at", fromJson: dateFromJsonNullable, includeToJson: false)
  final DateTime? createdAt;

  @override
  String toString() {
    return 'CustomerInfo(id: $id, name: $name, email: $email, emailVerifiedAt: $emailVerifiedAt, phone: $phone, avatar: $avatar, phoneVerifiedAt: $phoneVerifiedAt, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.emailVerifiedAt, emailVerifiedAt) ||
                other.emailVerifiedAt == emailVerifiedAt) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.phoneVerifiedAt, phoneVerifiedAt) ||
                other.phoneVerifiedAt == phoneVerifiedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, email, emailVerifiedAt,
      phone, avatar, phoneVerifiedAt, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerInfoImplCopyWith<_$CustomerInfoImpl> get copyWith =>
      __$$CustomerInfoImplCopyWithImpl<_$CustomerInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerInfoImplToJson(
      this,
    );
  }
}

abstract class _CustomerInfo extends CustomerInfo {
  const factory _CustomerInfo(
      {@JsonKey(name: "id") required final int id,
      @JsonKey(name: "name") required final String name,
      @JsonKey(name: "email") required final String? email,
      @JsonKey(
          name: "email_verified_at",
          fromJson: dateFromJsonNullable,
          includeToJson: false)
      required final DateTime? emailVerifiedAt,
      @JsonKey(name: "phone") required final String phone,
      @JsonKey(name: "avatar") required final Avatar? avatar,
      @JsonKey(name: "phone_verified_at")
      required final DateTime? phoneVerifiedAt,
      @JsonKey(
          name: "created_at",
          fromJson: dateFromJsonNullable,
          includeToJson: false)
      required final DateTime? createdAt}) = _$CustomerInfoImpl;
  const _CustomerInfo._() : super._();

  factory _CustomerInfo.fromJson(Map<String, dynamic> json) =
      _$CustomerInfoImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int get id;
  @override
  @JsonKey(name: "name")
  String get name;
  @override
  @JsonKey(name: "email")
  String? get email;
  @override
  @JsonKey(
      name: "email_verified_at",
      fromJson: dateFromJsonNullable,
      includeToJson: false)
  DateTime? get emailVerifiedAt;
  @override
  @JsonKey(name: "phone")
  String get phone;
  @override
  @JsonKey(name: "avatar")
  Avatar? get avatar;
  @override
  @JsonKey(name: "phone_verified_at")
  DateTime? get phoneVerifiedAt;
  @override
  @JsonKey(
      name: "created_at", fromJson: dateFromJsonNullable, includeToJson: false)
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$CustomerInfoImplCopyWith<_$CustomerInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Avatar _$AvatarFromJson(Map<String, dynamic> json) {
  return _Avatar.fromJson(json);
}

/// @nodoc
mixin _$Avatar {
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "url")
  String? get url => throw _privateConstructorUsedError;
  @JsonKey(name: "collection_name")
  String get collectionName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AvatarCopyWith<Avatar> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvatarCopyWith<$Res> {
  factory $AvatarCopyWith(Avatar value, $Res Function(Avatar) then) =
      _$AvatarCopyWithImpl<$Res, Avatar>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "url") String? url,
      @JsonKey(name: "collection_name") String collectionName});
}

/// @nodoc
class _$AvatarCopyWithImpl<$Res, $Val extends Avatar>
    implements $AvatarCopyWith<$Res> {
  _$AvatarCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? url = freezed,
    Object? collectionName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      collectionName: null == collectionName
          ? _value.collectionName
          : collectionName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AvatarImplCopyWith<$Res> implements $AvatarCopyWith<$Res> {
  factory _$$AvatarImplCopyWith(
          _$AvatarImpl value, $Res Function(_$AvatarImpl) then) =
      __$$AvatarImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "name") String name,
      @JsonKey(name: "url") String? url,
      @JsonKey(name: "collection_name") String collectionName});
}

/// @nodoc
class __$$AvatarImplCopyWithImpl<$Res>
    extends _$AvatarCopyWithImpl<$Res, _$AvatarImpl>
    implements _$$AvatarImplCopyWith<$Res> {
  __$$AvatarImplCopyWithImpl(
      _$AvatarImpl _value, $Res Function(_$AvatarImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? url = freezed,
    Object? collectionName = null,
  }) {
    return _then(_$AvatarImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      collectionName: null == collectionName
          ? _value.collectionName
          : collectionName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AvatarImpl implements _Avatar {
  const _$AvatarImpl(
      {@JsonKey(name: "id") required this.id,
      @JsonKey(name: "name") required this.name,
      @JsonKey(name: "url") required this.url,
      @JsonKey(name: "collection_name") required this.collectionName});

  factory _$AvatarImpl.fromJson(Map<String, dynamic> json) =>
      _$$AvatarImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int id;
  @override
  @JsonKey(name: "name")
  final String name;
  @override
  @JsonKey(name: "url")
  final String? url;
  @override
  @JsonKey(name: "collection_name")
  final String collectionName;

  @override
  String toString() {
    return 'Avatar(id: $id, name: $name, url: $url, collectionName: $collectionName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AvatarImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.collectionName, collectionName) ||
                other.collectionName == collectionName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, url, collectionName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AvatarImplCopyWith<_$AvatarImpl> get copyWith =>
      __$$AvatarImplCopyWithImpl<_$AvatarImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AvatarImplToJson(
      this,
    );
  }
}

abstract class _Avatar implements Avatar {
  const factory _Avatar(
      {@JsonKey(name: "id") required final int id,
      @JsonKey(name: "name") required final String name,
      @JsonKey(name: "url") required final String? url,
      @JsonKey(name: "collection_name")
      required final String collectionName}) = _$AvatarImpl;

  factory _Avatar.fromJson(Map<String, dynamic> json) = _$AvatarImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int get id;
  @override
  @JsonKey(name: "name")
  String get name;
  @override
  @JsonKey(name: "url")
  String? get url;
  @override
  @JsonKey(name: "collection_name")
  String get collectionName;
  @override
  @JsonKey(ignore: true)
  _$$AvatarImplCopyWith<_$AvatarImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'business_register_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BusinessRegisterRequest {
  String get firstName;
  String get lastName;
  String get email;
  String get password;
  String get userName;
  double get latitude;
  double get longitude;
  String get closingTime; // "HH:mm" formatında string
  String get companyName;
  String get companyType;

  /// Create a copy of BusinessRegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BusinessRegisterRequestCopyWith<BusinessRegisterRequest> get copyWith =>
      _$BusinessRegisterRequestCopyWithImpl<BusinessRegisterRequest>(
          this as BusinessRegisterRequest, _$identity);

  /// Serializes this BusinessRegisterRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BusinessRegisterRequest &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.closingTime, closingTime) ||
                other.closingTime == closingTime) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.companyType, companyType) ||
                other.companyType == companyType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      firstName,
      lastName,
      email,
      password,
      userName,
      latitude,
      longitude,
      closingTime,
      companyName,
      companyType);

  @override
  String toString() {
    return 'BusinessRegisterRequest(firstName: $firstName, lastName: $lastName, email: $email, password: $password, userName: $userName, latitude: $latitude, longitude: $longitude, closingTime: $closingTime, companyName: $companyName, companyType: $companyType)';
  }
}

/// @nodoc
abstract mixin class $BusinessRegisterRequestCopyWith<$Res> {
  factory $BusinessRegisterRequestCopyWith(BusinessRegisterRequest value,
          $Res Function(BusinessRegisterRequest) _then) =
      _$BusinessRegisterRequestCopyWithImpl;
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String email,
      String password,
      String userName,
      double latitude,
      double longitude,
      String closingTime,
      String companyName,
      String companyType});
}

/// @nodoc
class _$BusinessRegisterRequestCopyWithImpl<$Res>
    implements $BusinessRegisterRequestCopyWith<$Res> {
  _$BusinessRegisterRequestCopyWithImpl(this._self, this._then);

  final BusinessRegisterRequest _self;
  final $Res Function(BusinessRegisterRequest) _then;

  /// Create a copy of BusinessRegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? password = null,
    Object? userName = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? closingTime = null,
    Object? companyName = null,
    Object? companyType = null,
  }) {
    return _then(_self.copyWith(
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      closingTime: null == closingTime
          ? _self.closingTime
          : closingTime // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _self.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      companyType: null == companyType
          ? _self.companyType
          : companyType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _BusinessRegisterRequest implements BusinessRegisterRequest {
  const _BusinessRegisterRequest(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      required this.userName,
      required this.latitude,
      required this.longitude,
      required this.closingTime,
      required this.companyName,
      required this.companyType});
  factory _BusinessRegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$BusinessRegisterRequestFromJson(json);

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String email;
  @override
  final String password;
  @override
  final String userName;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final String closingTime;
// "HH:mm" formatında string
  @override
  final String companyName;
  @override
  final String companyType;

  /// Create a copy of BusinessRegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BusinessRegisterRequestCopyWith<_BusinessRegisterRequest> get copyWith =>
      __$BusinessRegisterRequestCopyWithImpl<_BusinessRegisterRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BusinessRegisterRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BusinessRegisterRequest &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.closingTime, closingTime) ||
                other.closingTime == closingTime) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.companyType, companyType) ||
                other.companyType == companyType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      firstName,
      lastName,
      email,
      password,
      userName,
      latitude,
      longitude,
      closingTime,
      companyName,
      companyType);

  @override
  String toString() {
    return 'BusinessRegisterRequest(firstName: $firstName, lastName: $lastName, email: $email, password: $password, userName: $userName, latitude: $latitude, longitude: $longitude, closingTime: $closingTime, companyName: $companyName, companyType: $companyType)';
  }
}

/// @nodoc
abstract mixin class _$BusinessRegisterRequestCopyWith<$Res>
    implements $BusinessRegisterRequestCopyWith<$Res> {
  factory _$BusinessRegisterRequestCopyWith(_BusinessRegisterRequest value,
          $Res Function(_BusinessRegisterRequest) _then) =
      __$BusinessRegisterRequestCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String email,
      String password,
      String userName,
      double latitude,
      double longitude,
      String closingTime,
      String companyName,
      String companyType});
}

/// @nodoc
class __$BusinessRegisterRequestCopyWithImpl<$Res>
    implements _$BusinessRegisterRequestCopyWith<$Res> {
  __$BusinessRegisterRequestCopyWithImpl(this._self, this._then);

  final _BusinessRegisterRequest _self;
  final $Res Function(_BusinessRegisterRequest) _then;

  /// Create a copy of BusinessRegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? password = null,
    Object? userName = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? closingTime = null,
    Object? companyName = null,
    Object? companyType = null,
  }) {
    return _then(_BusinessRegisterRequest(
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      closingTime: null == closingTime
          ? _self.closingTime
          : closingTime // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _self.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      companyType: null == companyType
          ? _self.companyType
          : companyType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on

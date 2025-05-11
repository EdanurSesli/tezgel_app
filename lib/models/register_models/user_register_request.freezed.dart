// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_register_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserRegisterRequest {
  String? get firstName;
  String? get lastName;
  String? get email;
  String? get password;
  String? get userName;
  String? get address;
  String? get longtitude;
  String? get latitude;
  DateTime? get birthDate;

  /// Create a copy of UserRegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserRegisterRequestCopyWith<UserRegisterRequest> get copyWith =>
      _$UserRegisterRequestCopyWithImpl<UserRegisterRequest>(
          this as UserRegisterRequest, _$identity);

  /// Serializes this UserRegisterRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserRegisterRequest &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.longtitude, longtitude) ||
                other.longtitude == longtitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, firstName, lastName, email,
      password, userName, address, longtitude, latitude, birthDate);

  @override
  String toString() {
    return 'UserRegisterRequest(firstName: $firstName, lastName: $lastName, email: $email, password: $password, userName: $userName, address: $address, longtitude: $longtitude, latitude: $latitude, birthDate: $birthDate)';
  }
}

/// @nodoc
abstract mixin class $UserRegisterRequestCopyWith<$Res> {
  factory $UserRegisterRequestCopyWith(
          UserRegisterRequest value, $Res Function(UserRegisterRequest) _then) =
      _$UserRegisterRequestCopyWithImpl;
  @useResult
  $Res call(
      {String? firstName,
      String? lastName,
      String? email,
      String? password,
      String? userName,
      String? address,
      String? longtitude,
      String? latitude,
      DateTime? birthDate});
}

/// @nodoc
class _$UserRegisterRequestCopyWithImpl<$Res>
    implements $UserRegisterRequestCopyWith<$Res> {
  _$UserRegisterRequestCopyWithImpl(this._self, this._then);

  final UserRegisterRequest _self;
  final $Res Function(UserRegisterRequest) _then;

  /// Create a copy of UserRegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? userName = freezed,
    Object? address = freezed,
    Object? longtitude = freezed,
    Object? latitude = freezed,
    Object? birthDate = freezed,
  }) {
    return _then(_self.copyWith(
      firstName: freezed == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      longtitude: freezed == longtitude
          ? _self.longtitude
          : longtitude // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDate: freezed == birthDate
          ? _self.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UserRegisterRequest implements UserRegisterRequest {
  const _UserRegisterRequest(
      {this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.userName,
      this.address,
      this.longtitude,
      this.latitude,
      this.birthDate});
  factory _UserRegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$UserRegisterRequestFromJson(json);

  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? email;
  @override
  final String? password;
  @override
  final String? userName;
  @override
  final String? address;
  @override
  final String? longtitude;
  @override
  final String? latitude;
  @override
  final DateTime? birthDate;

  /// Create a copy of UserRegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserRegisterRequestCopyWith<_UserRegisterRequest> get copyWith =>
      __$UserRegisterRequestCopyWithImpl<_UserRegisterRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserRegisterRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserRegisterRequest &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.longtitude, longtitude) ||
                other.longtitude == longtitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, firstName, lastName, email,
      password, userName, address, longtitude, latitude, birthDate);

  @override
  String toString() {
    return 'UserRegisterRequest(firstName: $firstName, lastName: $lastName, email: $email, password: $password, userName: $userName, address: $address, longtitude: $longtitude, latitude: $latitude, birthDate: $birthDate)';
  }
}

/// @nodoc
abstract mixin class _$UserRegisterRequestCopyWith<$Res>
    implements $UserRegisterRequestCopyWith<$Res> {
  factory _$UserRegisterRequestCopyWith(_UserRegisterRequest value,
          $Res Function(_UserRegisterRequest) _then) =
      __$UserRegisterRequestCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? firstName,
      String? lastName,
      String? email,
      String? password,
      String? userName,
      String? address,
      String? longtitude,
      String? latitude,
      DateTime? birthDate});
}

/// @nodoc
class __$UserRegisterRequestCopyWithImpl<$Res>
    implements _$UserRegisterRequestCopyWith<$Res> {
  __$UserRegisterRequestCopyWithImpl(this._self, this._then);

  final _UserRegisterRequest _self;
  final $Res Function(_UserRegisterRequest) _then;

  /// Create a copy of UserRegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? userName = freezed,
    Object? address = freezed,
    Object? longtitude = freezed,
    Object? latitude = freezed,
    Object? birthDate = freezed,
  }) {
    return _then(_UserRegisterRequest(
      firstName: freezed == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      longtitude: freezed == longtitude
          ? _self.longtitude
          : longtitude // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      birthDate: freezed == birthDate
          ? _self.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on

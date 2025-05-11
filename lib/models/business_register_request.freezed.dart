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
  String? get firstName;
  String? get lastName;
  String? get email;
  String? get password;
  String? get userName;
  ClosingTime? get closingTime;
  String? get companyName;
  String? get companyType;

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
            (identical(other.closingTime, closingTime) ||
                other.closingTime == closingTime) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.companyType, companyType) ||
                other.companyType == companyType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, firstName, lastName, email,
      password, userName, closingTime, companyName, companyType);

  @override
  String toString() {
    return 'BusinessRegisterRequest(firstName: $firstName, lastName: $lastName, email: $email, password: $password, userName: $userName, closingTime: $closingTime, companyName: $companyName, companyType: $companyType)';
  }
}

/// @nodoc
abstract mixin class $BusinessRegisterRequestCopyWith<$Res> {
  factory $BusinessRegisterRequestCopyWith(BusinessRegisterRequest value,
          $Res Function(BusinessRegisterRequest) _then) =
      _$BusinessRegisterRequestCopyWithImpl;
  @useResult
  $Res call(
      {String? firstName,
      String? lastName,
      String? email,
      String? password,
      String? userName,
      ClosingTime? closingTime,
      String? companyName,
      String? companyType});

  $ClosingTimeCopyWith<$Res>? get closingTime;
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
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? userName = freezed,
    Object? closingTime = freezed,
    Object? companyName = freezed,
    Object? companyType = freezed,
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
      closingTime: freezed == closingTime
          ? _self.closingTime
          : closingTime // ignore: cast_nullable_to_non_nullable
              as ClosingTime?,
      companyName: freezed == companyName
          ? _self.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      companyType: freezed == companyType
          ? _self.companyType
          : companyType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of BusinessRegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClosingTimeCopyWith<$Res>? get closingTime {
    if (_self.closingTime == null) {
      return null;
    }

    return $ClosingTimeCopyWith<$Res>(_self.closingTime!, (value) {
      return _then(_self.copyWith(closingTime: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _BusinessRegisterRequest implements BusinessRegisterRequest {
  const _BusinessRegisterRequest(
      {this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.userName,
      this.closingTime,
      this.companyName,
      this.companyType});
  factory _BusinessRegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$BusinessRegisterRequestFromJson(json);

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
  final ClosingTime? closingTime;
  @override
  final String? companyName;
  @override
  final String? companyType;

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
            (identical(other.closingTime, closingTime) ||
                other.closingTime == closingTime) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.companyType, companyType) ||
                other.companyType == companyType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, firstName, lastName, email,
      password, userName, closingTime, companyName, companyType);

  @override
  String toString() {
    return 'BusinessRegisterRequest(firstName: $firstName, lastName: $lastName, email: $email, password: $password, userName: $userName, closingTime: $closingTime, companyName: $companyName, companyType: $companyType)';
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
      {String? firstName,
      String? lastName,
      String? email,
      String? password,
      String? userName,
      ClosingTime? closingTime,
      String? companyName,
      String? companyType});

  @override
  $ClosingTimeCopyWith<$Res>? get closingTime;
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
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? userName = freezed,
    Object? closingTime = freezed,
    Object? companyName = freezed,
    Object? companyType = freezed,
  }) {
    return _then(_BusinessRegisterRequest(
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
      closingTime: freezed == closingTime
          ? _self.closingTime
          : closingTime // ignore: cast_nullable_to_non_nullable
              as ClosingTime?,
      companyName: freezed == companyName
          ? _self.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      companyType: freezed == companyType
          ? _self.companyType
          : companyType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of BusinessRegisterRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClosingTimeCopyWith<$Res>? get closingTime {
    if (_self.closingTime == null) {
      return null;
    }

    return $ClosingTimeCopyWith<$Res>(_self.closingTime!, (value) {
      return _then(_self.copyWith(closingTime: value));
    });
  }
}

/// @nodoc
mixin _$ClosingTime {
  int? get ticks;

  /// Create a copy of ClosingTime
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ClosingTimeCopyWith<ClosingTime> get copyWith =>
      _$ClosingTimeCopyWithImpl<ClosingTime>(this as ClosingTime, _$identity);

  /// Serializes this ClosingTime to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ClosingTime &&
            (identical(other.ticks, ticks) || other.ticks == ticks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, ticks);

  @override
  String toString() {
    return 'ClosingTime(ticks: $ticks)';
  }
}

/// @nodoc
abstract mixin class $ClosingTimeCopyWith<$Res> {
  factory $ClosingTimeCopyWith(
          ClosingTime value, $Res Function(ClosingTime) _then) =
      _$ClosingTimeCopyWithImpl;
  @useResult
  $Res call({int? ticks});
}

/// @nodoc
class _$ClosingTimeCopyWithImpl<$Res> implements $ClosingTimeCopyWith<$Res> {
  _$ClosingTimeCopyWithImpl(this._self, this._then);

  final ClosingTime _self;
  final $Res Function(ClosingTime) _then;

  /// Create a copy of ClosingTime
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ticks = freezed,
  }) {
    return _then(_self.copyWith(
      ticks: freezed == ticks
          ? _self.ticks
          : ticks // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ClosingTime implements ClosingTime {
  const _ClosingTime({this.ticks});
  factory _ClosingTime.fromJson(Map<String, dynamic> json) =>
      _$ClosingTimeFromJson(json);

  @override
  final int? ticks;

  /// Create a copy of ClosingTime
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ClosingTimeCopyWith<_ClosingTime> get copyWith =>
      __$ClosingTimeCopyWithImpl<_ClosingTime>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ClosingTimeToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ClosingTime &&
            (identical(other.ticks, ticks) || other.ticks == ticks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, ticks);

  @override
  String toString() {
    return 'ClosingTime(ticks: $ticks)';
  }
}

/// @nodoc
abstract mixin class _$ClosingTimeCopyWith<$Res>
    implements $ClosingTimeCopyWith<$Res> {
  factory _$ClosingTimeCopyWith(
          _ClosingTime value, $Res Function(_ClosingTime) _then) =
      __$ClosingTimeCopyWithImpl;
  @override
  @useResult
  $Res call({int? ticks});
}

/// @nodoc
class __$ClosingTimeCopyWithImpl<$Res> implements _$ClosingTimeCopyWith<$Res> {
  __$ClosingTimeCopyWithImpl(this._self, this._then);

  final _ClosingTime _self;
  final $Res Function(_ClosingTime) _then;

  /// Create a copy of ClosingTime
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? ticks = freezed,
  }) {
    return _then(_ClosingTime(
      ticks: freezed == ticks
          ? _self.ticks
          : ticks // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on

// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'business_profile_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BusinessProfileResponse {
  String? get message;
  BusinessData? get data;
  int? get statusCode;
  bool? get isSuccess;
  bool? get hasExceptionError;
  List<String>? get validationErrors;

  /// Create a copy of BusinessProfileResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BusinessProfileResponseCopyWith<BusinessProfileResponse> get copyWith =>
      _$BusinessProfileResponseCopyWithImpl<BusinessProfileResponse>(
          this as BusinessProfileResponse, _$identity);

  /// Serializes this BusinessProfileResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BusinessProfileResponse &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.hasExceptionError, hasExceptionError) ||
                other.hasExceptionError == hasExceptionError) &&
            const DeepCollectionEquality()
                .equals(other.validationErrors, validationErrors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      message,
      data,
      statusCode,
      isSuccess,
      hasExceptionError,
      const DeepCollectionEquality().hash(validationErrors));

  @override
  String toString() {
    return 'BusinessProfileResponse(message: $message, data: $data, statusCode: $statusCode, isSuccess: $isSuccess, hasExceptionError: $hasExceptionError, validationErrors: $validationErrors)';
  }
}

/// @nodoc
abstract mixin class $BusinessProfileResponseCopyWith<$Res> {
  factory $BusinessProfileResponseCopyWith(BusinessProfileResponse value,
          $Res Function(BusinessProfileResponse) _then) =
      _$BusinessProfileResponseCopyWithImpl;
  @useResult
  $Res call(
      {String? message,
      BusinessData? data,
      int? statusCode,
      bool? isSuccess,
      bool? hasExceptionError,
      List<String>? validationErrors});

  $BusinessDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$BusinessProfileResponseCopyWithImpl<$Res>
    implements $BusinessProfileResponseCopyWith<$Res> {
  _$BusinessProfileResponseCopyWithImpl(this._self, this._then);

  final BusinessProfileResponse _self;
  final $Res Function(BusinessProfileResponse) _then;

  /// Create a copy of BusinessProfileResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? data = freezed,
    Object? statusCode = freezed,
    Object? isSuccess = freezed,
    Object? hasExceptionError = freezed,
    Object? validationErrors = freezed,
  }) {
    return _then(_self.copyWith(
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as BusinessData?,
      statusCode: freezed == statusCode
          ? _self.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      isSuccess: freezed == isSuccess
          ? _self.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasExceptionError: freezed == hasExceptionError
          ? _self.hasExceptionError
          : hasExceptionError // ignore: cast_nullable_to_non_nullable
              as bool?,
      validationErrors: freezed == validationErrors
          ? _self.validationErrors
          : validationErrors // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }

  /// Create a copy of BusinessProfileResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessDataCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $BusinessDataCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _BusinessProfileResponse implements BusinessProfileResponse {
  const _BusinessProfileResponse(
      {this.message,
      this.data,
      this.statusCode,
      this.isSuccess,
      this.hasExceptionError,
      final List<String>? validationErrors})
      : _validationErrors = validationErrors;
  factory _BusinessProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$BusinessProfileResponseFromJson(json);

  @override
  final String? message;
  @override
  final BusinessData? data;
  @override
  final int? statusCode;
  @override
  final bool? isSuccess;
  @override
  final bool? hasExceptionError;
  final List<String>? _validationErrors;
  @override
  List<String>? get validationErrors {
    final value = _validationErrors;
    if (value == null) return null;
    if (_validationErrors is EqualUnmodifiableListView)
      return _validationErrors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of BusinessProfileResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BusinessProfileResponseCopyWith<_BusinessProfileResponse> get copyWith =>
      __$BusinessProfileResponseCopyWithImpl<_BusinessProfileResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BusinessProfileResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BusinessProfileResponse &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.hasExceptionError, hasExceptionError) ||
                other.hasExceptionError == hasExceptionError) &&
            const DeepCollectionEquality()
                .equals(other._validationErrors, _validationErrors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      message,
      data,
      statusCode,
      isSuccess,
      hasExceptionError,
      const DeepCollectionEquality().hash(_validationErrors));

  @override
  String toString() {
    return 'BusinessProfileResponse(message: $message, data: $data, statusCode: $statusCode, isSuccess: $isSuccess, hasExceptionError: $hasExceptionError, validationErrors: $validationErrors)';
  }
}

/// @nodoc
abstract mixin class _$BusinessProfileResponseCopyWith<$Res>
    implements $BusinessProfileResponseCopyWith<$Res> {
  factory _$BusinessProfileResponseCopyWith(_BusinessProfileResponse value,
          $Res Function(_BusinessProfileResponse) _then) =
      __$BusinessProfileResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? message,
      BusinessData? data,
      int? statusCode,
      bool? isSuccess,
      bool? hasExceptionError,
      List<String>? validationErrors});

  @override
  $BusinessDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$BusinessProfileResponseCopyWithImpl<$Res>
    implements _$BusinessProfileResponseCopyWith<$Res> {
  __$BusinessProfileResponseCopyWithImpl(this._self, this._then);

  final _BusinessProfileResponse _self;
  final $Res Function(_BusinessProfileResponse) _then;

  /// Create a copy of BusinessProfileResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = freezed,
    Object? data = freezed,
    Object? statusCode = freezed,
    Object? isSuccess = freezed,
    Object? hasExceptionError = freezed,
    Object? validationErrors = freezed,
  }) {
    return _then(_BusinessProfileResponse(
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as BusinessData?,
      statusCode: freezed == statusCode
          ? _self.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int?,
      isSuccess: freezed == isSuccess
          ? _self.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasExceptionError: freezed == hasExceptionError
          ? _self.hasExceptionError
          : hasExceptionError // ignore: cast_nullable_to_non_nullable
              as bool?,
      validationErrors: freezed == validationErrors
          ? _self._validationErrors
          : validationErrors // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }

  /// Create a copy of BusinessProfileResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BusinessDataCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $BusinessDataCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// @nodoc
mixin _$BusinessData {
  String? get firstName;
  String? get lastName;
  String? get email;
  String? get companyName;
  String? get companyType;
  String? get closingTime;

  /// Create a copy of BusinessData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BusinessDataCopyWith<BusinessData> get copyWith =>
      _$BusinessDataCopyWithImpl<BusinessData>(
          this as BusinessData, _$identity);

  /// Serializes this BusinessData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BusinessData &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.companyType, companyType) ||
                other.companyType == companyType) &&
            (identical(other.closingTime, closingTime) ||
                other.closingTime == closingTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, firstName, lastName, email,
      companyName, companyType, closingTime);

  @override
  String toString() {
    return 'BusinessData(firstName: $firstName, lastName: $lastName, email: $email, companyName: $companyName, companyType: $companyType, closingTime: $closingTime)';
  }
}

/// @nodoc
abstract mixin class $BusinessDataCopyWith<$Res> {
  factory $BusinessDataCopyWith(
          BusinessData value, $Res Function(BusinessData) _then) =
      _$BusinessDataCopyWithImpl;
  @useResult
  $Res call(
      {String? firstName,
      String? lastName,
      String? email,
      String? companyName,
      String? companyType,
      String? closingTime});
}

/// @nodoc
class _$BusinessDataCopyWithImpl<$Res> implements $BusinessDataCopyWith<$Res> {
  _$BusinessDataCopyWithImpl(this._self, this._then);

  final BusinessData _self;
  final $Res Function(BusinessData) _then;

  /// Create a copy of BusinessData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? companyName = freezed,
    Object? companyType = freezed,
    Object? closingTime = freezed,
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
      companyName: freezed == companyName
          ? _self.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      companyType: freezed == companyType
          ? _self.companyType
          : companyType // ignore: cast_nullable_to_non_nullable
              as String?,
      closingTime: freezed == closingTime
          ? _self.closingTime
          : closingTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _BusinessData implements BusinessData {
  const _BusinessData(
      {this.firstName,
      this.lastName,
      this.email,
      this.companyName,
      this.companyType,
      this.closingTime});
  factory _BusinessData.fromJson(Map<String, dynamic> json) =>
      _$BusinessDataFromJson(json);

  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? email;
  @override
  final String? companyName;
  @override
  final String? companyType;
  @override
  final String? closingTime;

  /// Create a copy of BusinessData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BusinessDataCopyWith<_BusinessData> get copyWith =>
      __$BusinessDataCopyWithImpl<_BusinessData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BusinessDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BusinessData &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.companyType, companyType) ||
                other.companyType == companyType) &&
            (identical(other.closingTime, closingTime) ||
                other.closingTime == closingTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, firstName, lastName, email,
      companyName, companyType, closingTime);

  @override
  String toString() {
    return 'BusinessData(firstName: $firstName, lastName: $lastName, email: $email, companyName: $companyName, companyType: $companyType, closingTime: $closingTime)';
  }
}

/// @nodoc
abstract mixin class _$BusinessDataCopyWith<$Res>
    implements $BusinessDataCopyWith<$Res> {
  factory _$BusinessDataCopyWith(
          _BusinessData value, $Res Function(_BusinessData) _then) =
      __$BusinessDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? firstName,
      String? lastName,
      String? email,
      String? companyName,
      String? companyType,
      String? closingTime});
}

/// @nodoc
class __$BusinessDataCopyWithImpl<$Res>
    implements _$BusinessDataCopyWith<$Res> {
  __$BusinessDataCopyWithImpl(this._self, this._then);

  final _BusinessData _self;
  final $Res Function(_BusinessData) _then;

  /// Create a copy of BusinessData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? companyName = freezed,
    Object? companyType = freezed,
    Object? closingTime = freezed,
  }) {
    return _then(_BusinessData(
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
      companyName: freezed == companyName
          ? _self.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      companyType: freezed == companyType
          ? _self.companyType
          : companyType // ignore: cast_nullable_to_non_nullable
              as String?,
      closingTime: freezed == closingTime
          ? _self.closingTime
          : closingTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on

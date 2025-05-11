// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_register_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserRegisterResponse {
  String? get message;
  String? get data;
  int? get statusCode;
  bool? get isSuccess;
  bool? get hasExceptionError;
  String? get validationErrors;

  /// Create a copy of UserRegisterResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserRegisterResponseCopyWith<UserRegisterResponse> get copyWith =>
      _$UserRegisterResponseCopyWithImpl<UserRegisterResponse>(
          this as UserRegisterResponse, _$identity);

  /// Serializes this UserRegisterResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserRegisterResponse &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.hasExceptionError, hasExceptionError) ||
                other.hasExceptionError == hasExceptionError) &&
            (identical(other.validationErrors, validationErrors) ||
                other.validationErrors == validationErrors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, data, statusCode,
      isSuccess, hasExceptionError, validationErrors);

  @override
  String toString() {
    return 'UserRegisterResponse(message: $message, data: $data, statusCode: $statusCode, isSuccess: $isSuccess, hasExceptionError: $hasExceptionError, validationErrors: $validationErrors)';
  }
}

/// @nodoc
abstract mixin class $UserRegisterResponseCopyWith<$Res> {
  factory $UserRegisterResponseCopyWith(UserRegisterResponse value,
          $Res Function(UserRegisterResponse) _then) =
      _$UserRegisterResponseCopyWithImpl;
  @useResult
  $Res call(
      {String? message,
      String? data,
      int? statusCode,
      bool? isSuccess,
      bool? hasExceptionError,
      String? validationErrors});
}

/// @nodoc
class _$UserRegisterResponseCopyWithImpl<$Res>
    implements $UserRegisterResponseCopyWith<$Res> {
  _$UserRegisterResponseCopyWithImpl(this._self, this._then);

  final UserRegisterResponse _self;
  final $Res Function(UserRegisterResponse) _then;

  /// Create a copy of UserRegisterResponse
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
              as String?,
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
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UserRegisterResponse implements UserRegisterResponse {
  const _UserRegisterResponse(
      {this.message,
      this.data,
      this.statusCode,
      this.isSuccess,
      this.hasExceptionError,
      this.validationErrors});
  factory _UserRegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$UserRegisterResponseFromJson(json);

  @override
  final String? message;
  @override
  final String? data;
  @override
  final int? statusCode;
  @override
  final bool? isSuccess;
  @override
  final bool? hasExceptionError;
  @override
  final String? validationErrors;

  /// Create a copy of UserRegisterResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserRegisterResponseCopyWith<_UserRegisterResponse> get copyWith =>
      __$UserRegisterResponseCopyWithImpl<_UserRegisterResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserRegisterResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserRegisterResponse &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.hasExceptionError, hasExceptionError) ||
                other.hasExceptionError == hasExceptionError) &&
            (identical(other.validationErrors, validationErrors) ||
                other.validationErrors == validationErrors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, data, statusCode,
      isSuccess, hasExceptionError, validationErrors);

  @override
  String toString() {
    return 'UserRegisterResponse(message: $message, data: $data, statusCode: $statusCode, isSuccess: $isSuccess, hasExceptionError: $hasExceptionError, validationErrors: $validationErrors)';
  }
}

/// @nodoc
abstract mixin class _$UserRegisterResponseCopyWith<$Res>
    implements $UserRegisterResponseCopyWith<$Res> {
  factory _$UserRegisterResponseCopyWith(_UserRegisterResponse value,
          $Res Function(_UserRegisterResponse) _then) =
      __$UserRegisterResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? message,
      String? data,
      int? statusCode,
      bool? isSuccess,
      bool? hasExceptionError,
      String? validationErrors});
}

/// @nodoc
class __$UserRegisterResponseCopyWithImpl<$Res>
    implements _$UserRegisterResponseCopyWith<$Res> {
  __$UserRegisterResponseCopyWithImpl(this._self, this._then);

  final _UserRegisterResponse _self;
  final $Res Function(_UserRegisterResponse) _then;

  /// Create a copy of UserRegisterResponse
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
    return _then(_UserRegisterResponse(
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as String?,
    ));
  }
}

// dart format on

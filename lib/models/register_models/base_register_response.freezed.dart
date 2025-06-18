// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_register_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BaseRegisterResponse {
  @JsonKey(name: 'Message')
  String? get message;
  @JsonKey(name: 'Data')
  dynamic get data;
  @JsonKey(name: 'StatusCode')
  int? get statusCode;
  @JsonKey(name: 'IsSuccess')
  bool? get isSuccess;
  @JsonKey(name: 'HasExceptionError')
  bool? get hasExceptionError;
  @JsonKey(name: 'ValidationErrors')
  dynamic get validationErrors;

  /// Create a copy of BaseRegisterResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BaseRegisterResponseCopyWith<BaseRegisterResponse> get copyWith =>
      _$BaseRegisterResponseCopyWithImpl<BaseRegisterResponse>(
          this as BaseRegisterResponse, _$identity);

  /// Serializes this BaseRegisterResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BaseRegisterResponse &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.data, data) &&
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
      const DeepCollectionEquality().hash(data),
      statusCode,
      isSuccess,
      hasExceptionError,
      const DeepCollectionEquality().hash(validationErrors));

  @override
  String toString() {
    return 'BaseRegisterResponse(message: $message, data: $data, statusCode: $statusCode, isSuccess: $isSuccess, hasExceptionError: $hasExceptionError, validationErrors: $validationErrors)';
  }
}

/// @nodoc
abstract mixin class $BaseRegisterResponseCopyWith<$Res> {
  factory $BaseRegisterResponseCopyWith(BaseRegisterResponse value,
          $Res Function(BaseRegisterResponse) _then) =
      _$BaseRegisterResponseCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'Message') String? message,
      @JsonKey(name: 'Data') dynamic data,
      @JsonKey(name: 'StatusCode') int? statusCode,
      @JsonKey(name: 'IsSuccess') bool? isSuccess,
      @JsonKey(name: 'HasExceptionError') bool? hasExceptionError,
      @JsonKey(name: 'ValidationErrors') dynamic validationErrors});
}

/// @nodoc
class _$BaseRegisterResponseCopyWithImpl<$Res>
    implements $BaseRegisterResponseCopyWith<$Res> {
  _$BaseRegisterResponseCopyWithImpl(this._self, this._then);

  final BaseRegisterResponse _self;
  final $Res Function(BaseRegisterResponse) _then;

  /// Create a copy of BaseRegisterResponse
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
              as dynamic,
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
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _BaseRegisterResponse implements BaseRegisterResponse {
  const _BaseRegisterResponse(
      {@JsonKey(name: 'Message') this.message,
      @JsonKey(name: 'Data') this.data,
      @JsonKey(name: 'StatusCode') this.statusCode,
      @JsonKey(name: 'IsSuccess') this.isSuccess,
      @JsonKey(name: 'HasExceptionError') this.hasExceptionError,
      @JsonKey(name: 'ValidationErrors') this.validationErrors});
  factory _BaseRegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseRegisterResponseFromJson(json);

  @override
  @JsonKey(name: 'Message')
  final String? message;
  @override
  @JsonKey(name: 'Data')
  final dynamic data;
  @override
  @JsonKey(name: 'StatusCode')
  final int? statusCode;
  @override
  @JsonKey(name: 'IsSuccess')
  final bool? isSuccess;
  @override
  @JsonKey(name: 'HasExceptionError')
  final bool? hasExceptionError;
  @override
  @JsonKey(name: 'ValidationErrors')
  final dynamic validationErrors;

  /// Create a copy of BaseRegisterResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BaseRegisterResponseCopyWith<_BaseRegisterResponse> get copyWith =>
      __$BaseRegisterResponseCopyWithImpl<_BaseRegisterResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BaseRegisterResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BaseRegisterResponse &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.data, data) &&
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
      const DeepCollectionEquality().hash(data),
      statusCode,
      isSuccess,
      hasExceptionError,
      const DeepCollectionEquality().hash(validationErrors));

  @override
  String toString() {
    return 'BaseRegisterResponse(message: $message, data: $data, statusCode: $statusCode, isSuccess: $isSuccess, hasExceptionError: $hasExceptionError, validationErrors: $validationErrors)';
  }
}

/// @nodoc
abstract mixin class _$BaseRegisterResponseCopyWith<$Res>
    implements $BaseRegisterResponseCopyWith<$Res> {
  factory _$BaseRegisterResponseCopyWith(_BaseRegisterResponse value,
          $Res Function(_BaseRegisterResponse) _then) =
      __$BaseRegisterResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Message') String? message,
      @JsonKey(name: 'Data') dynamic data,
      @JsonKey(name: 'StatusCode') int? statusCode,
      @JsonKey(name: 'IsSuccess') bool? isSuccess,
      @JsonKey(name: 'HasExceptionError') bool? hasExceptionError,
      @JsonKey(name: 'ValidationErrors') dynamic validationErrors});
}

/// @nodoc
class __$BaseRegisterResponseCopyWithImpl<$Res>
    implements _$BaseRegisterResponseCopyWith<$Res> {
  __$BaseRegisterResponseCopyWithImpl(this._self, this._then);

  final _BaseRegisterResponse _self;
  final $Res Function(_BaseRegisterResponse) _then;

  /// Create a copy of BaseRegisterResponse
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
    return _then(_BaseRegisterResponse(
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
              as dynamic,
    ));
  }
}

// dart format on

// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginResponseModel {
  String? get message;
  DataLogin? get data;
  int? get statusCode;
  bool? get isSuccess;
  bool? get hasExceptionError;
  dynamic get validationErrors;

  /// Create a copy of LoginResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoginResponseModelCopyWith<LoginResponseModel> get copyWith =>
      _$LoginResponseModelCopyWithImpl<LoginResponseModel>(
          this as LoginResponseModel, _$identity);

  /// Serializes this LoginResponseModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoginResponseModel &&
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
    return 'LoginResponseModel(message: $message, data: $data, statusCode: $statusCode, isSuccess: $isSuccess, hasExceptionError: $hasExceptionError, validationErrors: $validationErrors)';
  }
}

/// @nodoc
abstract mixin class $LoginResponseModelCopyWith<$Res> {
  factory $LoginResponseModelCopyWith(
          LoginResponseModel value, $Res Function(LoginResponseModel) _then) =
      _$LoginResponseModelCopyWithImpl;
  @useResult
  $Res call(
      {String? message,
      DataLogin? data,
      int? statusCode,
      bool? isSuccess,
      bool? hasExceptionError,
      dynamic validationErrors});

  $DataLoginCopyWith<$Res>? get data;
}

/// @nodoc
class _$LoginResponseModelCopyWithImpl<$Res>
    implements $LoginResponseModelCopyWith<$Res> {
  _$LoginResponseModelCopyWithImpl(this._self, this._then);

  final LoginResponseModel _self;
  final $Res Function(LoginResponseModel) _then;

  /// Create a copy of LoginResponseModel
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
              as DataLogin?,
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

  /// Create a copy of LoginResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataLoginCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $DataLoginCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _LoginResponseModel implements LoginResponseModel {
  const _LoginResponseModel(
      {this.message,
      this.data,
      this.statusCode,
      this.isSuccess,
      this.hasExceptionError,
      this.validationErrors});
  factory _LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  @override
  final String? message;
  @override
  final DataLogin? data;
  @override
  final int? statusCode;
  @override
  final bool? isSuccess;
  @override
  final bool? hasExceptionError;
  @override
  final dynamic validationErrors;

  /// Create a copy of LoginResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoginResponseModelCopyWith<_LoginResponseModel> get copyWith =>
      __$LoginResponseModelCopyWithImpl<_LoginResponseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LoginResponseModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginResponseModel &&
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
    return 'LoginResponseModel(message: $message, data: $data, statusCode: $statusCode, isSuccess: $isSuccess, hasExceptionError: $hasExceptionError, validationErrors: $validationErrors)';
  }
}

/// @nodoc
abstract mixin class _$LoginResponseModelCopyWith<$Res>
    implements $LoginResponseModelCopyWith<$Res> {
  factory _$LoginResponseModelCopyWith(
          _LoginResponseModel value, $Res Function(_LoginResponseModel) _then) =
      __$LoginResponseModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? message,
      DataLogin? data,
      int? statusCode,
      bool? isSuccess,
      bool? hasExceptionError,
      dynamic validationErrors});

  @override
  $DataLoginCopyWith<$Res>? get data;
}

/// @nodoc
class __$LoginResponseModelCopyWithImpl<$Res>
    implements _$LoginResponseModelCopyWith<$Res> {
  __$LoginResponseModelCopyWithImpl(this._self, this._then);

  final _LoginResponseModel _self;
  final $Res Function(_LoginResponseModel) _then;

  /// Create a copy of LoginResponseModel
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
    return _then(_LoginResponseModel(
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as DataLogin?,
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

  /// Create a copy of LoginResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataLoginCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $DataLoginCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// @nodoc
mixin _$DataLogin {
  String? get accessToken;
  String? get refreshToken;
  bool? get emailConfirmed;

  /// Create a copy of DataLogin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DataLoginCopyWith<DataLogin> get copyWith =>
      _$DataLoginCopyWithImpl<DataLogin>(this as DataLogin, _$identity);

  /// Serializes this DataLogin to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DataLogin &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.emailConfirmed, emailConfirmed) ||
                other.emailConfirmed == emailConfirmed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, accessToken, refreshToken, emailConfirmed);

  @override
  String toString() {
    return 'DataLogin(accessToken: $accessToken, refreshToken: $refreshToken, emailConfirmed: $emailConfirmed)';
  }
}

/// @nodoc
abstract mixin class $DataLoginCopyWith<$Res> {
  factory $DataLoginCopyWith(DataLogin value, $Res Function(DataLogin) _then) =
      _$DataLoginCopyWithImpl;
  @useResult
  $Res call({String? accessToken, String? refreshToken, bool? emailConfirmed});
}

/// @nodoc
class _$DataLoginCopyWithImpl<$Res> implements $DataLoginCopyWith<$Res> {
  _$DataLoginCopyWithImpl(this._self, this._then);

  final DataLogin _self;
  final $Res Function(DataLogin) _then;

  /// Create a copy of DataLogin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
    Object? emailConfirmed = freezed,
  }) {
    return _then(_self.copyWith(
      accessToken: freezed == accessToken
          ? _self.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _self.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      emailConfirmed: freezed == emailConfirmed
          ? _self.emailConfirmed
          : emailConfirmed // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _DataLogin implements DataLogin {
  const _DataLogin({this.accessToken, this.refreshToken, this.emailConfirmed});
  factory _DataLogin.fromJson(Map<String, dynamic> json) =>
      _$DataLoginFromJson(json);

  @override
  final String? accessToken;
  @override
  final String? refreshToken;
  @override
  final bool? emailConfirmed;

  /// Create a copy of DataLogin
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DataLoginCopyWith<_DataLogin> get copyWith =>
      __$DataLoginCopyWithImpl<_DataLogin>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DataLoginToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DataLogin &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.emailConfirmed, emailConfirmed) ||
                other.emailConfirmed == emailConfirmed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, accessToken, refreshToken, emailConfirmed);

  @override
  String toString() {
    return 'DataLogin(accessToken: $accessToken, refreshToken: $refreshToken, emailConfirmed: $emailConfirmed)';
  }
}

/// @nodoc
abstract mixin class _$DataLoginCopyWith<$Res>
    implements $DataLoginCopyWith<$Res> {
  factory _$DataLoginCopyWith(
          _DataLogin value, $Res Function(_DataLogin) _then) =
      __$DataLoginCopyWithImpl;
  @override
  @useResult
  $Res call({String? accessToken, String? refreshToken, bool? emailConfirmed});
}

/// @nodoc
class __$DataLoginCopyWithImpl<$Res> implements _$DataLoginCopyWith<$Res> {
  __$DataLoginCopyWithImpl(this._self, this._then);

  final _DataLogin _self;
  final $Res Function(_DataLogin) _then;

  /// Create a copy of DataLogin
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? accessToken = freezed,
    Object? refreshToken = freezed,
    Object? emailConfirmed = freezed,
  }) {
    return _then(_DataLogin(
      accessToken: freezed == accessToken
          ? _self.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _self.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      emailConfirmed: freezed == emailConfirmed
          ? _self.emailConfirmed
          : emailConfirmed // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

// dart format on

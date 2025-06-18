// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoryResponse {
  String? get message;
  List<CategoryData>? get data;
  int? get statusCode;
  bool? get isSuccess;
  bool? get hasExceptionError;
  String? get validationErrors;

  /// Create a copy of CategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryResponseCopyWith<CategoryResponse> get copyWith =>
      _$CategoryResponseCopyWithImpl<CategoryResponse>(
          this as CategoryResponse, _$identity);

  /// Serializes this CategoryResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryResponse &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.data, data) &&
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
  int get hashCode => Object.hash(
      runtimeType,
      message,
      const DeepCollectionEquality().hash(data),
      statusCode,
      isSuccess,
      hasExceptionError,
      validationErrors);

  @override
  String toString() {
    return 'CategoryResponse(message: $message, data: $data, statusCode: $statusCode, isSuccess: $isSuccess, hasExceptionError: $hasExceptionError, validationErrors: $validationErrors)';
  }
}

/// @nodoc
abstract mixin class $CategoryResponseCopyWith<$Res> {
  factory $CategoryResponseCopyWith(
          CategoryResponse value, $Res Function(CategoryResponse) _then) =
      _$CategoryResponseCopyWithImpl;
  @useResult
  $Res call(
      {String? message,
      List<CategoryData>? data,
      int? statusCode,
      bool? isSuccess,
      bool? hasExceptionError,
      String? validationErrors});
}

/// @nodoc
class _$CategoryResponseCopyWithImpl<$Res>
    implements $CategoryResponseCopyWith<$Res> {
  _$CategoryResponseCopyWithImpl(this._self, this._then);

  final CategoryResponse _self;
  final $Res Function(CategoryResponse) _then;

  /// Create a copy of CategoryResponse
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
              as List<CategoryData>?,
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
class _CategoryResponse implements CategoryResponse {
  const _CategoryResponse(
      {this.message,
      final List<CategoryData>? data,
      this.statusCode,
      this.isSuccess,
      this.hasExceptionError,
      this.validationErrors})
      : _data = data;
  factory _CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);

  @override
  final String? message;
  final List<CategoryData>? _data;
  @override
  List<CategoryData>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? statusCode;
  @override
  final bool? isSuccess;
  @override
  final bool? hasExceptionError;
  @override
  final String? validationErrors;

  /// Create a copy of CategoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoryResponseCopyWith<_CategoryResponse> get copyWith =>
      __$CategoryResponseCopyWithImpl<_CategoryResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CategoryResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryResponse &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
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
  int get hashCode => Object.hash(
      runtimeType,
      message,
      const DeepCollectionEquality().hash(_data),
      statusCode,
      isSuccess,
      hasExceptionError,
      validationErrors);

  @override
  String toString() {
    return 'CategoryResponse(message: $message, data: $data, statusCode: $statusCode, isSuccess: $isSuccess, hasExceptionError: $hasExceptionError, validationErrors: $validationErrors)';
  }
}

/// @nodoc
abstract mixin class _$CategoryResponseCopyWith<$Res>
    implements $CategoryResponseCopyWith<$Res> {
  factory _$CategoryResponseCopyWith(
          _CategoryResponse value, $Res Function(_CategoryResponse) _then) =
      __$CategoryResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? message,
      List<CategoryData>? data,
      int? statusCode,
      bool? isSuccess,
      bool? hasExceptionError,
      String? validationErrors});
}

/// @nodoc
class __$CategoryResponseCopyWithImpl<$Res>
    implements _$CategoryResponseCopyWith<$Res> {
  __$CategoryResponseCopyWithImpl(this._self, this._then);

  final _CategoryResponse _self;
  final $Res Function(_CategoryResponse) _then;

  /// Create a copy of CategoryResponse
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
    return _then(_CategoryResponse(
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CategoryData>?,
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
mixin _$CategoryData {
  String? get id;
  String? get name;
  String? get description;

  /// Create a copy of CategoryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryDataCopyWith<CategoryData> get copyWith =>
      _$CategoryDataCopyWithImpl<CategoryData>(
          this as CategoryData, _$identity);

  /// Serializes this CategoryData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description);

  @override
  String toString() {
    return 'CategoryData(id: $id, name: $name, description: $description)';
  }
}

/// @nodoc
abstract mixin class $CategoryDataCopyWith<$Res> {
  factory $CategoryDataCopyWith(
          CategoryData value, $Res Function(CategoryData) _then) =
      _$CategoryDataCopyWithImpl;
  @useResult
  $Res call({String? id, String? name, String? description});
}

/// @nodoc
class _$CategoryDataCopyWithImpl<$Res> implements $CategoryDataCopyWith<$Res> {
  _$CategoryDataCopyWithImpl(this._self, this._then);

  final CategoryData _self;
  final $Res Function(CategoryData) _then;

  /// Create a copy of CategoryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CategoryData implements CategoryData {
  const _CategoryData({this.id, this.name, this.description});
  factory _CategoryData.fromJson(Map<String, dynamic> json) =>
      _$CategoryDataFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? description;

  /// Create a copy of CategoryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoryDataCopyWith<_CategoryData> get copyWith =>
      __$CategoryDataCopyWithImpl<_CategoryData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CategoryDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description);

  @override
  String toString() {
    return 'CategoryData(id: $id, name: $name, description: $description)';
  }
}

/// @nodoc
abstract mixin class _$CategoryDataCopyWith<$Res>
    implements $CategoryDataCopyWith<$Res> {
  factory _$CategoryDataCopyWith(
          _CategoryData value, $Res Function(_CategoryData) _then) =
      __$CategoryDataCopyWithImpl;
  @override
  @useResult
  $Res call({String? id, String? name, String? description});
}

/// @nodoc
class __$CategoryDataCopyWithImpl<$Res>
    implements _$CategoryDataCopyWith<$Res> {
  __$CategoryDataCopyWithImpl(this._self, this._then);

  final _CategoryData _self;
  final $Res Function(_CategoryData) _then;

  /// Create a copy of CategoryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
  }) {
    return _then(_CategoryData(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on

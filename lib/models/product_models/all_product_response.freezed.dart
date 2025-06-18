// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_product_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductResponse {
  String? get message;
  List<ProductData>? get data;
  int? get statusCode;
  bool? get isSuccess;
  bool? get hasExceptionError;
  String? get validationErrors;

  /// Create a copy of ProductResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductResponseCopyWith<ProductResponse> get copyWith =>
      _$ProductResponseCopyWithImpl<ProductResponse>(
          this as ProductResponse, _$identity);

  /// Serializes this ProductResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductResponse &&
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
    return 'ProductResponse(message: $message, data: $data, statusCode: $statusCode, isSuccess: $isSuccess, hasExceptionError: $hasExceptionError, validationErrors: $validationErrors)';
  }
}

/// @nodoc
abstract mixin class $ProductResponseCopyWith<$Res> {
  factory $ProductResponseCopyWith(
          ProductResponse value, $Res Function(ProductResponse) _then) =
      _$ProductResponseCopyWithImpl;
  @useResult
  $Res call(
      {String? message,
      List<ProductData>? data,
      int? statusCode,
      bool? isSuccess,
      bool? hasExceptionError,
      String? validationErrors});
}

/// @nodoc
class _$ProductResponseCopyWithImpl<$Res>
    implements $ProductResponseCopyWith<$Res> {
  _$ProductResponseCopyWithImpl(this._self, this._then);

  final ProductResponse _self;
  final $Res Function(ProductResponse) _then;

  /// Create a copy of ProductResponse
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
              as List<ProductData>?,
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
class _ProductResponse implements ProductResponse {
  const _ProductResponse(
      {this.message,
      final List<ProductData>? data,
      this.statusCode,
      this.isSuccess,
      this.hasExceptionError,
      this.validationErrors})
      : _data = data;
  factory _ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  @override
  final String? message;
  final List<ProductData>? _data;
  @override
  List<ProductData>? get data {
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

  /// Create a copy of ProductResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProductResponseCopyWith<_ProductResponse> get copyWith =>
      __$ProductResponseCopyWithImpl<_ProductResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProductResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductResponse &&
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
    return 'ProductResponse(message: $message, data: $data, statusCode: $statusCode, isSuccess: $isSuccess, hasExceptionError: $hasExceptionError, validationErrors: $validationErrors)';
  }
}

/// @nodoc
abstract mixin class _$ProductResponseCopyWith<$Res>
    implements $ProductResponseCopyWith<$Res> {
  factory _$ProductResponseCopyWith(
          _ProductResponse value, $Res Function(_ProductResponse) _then) =
      __$ProductResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? message,
      List<ProductData>? data,
      int? statusCode,
      bool? isSuccess,
      bool? hasExceptionError,
      String? validationErrors});
}

/// @nodoc
class __$ProductResponseCopyWithImpl<$Res>
    implements _$ProductResponseCopyWith<$Res> {
  __$ProductResponseCopyWithImpl(this._self, this._then);

  final _ProductResponse _self;
  final $Res Function(_ProductResponse) _then;

  /// Create a copy of ProductResponse
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
    return _then(_ProductResponse(
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ProductData>?,
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
mixin _$ProductData {
  String? get id;
  String? get name;
  String? get description;
  double? get originalPrice;
  double? get discountedPrice;
  String? get imagePath;
  String? get categoryName;
  bool? get isActive;
  bool? get isReserved;

  /// Create a copy of ProductData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductDataCopyWith<ProductData> get copyWith =>
      _$ProductDataCopyWithImpl<ProductData>(this as ProductData, _$identity);

  /// Serializes this ProductData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.originalPrice, originalPrice) ||
                other.originalPrice == originalPrice) &&
            (identical(other.discountedPrice, discountedPrice) ||
                other.discountedPrice == discountedPrice) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isReserved, isReserved) ||
                other.isReserved == isReserved));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      originalPrice,
      discountedPrice,
      imagePath,
      categoryName,
      isActive,
      isReserved);

  @override
  String toString() {
    return 'ProductData(id: $id, name: $name, description: $description, originalPrice: $originalPrice, discountedPrice: $discountedPrice, imagePath: $imagePath, categoryName: $categoryName, isActive: $isActive, isReserved: $isReserved)';
  }
}

/// @nodoc
abstract mixin class $ProductDataCopyWith<$Res> {
  factory $ProductDataCopyWith(
          ProductData value, $Res Function(ProductData) _then) =
      _$ProductDataCopyWithImpl;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? description,
      double? originalPrice,
      double? discountedPrice,
      String? imagePath,
      String? categoryName,
      bool? isActive,
      bool? isReserved});
}

/// @nodoc
class _$ProductDataCopyWithImpl<$Res> implements $ProductDataCopyWith<$Res> {
  _$ProductDataCopyWithImpl(this._self, this._then);

  final ProductData _self;
  final $Res Function(ProductData) _then;

  /// Create a copy of ProductData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? originalPrice = freezed,
    Object? discountedPrice = freezed,
    Object? imagePath = freezed,
    Object? categoryName = freezed,
    Object? isActive = freezed,
    Object? isReserved = freezed,
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
      originalPrice: freezed == originalPrice
          ? _self.originalPrice
          : originalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      discountedPrice: freezed == discountedPrice
          ? _self.discountedPrice
          : discountedPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      imagePath: freezed == imagePath
          ? _self.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _self.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isReserved: freezed == isReserved
          ? _self.isReserved
          : isReserved // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ProductData implements ProductData {
  const _ProductData(
      {this.id,
      this.name,
      this.description,
      this.originalPrice,
      this.discountedPrice,
      this.imagePath,
      this.categoryName,
      this.isActive,
      this.isReserved});
  factory _ProductData.fromJson(Map<String, dynamic> json) =>
      _$ProductDataFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final double? originalPrice;
  @override
  final double? discountedPrice;
  @override
  final String? imagePath;
  @override
  final String? categoryName;
  @override
  final bool? isActive;
  @override
  final bool? isReserved;

  /// Create a copy of ProductData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProductDataCopyWith<_ProductData> get copyWith =>
      __$ProductDataCopyWithImpl<_ProductData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProductDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.originalPrice, originalPrice) ||
                other.originalPrice == originalPrice) &&
            (identical(other.discountedPrice, discountedPrice) ||
                other.discountedPrice == discountedPrice) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isReserved, isReserved) ||
                other.isReserved == isReserved));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      originalPrice,
      discountedPrice,
      imagePath,
      categoryName,
      isActive,
      isReserved);

  @override
  String toString() {
    return 'ProductData(id: $id, name: $name, description: $description, originalPrice: $originalPrice, discountedPrice: $discountedPrice, imagePath: $imagePath, categoryName: $categoryName, isActive: $isActive, isReserved: $isReserved)';
  }
}

/// @nodoc
abstract mixin class _$ProductDataCopyWith<$Res>
    implements $ProductDataCopyWith<$Res> {
  factory _$ProductDataCopyWith(
          _ProductData value, $Res Function(_ProductData) _then) =
      __$ProductDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? description,
      double? originalPrice,
      double? discountedPrice,
      String? imagePath,
      String? categoryName,
      bool? isActive,
      bool? isReserved});
}

/// @nodoc
class __$ProductDataCopyWithImpl<$Res> implements _$ProductDataCopyWith<$Res> {
  __$ProductDataCopyWithImpl(this._self, this._then);

  final _ProductData _self;
  final $Res Function(_ProductData) _then;

  /// Create a copy of ProductData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? originalPrice = freezed,
    Object? discountedPrice = freezed,
    Object? imagePath = freezed,
    Object? categoryName = freezed,
    Object? isActive = freezed,
    Object? isReserved = freezed,
  }) {
    return _then(_ProductData(
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
      originalPrice: freezed == originalPrice
          ? _self.originalPrice
          : originalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      discountedPrice: freezed == discountedPrice
          ? _self.discountedPrice
          : discountedPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      imagePath: freezed == imagePath
          ? _self.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _self.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isReserved: freezed == isReserved
          ? _self.isReserved
          : isReserved // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

// dart format on

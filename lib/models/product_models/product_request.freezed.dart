// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductRequest {
  String? get name;
  String? get description;
  double? get originalPrice;
  double? get discountedPrice;
  String? get categoryId;
  String? get imagePath;

  /// Create a copy of ProductRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductRequestCopyWith<ProductRequest> get copyWith =>
      _$ProductRequestCopyWithImpl<ProductRequest>(
          this as ProductRequest, _$identity);

  /// Serializes this ProductRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductRequest &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.originalPrice, originalPrice) ||
                other.originalPrice == originalPrice) &&
            (identical(other.discountedPrice, discountedPrice) ||
                other.discountedPrice == discountedPrice) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, description, originalPrice,
      discountedPrice, categoryId, imagePath);

  @override
  String toString() {
    return 'ProductRequest(name: $name, description: $description, originalPrice: $originalPrice, discountedPrice: $discountedPrice, categoryId: $categoryId, imagePath: $imagePath)';
  }
}

/// @nodoc
abstract mixin class $ProductRequestCopyWith<$Res> {
  factory $ProductRequestCopyWith(
          ProductRequest value, $Res Function(ProductRequest) _then) =
      _$ProductRequestCopyWithImpl;
  @useResult
  $Res call(
      {String? name,
      String? description,
      double? originalPrice,
      double? discountedPrice,
      String? categoryId,
      String? imagePath});
}

/// @nodoc
class _$ProductRequestCopyWithImpl<$Res>
    implements $ProductRequestCopyWith<$Res> {
  _$ProductRequestCopyWithImpl(this._self, this._then);

  final ProductRequest _self;
  final $Res Function(ProductRequest) _then;

  /// Create a copy of ProductRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? originalPrice = freezed,
    Object? discountedPrice = freezed,
    Object? categoryId = freezed,
    Object? imagePath = freezed,
  }) {
    return _then(_self.copyWith(
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
      categoryId: freezed == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePath: freezed == imagePath
          ? _self.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ProductRequest implements ProductRequest {
  const _ProductRequest(
      {this.name,
      this.description,
      this.originalPrice,
      this.discountedPrice,
      this.categoryId,
      this.imagePath});
  factory _ProductRequest.fromJson(Map<String, dynamic> json) =>
      _$ProductRequestFromJson(json);

  @override
  final String? name;
  @override
  final String? description;
  @override
  final double? originalPrice;
  @override
  final double? discountedPrice;
  @override
  final String? categoryId;
  @override
  final String? imagePath;

  /// Create a copy of ProductRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProductRequestCopyWith<_ProductRequest> get copyWith =>
      __$ProductRequestCopyWithImpl<_ProductRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProductRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductRequest &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.originalPrice, originalPrice) ||
                other.originalPrice == originalPrice) &&
            (identical(other.discountedPrice, discountedPrice) ||
                other.discountedPrice == discountedPrice) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, description, originalPrice,
      discountedPrice, categoryId, imagePath);

  @override
  String toString() {
    return 'ProductRequest(name: $name, description: $description, originalPrice: $originalPrice, discountedPrice: $discountedPrice, categoryId: $categoryId, imagePath: $imagePath)';
  }
}

/// @nodoc
abstract mixin class _$ProductRequestCopyWith<$Res>
    implements $ProductRequestCopyWith<$Res> {
  factory _$ProductRequestCopyWith(
          _ProductRequest value, $Res Function(_ProductRequest) _then) =
      __$ProductRequestCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? name,
      String? description,
      double? originalPrice,
      double? discountedPrice,
      String? categoryId,
      String? imagePath});
}

/// @nodoc
class __$ProductRequestCopyWithImpl<$Res>
    implements _$ProductRequestCopyWith<$Res> {
  __$ProductRequestCopyWithImpl(this._self, this._then);

  final _ProductRequest _self;
  final $Res Function(_ProductRequest) _then;

  /// Create a copy of ProductRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? originalPrice = freezed,
    Object? discountedPrice = freezed,
    Object? categoryId = freezed,
    Object? imagePath = freezed,
  }) {
    return _then(_ProductRequest(
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
      categoryId: freezed == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePath: freezed == imagePath
          ? _self.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on

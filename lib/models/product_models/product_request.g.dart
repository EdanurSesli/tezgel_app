// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductRequest _$ProductRequestFromJson(Map<String, dynamic> json) =>
    _ProductRequest(
      name: json['name'] as String?,
      description: json['description'] as String?,
      originalPrice: (json['originalPrice'] as num?)?.toDouble(),
      discountedPrice: (json['discountedPrice'] as num?)?.toDouble(),
      categoryId: json['categoryId'] as String?,
      imagePath: json['imagePath'] as String?,
    );

Map<String, dynamic> _$ProductRequestToJson(_ProductRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'originalPrice': instance.originalPrice,
      'discountedPrice': instance.discountedPrice,
      'categoryId': instance.categoryId,
      'imagePath': instance.imagePath,
    };

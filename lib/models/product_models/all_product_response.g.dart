// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) {
  final rawData = json['data'];
  List<ProductData>? dataList;
  if (rawData is List) {
    dataList = rawData
        .map((e) => ProductData.fromJson(e as Map<String, dynamic>))
        .toList();
  } else if (rawData is Map<String, dynamic>) {
    dataList = [ProductData.fromJson(rawData)];
  } else {
    dataList = null;
  }
  return _ProductResponse(
    message: json['message'] as String?,
    data: dataList,
    statusCode: (json['statusCode'] as num?)?.toInt(),
    isSuccess: json['isSuccess'] as bool?,
    hasExceptionError: json['hasExceptionError'] as bool?,
    validationErrors: json['validationErrors'] as String?,
  );
}

Map<String, dynamic> _$ProductResponseToJson(_ProductResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'statusCode': instance.statusCode,
      'isSuccess': instance.isSuccess,
      'hasExceptionError': instance.hasExceptionError,
      'validationErrors': instance.validationErrors,
    };

_ProductData _$ProductDataFromJson(Map<String, dynamic> json) => _ProductData(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      originalPrice: (json['originalPrice'] as num?)?.toDouble(),
      discountedPrice: (json['discountedPrice'] as num?)?.toDouble(),
      imagePath: json['imagePath'] as String?,
      categoryName: json['categoryName'] as String?,
      isActive: json['isActive'] as bool?,
      isReserved: json['isReserved'] as bool?,
    );

Map<String, dynamic> _$ProductDataToJson(_ProductData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'originalPrice': instance.originalPrice,
      'discountedPrice': instance.discountedPrice,
      'imagePath': instance.imagePath,
      'categoryName': instance.categoryName,
      'isActive': instance.isActive,
      'isReserved': instance.isReserved,
    };

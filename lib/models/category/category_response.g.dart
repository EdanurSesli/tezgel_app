// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoryResponse _$CategoryResponseFromJson(Map<String, dynamic> json) =>
    _CategoryResponse(
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CategoryData.fromJson(e as Map<String, dynamic>))
          .toList(),
      statusCode: (json['statusCode'] as num?)?.toInt(),
      isSuccess: json['isSuccess'] as bool?,
      hasExceptionError: json['hasExceptionError'] as bool?,
      validationErrors: json['validationErrors'] as String?,
    );

Map<String, dynamic> _$CategoryResponseToJson(_CategoryResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'statusCode': instance.statusCode,
      'isSuccess': instance.isSuccess,
      'hasExceptionError': instance.hasExceptionError,
      'validationErrors': instance.validationErrors,
    };

_CategoryData _$CategoryDataFromJson(Map<String, dynamic> json) =>
    _CategoryData(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$CategoryDataToJson(_CategoryData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };

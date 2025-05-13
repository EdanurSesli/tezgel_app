// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_register_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BaseRegisterResponse _$BaseRegisterResponseFromJson(
        Map<String, dynamic> json) =>
    _BaseRegisterResponse(
      message: json['message'] as String?,
      data: json['data'] as String?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      isSuccess: json['isSuccess'] as bool?,
      hasExceptionError: json['hasExceptionError'] as bool?,
      validationErrors: json['validationErrors'] as String?,
    );

Map<String, dynamic> _$BaseRegisterResponseToJson(
        _BaseRegisterResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'statusCode': instance.statusCode,
      'isSuccess': instance.isSuccess,
      'hasExceptionError': instance.hasExceptionError,
      'validationErrors': instance.validationErrors,
    };

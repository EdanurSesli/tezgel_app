// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_register_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BaseRegisterResponse _$BaseRegisterResponseFromJson(
        Map<String, dynamic> json) =>
    _BaseRegisterResponse(
      message: json['Message'] as String?,
      data: json['Data'],
      statusCode: (json['StatusCode'] as num?)?.toInt(),
      isSuccess: json['IsSuccess'] as bool?,
      hasExceptionError: json['HasExceptionError'] as bool?,
      validationErrors: json['ValidationErrors'],
    );

Map<String, dynamic> _$BaseRegisterResponseToJson(
        _BaseRegisterResponse instance) =>
    <String, dynamic>{
      'Message': instance.message,
      'Data': instance.data,
      'StatusCode': instance.statusCode,
      'IsSuccess': instance.isSuccess,
      'HasExceptionError': instance.hasExceptionError,
      'ValidationErrors': instance.validationErrors,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginRequestModel _$LoginRequestModelFromJson(Map<String, dynamic> json) =>
    _LoginRequestModel(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : DataLogin.fromJson(json['data'] as Map<String, dynamic>),
      statusCode: (json['statusCode'] as num?)?.toInt(),
      isSuccess: json['isSuccess'] as bool?,
      hasExceptionError: json['hasExceptionError'] as bool?,
      validationErrors: json['validationErrors'],
    );

Map<String, dynamic> _$LoginRequestModelToJson(_LoginRequestModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'statusCode': instance.statusCode,
      'isSuccess': instance.isSuccess,
      'hasExceptionError': instance.hasExceptionError,
      'validationErrors': instance.validationErrors,
    };

_DataLogin _$DataLoginFromJson(Map<String, dynamic> json) => _DataLogin(
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
      emailConfirmed: json['emailConfirmed'] as bool?,
    );

Map<String, dynamic> _$DataLoginToJson(_DataLogin instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'emailConfirmed': instance.emailConfirmed,
    };

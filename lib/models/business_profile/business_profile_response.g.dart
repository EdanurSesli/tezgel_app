// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BusinessProfileResponse _$BusinessProfileResponseFromJson(
        Map<String, dynamic> json) =>
    _BusinessProfileResponse(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : BusinessData.fromJson(json['data'] as Map<String, dynamic>),
      statusCode: (json['statusCode'] as num?)?.toInt(),
      isSuccess: json['isSuccess'] as bool?,
      hasExceptionError: json['hasExceptionError'] as bool?,
      validationErrors: (json['validationErrors'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$BusinessProfileResponseToJson(
        _BusinessProfileResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'statusCode': instance.statusCode,
      'isSuccess': instance.isSuccess,
      'hasExceptionError': instance.hasExceptionError,
      'validationErrors': instance.validationErrors,
    };

_BusinessData _$BusinessDataFromJson(Map<String, dynamic> json) =>
    _BusinessData(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      companyName: json['companyName'] as String?,
      companyType: json['companyType'] as String?,
      closingTime: json['closingTime'] as String?,
    );

Map<String, dynamic> _$BusinessDataToJson(_BusinessData instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'companyName': instance.companyName,
      'companyType': instance.companyType,
      'closingTime': instance.closingTime,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BusinessRegisterRequest _$BusinessRegisterRequestFromJson(
        Map<String, dynamic> json) =>
    _BusinessRegisterRequest(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      userName: json['userName'] as String?,
      closingTime: json['closingTime'] == null
          ? null
          : ClosingTime.fromJson(json['closingTime'] as Map<String, dynamic>),
      companyName: json['companyName'] as String?,
      companyType: json['companyType'] as String?,
    );

Map<String, dynamic> _$BusinessRegisterRequestToJson(
        _BusinessRegisterRequest instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'password': instance.password,
      'userName': instance.userName,
      'closingTime': instance.closingTime,
      'companyName': instance.companyName,
      'companyType': instance.companyType,
    };

_ClosingTime _$ClosingTimeFromJson(Map<String, dynamic> json) => _ClosingTime(
      ticks: (json['ticks'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ClosingTimeToJson(_ClosingTime instance) =>
    <String, dynamic>{
      'ticks': instance.ticks,
    };

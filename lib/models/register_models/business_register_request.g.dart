// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BusinessRegisterRequest _$BusinessRegisterRequestFromJson(
        Map<String, dynamic> json) =>
    _BusinessRegisterRequest(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      userName: json['userName'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      closingTime: json['closingTime'] as String,
      companyName: json['companyName'] as String,
      companyType: json['companyType'] as String,
    );

Map<String, dynamic> _$BusinessRegisterRequestToJson(
        _BusinessRegisterRequest instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'password': instance.password,
      'userName': instance.userName,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'closingTime': instance.closingTime,
      'companyName': instance.companyName,
      'companyType': instance.companyType,
    };

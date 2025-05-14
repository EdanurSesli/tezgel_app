// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserRegisterRequest _$UserRegisterRequestFromJson(Map<String, dynamic> json) =>
    _UserRegisterRequest(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      userName: json['userName'] as String?,
      address: json['address'] as String?,
      longitude: (json['longitude'] as num?)?.toDouble(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
    );

Map<String, dynamic> _$UserRegisterRequestToJson(
        _UserRegisterRequest instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'password': instance.password,
      'userName': instance.userName,
      'address': instance.address,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'birthDate': instance.birthDate?.toIso8601String(),
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_complete.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReservationRequest _$ReservationRequestFromJson(Map<String, dynamic> json) =>
    _ReservationRequest(
      reservationId: json['reservationId'] as String?,
      businessQrid: json['businessQrid'] as String?,
    );

Map<String, dynamic> _$ReservationRequestToJson(_ReservationRequest instance) =>
    <String, dynamic>{
      'reservationId': instance.reservationId,
      'businessQrid': instance.businessQrid,
    };

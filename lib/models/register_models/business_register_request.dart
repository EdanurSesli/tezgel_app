import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'business_register_request.freezed.dart';
part 'business_register_request.g.dart';

@freezed
abstract class BusinessRegisterRequest with _$BusinessRegisterRequest {
    const factory BusinessRegisterRequest({
        String? firstName,
        String? lastName,
        String? email,
        String? password,
        String? userName,
        ClosingTime? closingTime,
        String? companyName,
        String? companyType,
    }) = _BusinessRegisterRequest;

    factory BusinessRegisterRequest.fromJson(Map<String, dynamic> json) => _$BusinessRegisterRequestFromJson(json);
}

@freezed
abstract class ClosingTime with _$ClosingTime {
    const factory ClosingTime({
        int? ticks,
    }) = _ClosingTime;

    factory ClosingTime.fromJson(Map<String, dynamic> json) => _$ClosingTimeFromJson(json);
}

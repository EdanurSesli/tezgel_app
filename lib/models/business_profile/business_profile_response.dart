import 'package:freezed_annotation/freezed_annotation.dart';

part 'business_profile_response.freezed.dart';
part 'business_profile_response.g.dart';

@freezed
abstract class BusinessProfileResponse with _$BusinessProfileResponse {
  const factory BusinessProfileResponse({
    String? message,
    BusinessData? data,
    int? statusCode,
    bool? isSuccess,
    bool? hasExceptionError,
    List<String>? validationErrors,
  }) = _BusinessProfileResponse;

  factory BusinessProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$BusinessProfileResponseFromJson(json);
}

@freezed
abstract class BusinessData with _$BusinessData {
  const factory BusinessData({
    String? firstName,
    String? lastName,
    String? email,
    String? companyName,
    String? companyType,
    String? closingTime,
  }) = _BusinessData;

  factory BusinessData.fromJson(Map<String, dynamic> json) =>
      _$BusinessDataFromJson(json);
}

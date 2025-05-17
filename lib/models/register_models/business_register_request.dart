import 'package:freezed_annotation/freezed_annotation.dart';

part 'business_register_request.freezed.dart';
part 'business_register_request.g.dart';

@freezed
abstract class BusinessRegisterRequest with _$BusinessRegisterRequest {
  const factory BusinessRegisterRequest({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String userName,
    required double latitude,
    required double longitude,
    required String closingTime, // "HH:mm" formatında string
    required String companyName,
    required String companyType,
  }) = _BusinessRegisterRequest;

  factory BusinessRegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$BusinessRegisterRequestFromJson(json);
}

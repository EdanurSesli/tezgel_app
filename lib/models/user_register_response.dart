import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_register_response.freezed.dart';
part 'user_register_response.g.dart';

@freezed
abstract class UserRegisterResponse with _$UserRegisterResponse {
  const factory UserRegisterResponse({
    String? message,
    String? data,
    int? statusCode,
    bool? isSuccess,
    bool? hasExceptionError,
    String? validationErrors,
  }) = _UserRegisterResponse;

  factory UserRegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$UserRegisterResponseFromJson(json);
}

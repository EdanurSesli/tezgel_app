import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_register_response.freezed.dart';
part 'base_register_response.g.dart';

@freezed
abstract class BaseRegisterResponse with _$BaseRegisterResponse {
  const factory BaseRegisterResponse({
    String? message,
    String? data,
    int? statusCode,
    bool? isSuccess,
    bool? hasExceptionError,
    String? validationErrors,
  }) = _BaseRegisterResponse;

  factory BaseRegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseRegisterResponseFromJson(json);
}

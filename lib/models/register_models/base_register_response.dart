import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_register_response.freezed.dart';
part 'base_register_response.g.dart';

@freezed
abstract class BaseRegisterResponse with _$BaseRegisterResponse {
  const factory BaseRegisterResponse({
    @JsonKey(name: 'Message') String? message,
    @JsonKey(name: 'Data') dynamic data,
    @JsonKey(name: 'StatusCode') int? statusCode,
    @JsonKey(name: 'IsSuccess') bool? isSuccess,
    @JsonKey(name: 'HasExceptionError') bool? hasExceptionError,
    @JsonKey(name: 'ValidationErrors') dynamic validationErrors,
  }) = _BaseRegisterResponse;

  factory BaseRegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseRegisterResponseFromJson(json);
}

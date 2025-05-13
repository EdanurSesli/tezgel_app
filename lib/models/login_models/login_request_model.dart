import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'login_request_model.freezed.dart';
part 'login_request_model.g.dart';

@freezed
abstract class LoginRequestModel with _$LoginRequestModel {
    const factory LoginRequestModel({
        String? message,
        DataLogin? data,
        int? statusCode,
        bool? isSuccess,
        bool? hasExceptionError,
        dynamic validationErrors,
    }) = _LoginRequestModel;

    factory LoginRequestModel.fromJson(Map<String, dynamic> json) => _$LoginRequestModelFromJson(json);
}

@freezed
abstract class DataLogin with _$DataLogin {
    const factory DataLogin({
        String? accessToken,
        String? refreshToken,
        bool? emailConfirmed,
    }) = _DataLogin;

    factory DataLogin.fromJson(Map<String, dynamic> json) => _$DataLoginFromJson(json);
}

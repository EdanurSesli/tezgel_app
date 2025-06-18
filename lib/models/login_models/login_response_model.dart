import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'login_response_model.freezed.dart';
part 'login_response_model.g.dart';

@freezed
abstract class LoginResponseModel with _$LoginResponseModel {
    const factory LoginResponseModel({
        String? message,
        DataLogin? data,
        int? statusCode,
        bool? isSuccess,
        bool? hasExceptionError,
        dynamic validationErrors,
    }) = _LoginResponseModel;

    factory LoginResponseModel.fromJson(Map<String, dynamic> json) => _$LoginResponseModelFromJson(json);
}

@freezed
abstract class DataLogin with _$DataLogin {
    const factory DataLogin({
        String? accessToken,
        String? refreshToken,
        bool? emailConfirmed,
        String? role,
    }) = _DataLogin;

    factory DataLogin.fromJson(Map<String, dynamic> json) => _$DataLoginFromJson(json);
}

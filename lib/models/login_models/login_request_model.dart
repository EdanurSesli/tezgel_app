import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'login_request_model.freezed.dart';
part 'login_request_model.g.dart';

@freezed
abstract class LoginRequestModel with _$LoginRequestModel {
    const factory LoginRequestModel({
        String? username,
        String? password,
    }) = _LoginRequestModel;

    factory LoginRequestModel.fromJson(Map<String, dynamic> json) => _$LoginRequestModelFromJson(json);
}
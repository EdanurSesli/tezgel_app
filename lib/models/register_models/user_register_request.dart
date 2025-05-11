import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'user_register_request.freezed.dart';
part 'user_register_request.g.dart';

@freezed
abstract class UserRegisterRequest with _$UserRegisterRequest {
    const factory UserRegisterRequest({
        String? firstName,
        String? lastName,
        String? email,
        String? password,
        String? userName,
        String? address,
        String? longtitude,
        String? latitude,
        DateTime? birthDate,
    }) = _UserRegisterRequest;

    factory UserRegisterRequest.fromJson(Map<String, dynamic> json) => _$UserRegisterRequestFromJson(json);
}

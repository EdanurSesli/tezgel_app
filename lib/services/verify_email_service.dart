import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants.dart';
import '../models/register_models/base_register_response.dart';

class VerifyEmailService {
  Future<BaseRegisterResponse> sendCode(String token) async {
    final url = Uri.parse('${ApiConstants.baseUrl}/api/Auth/create-email-code');

    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = json.decode(response.body);
      return BaseRegisterResponse.fromJson(data);
    } else {
      throw Exception('Kod gönderme başarısız: ${response.statusCode} ${response.body}');
    }
  }

  Future<BaseRegisterResponse> verifyCode(String token, String code) async {
    final url = Uri.parse('${ApiConstants.baseUrl}/Auth/verify-email-code');

    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: json.encode({'code': code}),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = json.decode(response.body);
      return BaseRegisterResponse.fromJson(data);
    } else {
      throw Exception('Kod doğrulama başarısız: ${response.statusCode} ${response.body}');
    }
  }
}

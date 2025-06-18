import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/register_models/user_register_request.dart';
import '../models/register_models/base_register_response.dart';
import '../constants.dart';

class UserRegisterService {
  Future<BaseRegisterResponse> register(UserRegisterRequest request) async {
    try {
      final response = await http.post(
        Uri.parse('${ApiConstants.baseUrl}/api/Auth/register-customer'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(request.toJson()),
      );

      final responseData = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return BaseRegisterResponse.fromJson(responseData);
      }

      // Extract error message from response
      String errorMessage = 'Bir hata oluştu';
      if (responseData != null) {
        if (responseData is Map) {
          errorMessage = responseData['message'] ??
              responseData['error'] ??
              responseData['errors']?.toString() ??
              'Beklenmeyen bir hata oluştu';
          print(errorMessage);
        } else if (responseData is String) {
          errorMessage = responseData;
        }
      }
      throw Exception(errorMessage);
    } catch (e) {
      if (e is http.ClientException) {
        throw Exception('Bağlantı hatası: ${e.message}');
      }
      throw Exception(e.toString());
    }
  }
}

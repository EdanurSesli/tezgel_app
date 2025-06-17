import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tezgel_app/models/login_models/login_request_model.dart';
import 'package:tezgel_app/models/login_models/login_response_model.dart';
import '../constants.dart';
import 'storage_service.dart';

class LoginService {
  Future<LoginResponseModel> login(LoginRequestModel request) async {
    final url = Uri.parse('${ApiConstants.baseUrl}/Auth/login');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(request.toJson()),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = json.decode(response.body);
      final loginResponse = LoginResponseModel.fromJson(data);
      
      // Save token after successful login
      final accessToken = loginResponse.data?.accessToken;
      if (accessToken != null) {
        await StorageService.saveToken(accessToken);
      }
      
      return loginResponse;
    } else {
      throw Exception('Login başarısız: ${response.statusCode} ${response.body}');
    }
  }
}

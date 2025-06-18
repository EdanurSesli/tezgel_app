import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/register_models/business_register_request.dart';
import '../models/register_models/base_register_response.dart';
import '../constants.dart';

class BusinessRegisterService {
  Future<BaseRegisterResponse> businessregister(BusinessRegisterRequest request) async {
    final url = Uri.parse('${ApiConstants.baseUrl}/api/Auth/register-business');
    final requestBody = jsonEncode(request.toJson());
    print('Gönderilen request body: $requestBody'); // Burada yazdırdık

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          // Gerekirse ek header'lar buraya eklenebilir (ör: Authorization)
        },
        body: requestBody,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonData = jsonDecode(response.body);
        return BaseRegisterResponse.fromJson(jsonData);
      } else {
        print('Beklenmeyen durum kodu: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Beklenmeyen durum kodu: ${response.statusCode}');
      }
    } catch (e, stackTrace) {
      print('HTTP isteği sırasında hata oluştu: $e');
      print('Stack trace:\n$stackTrace');
      throw Exception('Kayıt isteği başarısız: $e');
    }
  }
}


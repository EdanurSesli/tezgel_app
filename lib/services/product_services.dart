import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tezgel_app/models/register_models/base_register_response.dart';
import '../constants.dart';

class ProductService {
  Future<BaseRegisterResponse> getProduct() async {
    final url = Uri.parse('${ApiConstants.baseUrl}/Auth/Product/available');

    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = json.decode(response.body);
      return BaseRegisterResponse.fromJson(data);
    } else {
      throw Exception('Ürün listeleme başarısız: ${response.statusCode} ${response.body}');
    }
  }
}

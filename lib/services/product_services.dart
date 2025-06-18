import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_models/product_model.dart';
import '../models/register_models/base_register_response.dart';
import '../models/product_models/product_request.dart';
import '../constants.dart';

class ProductService {
  Future<ProductResponse> getProduct(String token) async {
    final url = Uri.parse('${ApiConstants.baseUrl}/api/Product/available');

    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return ProductResponse.fromJson(data);
    } else {
      throw Exception('Ürün listeleme başarısız: ${response.statusCode} ${response.body}');
    }
  }

  Future<BaseRegisterResponse> createProduct(String token, ProductRequest request) async {
    final url = Uri.parse('${ApiConstants.baseUrl}/Business/create-product');
    
    // Debug için request body'i kontrol edelim
    final requestBody = request.toJson();
    print('Request Body: ${jsonEncode(requestBody)}');
    
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(requestBody),
    );

    print('Response Status: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      return BaseRegisterResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Ürün oluşturulamadı: ${response.body}');
    }
  }
}

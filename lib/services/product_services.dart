import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_models/product_model.dart';
import '../constants.dart';

class ProductService {
  Future<ProductResponse> getProduct(String token) async {
    final url = Uri.parse('${ApiConstants.baseUrl}/Product/available');

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
}

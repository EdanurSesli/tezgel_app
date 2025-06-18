import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tezgel_app/models/category/category_response.dart';
import '../constants.dart';
import 'storage_service.dart';

class CategoryService {
  Future<CategoryResponse> getCategories() async {
    final url = Uri.parse('${ApiConstants.baseUrl}/Product/category-list');
    final token = await StorageService.getToken();

    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return CategoryResponse.fromJson(data);
    } else {
      throw Exception('Kategoriler alınamadı: ${response.statusCode} ${response.body}');
    }
  }
}

 import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tezgel_app/models/product_models/all_product_response.dart';
import 'package:tezgel_app/models/product_models/product_repeat_model.dart';
import 'package:tezgel_app/models/reservation_models/reservation_complete.dart';
import 'package:tezgel_app/models/reservation_models/reservation_list_response.dart';
import '../models/product_models/product_model.dart';
import '../models/register_models/base_register_response.dart';
import '../models/product_models/product_request.dart';
import '../constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomerServices {
  Future<ReservationListResponse> getReservationList(String token) async {
    final url = Uri.parse('${ApiConstants.baseUrl}/Customer/reservation-list');

    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return ReservationListResponse.fromJson(data);
    } else {
      throw Exception('Ürün listeleme başarısız: ${response.statusCode} ${response.body}');
    }
  }

  Future<ProductResponse> getReservation(String token) async {
    final url = Uri.parse('${ApiConstants.baseUrl}/Customer/reservation');

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

  Future<BaseRegisterResponse> reservationComplete(
      String token, String latitude, String longitude) async {
    final url = Uri.parse(
        '${ApiConstants.baseUrl}/Customer/location-update?latitude=$latitude&&longitude=$longitude');

    final response = await http.put(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    print('Response Status: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      return BaseRegisterResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Ürün detayları getirilemedi: ${response.body}');
    }
  }

}
import 'package:tezgel_app/models/register_models/base_register_response.dart';
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


class BusinessServices {
Future<ReservationListResponse> getReservationList(String token) async {
    final url = Uri.parse('${ApiConstants.baseUrl}/Business/reservations-list');

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
}
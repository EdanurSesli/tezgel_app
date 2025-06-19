import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tezgel_app/models/product_models/all_product_response.dart';
import 'package:tezgel_app/models/product_models/product_repeat_model.dart';
import 'package:tezgel_app/models/reservation_models/reservation_complete.dart';
import 'package:tezgel_app/models/reservation_models/reservation_create_response.dart';
import '../models/product_models/product_model.dart';
import '../models/register_models/base_register_response.dart';
import '../models/product_models/product_request.dart';
import '../constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReservationServices {
  Future<ReservationCreateResponse> createReservation(
      String token, String productId) async {
    final url = Uri.parse(
        '${ApiConstants.baseUrl}/api/Reservation/create');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({'productId': productId}),
    );

    print('Response Status: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      return ReservationCreateResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Reservasyon oluşturulamadı: ${response.body}');
    }
  }

  Future<BaseRegisterResponse> statusReservation(String token, String reservationId) async {
    final url =
        Uri.parse('${ApiConstants.baseUrl}/api/Reservation/reservation-status?reservationId=$reservationId');

    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return BaseRegisterResponse.fromJson(data);
    } else {
      throw Exception(
          'Ürün listeleme başarısız: ${response.statusCode} ${response.body}');
    }
  }

  Future<BaseRegisterResponse> reservationComplete(
      String token, String productId, String businessQrid) async {
    final url = Uri.parse(
        '${ApiConstants.baseUrl}/api/Reservation/create?productId=$productId&&businessQrid=$businessQrid');

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

  Future<ReservationCreateResponse> completeReservation(
      String token, String productId, String busi) async {
    final url = Uri.parse(
        '${ApiConstants.baseUrl}/api/Reservation/complete');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({'productId': productId, 'businessQrid': 'businessQrid'}), // Example businessQrid
    );

    print('Response Status: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      return ReservationCreateResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Reservasyon oluşturulamadı: ${response.body}');
    }
  }

  
}

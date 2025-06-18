import 'package:tezgel_app/constants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tezgel_app/models/business_profile/business_profile_response.dart';

Future<BusinessProfileResponse> getBusinessDetail(String token) async {
    final url = Uri.parse('${ApiConstants.baseUrl}/Business/profile');
    
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    print('Response Status: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      return BusinessProfileResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Kullanıcı detayları getirilemedi: ${response.body}');
    }
  }

Future<BusinessProfileResponse> getCustomerDetail(String token) async {
    final url = Uri.parse('${ApiConstants.baseUrl}/Customer/profile');
    
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    print('Response Status: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      return BusinessProfileResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Kullanıcı detayları getirilemedi: ${response.body}');
    }
  }

Future<BusinessProfileResponse> getUserProfile(String token, String role) async {
  if (role.toLowerCase() == 'business') {
    return await getBusinessDetail(token);
  } else if (role.toLowerCase() == 'customer') {
    return await getCustomerDetail(token);
  } else {
    throw Exception('Geçersiz kullanıcı rolü');
  }
}
import 'package:tezgel_app/constants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tezgel_app/models/business_profile/business_profile_response.dart';
import 'package:tezgel_app/models/customer_models/customer_profie_response.dart';

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
    final parsed = BusinessProfileResponse.fromJson(jsonDecode(response.body));
    print(
        'Parsed BusinessData: ${parsed.data?.toJson()}'); // <-- DEBUG: Modeldeki tüm alanları göster
    return parsed;
  } else {
    throw Exception('Kullanıcı detayları getirilemedi: ${response.body}');
  }
}

Future<CustomerProfileResponse> getCustomerDetail(String token) async {
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
    return CustomerProfileResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Kullanıcı detayları getirilemedi: ${response.body}');
  }
}

// Business profilini güncelle
Future<BusinessProfileResponse> updateBusinessProfile(String token, Map<String, dynamic> updateData) async {
  final url = Uri.parse('${ApiConstants.baseUrl}/Business/update-profile');
  final response = await http.put(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(updateData),
  );

  print('PUT Business Response Status: ${response.statusCode}');
  print('PUT Business Response Body: ${response.body}');

  if (response.statusCode == 200 || response.statusCode == 201) {
    return BusinessProfileResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Business profil güncellenemedi: ${response.body}');
  }
}

// Customer profilini güncelle
Future<CustomerProfileResponse> updateCustomerProfile(String token, Map<String, dynamic> updateData) async {
  final url = Uri.parse('${ApiConstants.baseUrl}/Customer/update-profile');
  final response = await http.put(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(updateData),
  );

  print('PUT Customer Response Status: ${response.statusCode}');
  print('PUT Customer Response Body: ${response.body}');

  if (response.statusCode == 200 || response.statusCode == 201) {
    return CustomerProfileResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Customer profil güncellenemedi: ${response.body}');
  }
}

Future<dynamic> getUserProfile(String token, String role) async {
  if (role.toLowerCase() == 'business') {
    return await getBusinessDetail(token);
  } else if (role.toLowerCase() == 'customer') {
    return await getCustomerDetail(token);
  } else {
    throw Exception('Geçersiz kullanıcı rolü');
  }

  
}

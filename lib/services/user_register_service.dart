import 'package:dio/dio.dart';
import '../models/register_models/user_register_request.dart';
import '../models/register_models/user_register_response.dart';
import '../constants.dart';

class UserRegisterService {
  final Dio _dio;

  UserRegisterService({Dio? dio}) : _dio = dio ?? Dio();

  Future<UserRegisterResponse> register(UserRegisterRequest request) async {
    try {
      final response = await _dio.post(
        '${ApiConstants.baseUrl}/Auth/register-customer',
        data: request.toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return UserRegisterResponse.fromJson(response.data);
      } else {
        throw Exception('Beklenmeyen durum kodu: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Kayıt isteği başarısız: ${e.message}');
    }
  }
}

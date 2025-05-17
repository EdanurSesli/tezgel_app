import 'package:dio/dio.dart';
import 'package:tezgel_app/blocs/business_register/business_register_bloc.dart';
import 'package:tezgel_app/models/login_models/login_request_model.dart';
import 'package:tezgel_app/models/login_models/login_response_model.dart';
import 'package:tezgel_app/models/register_models/business_register_request.dart';
import '../models/register_models/user_register_request.dart';
import '../models/register_models/base_register_response.dart';
import '../constants.dart';

class LoginService {
  final Dio _dio;

  LoginService({Dio? dio}) : _dio = dio ?? Dio();

  Future<LoginResponseModel> login(LoginRequestModel request) async {
    try {
      final response = await _dio.post(
        '${ApiConstants.baseUrl}/Auth/login',
        data: request.toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return LoginResponseModel.fromJson(response.data);
      } else {
        throw Exception('Beklenmeyen durum kodu: ${response.statusCode}');
      }
    } on DioException catch (e) {
      print('DioException hatası: ${e.message}');  // Terminale yazdırma burada
      throw Exception('Kayıt isteği başarısız: ${e.message}');
    }
  }
}

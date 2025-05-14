import 'package:dio/dio.dart';
import 'package:tezgel_app/blocs/business_register/business_register_bloc.dart';
import 'package:tezgel_app/models/register_models/business_register_request.dart';
import '../models/register_models/user_register_request.dart';
import '../models/register_models/base_register_response.dart';
import '../constants.dart';

class BusinessRegisterService {
  final Dio _dio;

  BusinessRegisterService({Dio? dio}) : _dio = dio ?? Dio();

  Future<BaseRegisterResponse> businessregister(BusinessRegisterRequest request) async {
    try {
      final response = await _dio.post(
        '${ApiConstants.baseUrl}/Auth/register-business',
        data: request.toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return BaseRegisterResponse.fromJson(response.data);
      } else {
        throw Exception('Beklenmeyen durum kodu: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Kayıt isteği başarısız: ${e.message}');
    }
  }
}
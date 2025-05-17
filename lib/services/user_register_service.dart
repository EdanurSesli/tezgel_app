import 'package:dio/dio.dart';
import 'package:tezgel_app/blocs/business_register/business_register_bloc.dart';
import 'package:tezgel_app/models/register_models/business_register_request.dart';
import '../models/register_models/user_register_request.dart';
import '../models/register_models/base_register_response.dart';
import '../constants.dart';

class UserRegisterService {
  final Dio _dio;

  UserRegisterService({Dio? dio}) : _dio = dio ?? Dio() {
    // Dio ayarları burada yapılıyor
    _dio.options.followRedirects = true;
    _dio.options.validateStatus = (status) {
      return status != null && status < 500; // 3xx kodlarını hata sayma
    };
  }

  Future<BaseRegisterResponse> register(UserRegisterRequest request) async {
    try {
      final response = await _dio.post(
        '${ApiConstants.baseUrl}/Auth/register-customer',
        data: request.toJson(),
        options: Options(
          followRedirects: false, // önce yönlendirmeyi kapat
          validateStatus: (status) => status != null && status < 400,
        ),
      );

      if (response.statusCode == 301 || response.statusCode == 302) {
        final redirectUrl = response.headers.value('location');
        if (redirectUrl != null) {
          final redirectedResponse = await _dio.post(
            redirectUrl,
            data: request.toJson(),
          );
          if (redirectedResponse.statusCode == 200 ||
              redirectedResponse.statusCode == 201) {
            return BaseRegisterResponse.fromJson(redirectedResponse.data);
          }
        }
        throw Exception('Yönlendirme URL\'si bulunamadı');
      } else if (response.statusCode == 200 || response.statusCode == 201) {
        return BaseRegisterResponse.fromJson(response.data);
      } else {
        throw Exception('Beklenmeyen durum kodu: ${response.statusCode}');
      }
    } on DioException catch (e) {
      print(
          'DioException hatası: ${e.message}'); // Hata mesajını terminale yazdır
      throw Exception('Kayıt isteği başarısız: ${e.message}');
    }
  }
}

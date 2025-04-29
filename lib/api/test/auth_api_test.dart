import 'package:test/test.dart';
import 'package:api_client/api_client.dart';


/// tests for AuthApi
void main() {
  final instance = ApiClient().getAuthApi();

  group(AuthApi, () {
    //Future apiAuthCreateEmailCodePost({ String email }) async
    test('test apiAuthCreateEmailCodePost', () async {
      // TODO
    });

    //Future apiAuthLoginPost({ LoginRequest loginRequest }) async
    test('test apiAuthLoginPost', () async {
      // TODO
    });

    //Future apiAuthRefreshTokenPost({ RefreshTokenRequest refreshTokenRequest }) async
    test('test apiAuthRefreshTokenPost', () async {
      // TODO
    });

    //Future apiAuthRegisterBusinessPost({ BusinessRegisterRequest businessRegisterRequest }) async
    test('test apiAuthRegisterBusinessPost', () async {
      // TODO
    });

    //Future apiAuthRegisterCustomerPost({ CustomerRegisterRequest customerRegisterRequest }) async
    test('test apiAuthRegisterCustomerPost', () async {
      // TODO
    });

    //Future apiAuthSendTestMailPost() async
    test('test apiAuthSendTestMailPost', () async {
      // TODO
    });

    //Future apiAuthVerifyEmailCodePost({ VerifyEmailCodeRequest verifyEmailCodeRequest }) async
    test('test apiAuthVerifyEmailCodePost', () async {
      // TODO
    });

  });
}

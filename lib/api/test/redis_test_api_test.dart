import 'package:test/test.dart';
import 'package:api_client/api_client.dart';


/// tests for RedisTestApi
void main() {
  final instance = ApiClient().getRedisTestApi();

  group(RedisTestApi, () {
    //Future apiRedisTestGetGet({ String key }) async
    test('test apiRedisTestGetGet', () async {
      // TODO
    });

    //Future apiRedisTestSetPost({ String key, String value }) async
    test('test apiRedisTestSetPost', () async {
      // TODO
    });

  });
}

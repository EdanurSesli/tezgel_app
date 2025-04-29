# api_client.api.RedisTestApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiRedisTestGetGet**](RedisTestApi.md#apiredistestgetget) | **GET** /api/RedisTest/get | 
[**apiRedisTestSetPost**](RedisTestApi.md#apiredistestsetpost) | **POST** /api/RedisTest/set | 


# **apiRedisTestGetGet**
> apiRedisTestGetGet(key)



### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getRedisTestApi();
final String key = key_example; // String | 

try {
    api.apiRedisTestGetGet(key);
} catch on DioException (e) {
    print('Exception when calling RedisTestApi->apiRedisTestGetGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **key** | **String**|  | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiRedisTestSetPost**
> apiRedisTestSetPost(key, value)



### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getRedisTestApi();
final String key = key_example; // String | 
final String value = value_example; // String | 

try {
    api.apiRedisTestSetPost(key, value);
} catch on DioException (e) {
    print('Exception when calling RedisTestApi->apiRedisTestSetPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **key** | **String**|  | [optional] 
 **value** | **String**|  | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


# api_client.api.AuthApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiAuthCreateEmailCodePost**](AuthApi.md#apiauthcreateemailcodepost) | **POST** /api/Auth/create-email-code | 
[**apiAuthLoginPost**](AuthApi.md#apiauthloginpost) | **POST** /api/Auth/login | 
[**apiAuthRefreshTokenPost**](AuthApi.md#apiauthrefreshtokenpost) | **POST** /api/Auth/refresh-token | 
[**apiAuthRegisterBusinessPost**](AuthApi.md#apiauthregisterbusinesspost) | **POST** /api/Auth/register-business | 
[**apiAuthRegisterCustomerPost**](AuthApi.md#apiauthregistercustomerpost) | **POST** /api/Auth/register-customer | 
[**apiAuthSendTestMailPost**](AuthApi.md#apiauthsendtestmailpost) | **POST** /api/Auth/send-test-mail | 
[**apiAuthVerifyEmailCodePost**](AuthApi.md#apiauthverifyemailcodepost) | **POST** /api/Auth/verify-email-code | 


# **apiAuthCreateEmailCodePost**
> apiAuthCreateEmailCodePost(email)



### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getAuthApi();
final String email = email_example; // String | 

try {
    api.apiAuthCreateEmailCodePost(email);
} catch on DioException (e) {
    print('Exception when calling AuthApi->apiAuthCreateEmailCodePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email** | **String**|  | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiAuthLoginPost**
> apiAuthLoginPost(loginRequest)



### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getAuthApi();
final LoginRequest loginRequest = ; // LoginRequest | 

try {
    api.apiAuthLoginPost(loginRequest);
} catch on DioException (e) {
    print('Exception when calling AuthApi->apiAuthLoginPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **loginRequest** | [**LoginRequest**](LoginRequest.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiAuthRefreshTokenPost**
> apiAuthRefreshTokenPost(refreshTokenRequest)



### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getAuthApi();
final RefreshTokenRequest refreshTokenRequest = ; // RefreshTokenRequest | 

try {
    api.apiAuthRefreshTokenPost(refreshTokenRequest);
} catch on DioException (e) {
    print('Exception when calling AuthApi->apiAuthRefreshTokenPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **refreshTokenRequest** | [**RefreshTokenRequest**](RefreshTokenRequest.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiAuthRegisterBusinessPost**
> apiAuthRegisterBusinessPost(businessRegisterRequest)



### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getAuthApi();
final BusinessRegisterRequest businessRegisterRequest = ; // BusinessRegisterRequest | 

try {
    api.apiAuthRegisterBusinessPost(businessRegisterRequest);
} catch on DioException (e) {
    print('Exception when calling AuthApi->apiAuthRegisterBusinessPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **businessRegisterRequest** | [**BusinessRegisterRequest**](BusinessRegisterRequest.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiAuthRegisterCustomerPost**
> apiAuthRegisterCustomerPost(customerRegisterRequest)



### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getAuthApi();
final CustomerRegisterRequest customerRegisterRequest = ; // CustomerRegisterRequest | 

try {
    api.apiAuthRegisterCustomerPost(customerRegisterRequest);
} catch on DioException (e) {
    print('Exception when calling AuthApi->apiAuthRegisterCustomerPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **customerRegisterRequest** | [**CustomerRegisterRequest**](CustomerRegisterRequest.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiAuthSendTestMailPost**
> apiAuthSendTestMailPost()



### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getAuthApi();

try {
    api.apiAuthSendTestMailPost();
} catch on DioException (e) {
    print('Exception when calling AuthApi->apiAuthSendTestMailPost: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiAuthVerifyEmailCodePost**
> apiAuthVerifyEmailCodePost(verifyEmailCodeRequest)



### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getAuthApi();
final VerifyEmailCodeRequest verifyEmailCodeRequest = ; // VerifyEmailCodeRequest | 

try {
    api.apiAuthVerifyEmailCodePost(verifyEmailCodeRequest);
} catch on DioException (e) {
    print('Exception when calling AuthApi->apiAuthVerifyEmailCodePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **verifyEmailCodeRequest** | [**VerifyEmailCodeRequest**](VerifyEmailCodeRequest.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


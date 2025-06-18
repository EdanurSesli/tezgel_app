import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_response.freezed.dart';
part 'category_response.g.dart';

@freezed
abstract class CategoryResponse with _$CategoryResponse {
  const factory CategoryResponse({
    String? message,
    List<CategoryData>? data,
    int? statusCode,
    bool? isSuccess,
    bool? hasExceptionError,
    String? validationErrors,
  }) = _CategoryResponse;

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);
}

@freezed
abstract class CategoryData with _$CategoryData {
  const factory CategoryData({
    String? id,
    String? name,
    String? description,
  }) = _CategoryData;

  factory CategoryData.fromJson(Map<String, dynamic> json) =>
      _$CategoryDataFromJson(json);
}

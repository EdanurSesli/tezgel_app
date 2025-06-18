import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_product_response.freezed.dart';
part 'all_product_response.g.dart';

@freezed
abstract class AllProductResponse with _$AllProductResponse {
  const factory AllProductResponse({
    String? message,
    List<ProductData>? data,
    int? statusCode,
    bool? isSuccess,
    bool? hasExceptionError,
    String? validationErrors,
  }) = _ProductResponse;

  factory AllProductResponse.fromJson(Map<String, dynamic> json) =>
      _$AllProductResponseFromJson(json);
}

@freezed
abstract class ProductData with _$ProductData {
  const factory ProductData({
    String? id,
    String? name,
    String? description,
    double? originalPrice,
    double? discountedPrice,
    String? imagePath,
    String? categoryName,
    bool? isActive,
    bool? isReserved,
  }) = _ProductData;

  factory ProductData.fromJson(Map<String, dynamic> json) =>
      _$ProductDataFromJson(json);
}

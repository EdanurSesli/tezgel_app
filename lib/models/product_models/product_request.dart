import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_request.freezed.dart';
part 'product_request.g.dart';

@freezed
abstract class ProductRequest with _$ProductRequest {
  const factory ProductRequest({
    String? name,
    String? description,
    double? originalPrice,
    double? discountedPrice,
    String? categoryId,
    String? imagePath,
  }) = _ProductRequest;

  factory ProductRequest.fromJson(Map<String, dynamic> json) => _$ProductRequestFromJson(json);
}
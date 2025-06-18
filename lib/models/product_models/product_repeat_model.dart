class ProductRepeatModel {
  final String? productId;
  final int? originalPrice;
  final int? discountedPrice;

  ProductRepeatModel({
    this.productId,
    this.originalPrice,
    this.discountedPrice,
  });

  factory ProductRepeatModel.fromJson(Map<String, dynamic> json) {
    return ProductRepeatModel(
      productId: json['productId'],
      originalPrice: json['originalPrice'],
      discountedPrice: json['discountedPrice'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'originalPrice': originalPrice,
      'discountedPrice': discountedPrice,
    };
  }
}


class ProductRequest {
  final String name;
  final String description;
  final String categoryId;
  final String imagePath;
  final double originalPrice;
  final double discountedPrice;

  ProductRequest({
    required this.name,
    required this.description,
    required this.categoryId,
    required this.imagePath,
    required this.originalPrice,
    required this.discountedPrice,
  });

  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Description': description,
      'CategoryId': categoryId,
      'ImagePath': imagePath,
      'OriginalPrice': originalPrice,
      'DiscountedPrice': discountedPrice,
    };
  }
}
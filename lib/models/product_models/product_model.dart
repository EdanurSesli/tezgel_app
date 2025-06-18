class ProductResponse {
  final String message;
  final List<Product> data;
  final int statusCode;
  final bool isSuccess;
  final bool hasExceptionError;
  final dynamic validationErrors;

  ProductResponse({
    required this.message,
    required this.data,
    required this.statusCode,
    required this.isSuccess,
    required this.hasExceptionError,
    this.validationErrors,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      message: json['message'],
      data: (json['data'] as List).map((e) => Product.fromJson(e)).toList(),
      statusCode: json['statusCode'],
      isSuccess: json['isSuccess'],
      hasExceptionError: json['hasExceptionError'],
      validationErrors: json['validationErrors'],
    );
  }
}

class Product {
  final String id;
  final String name;
  final String description;
  final double originalPrice;
  final double discountedPrice;
  final String imagePath;
  final DateTime expireAt;
  final double latitude;
  final double longitude;
  final String categoryName;
  final bool isReserved;
  final double distanceInMeters;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.originalPrice,
    required this.discountedPrice,
    required this.imagePath,
    required this.expireAt,
    required this.latitude,
    required this.longitude,
    required this.categoryName,
    required this.isReserved,
    required this.distanceInMeters,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      originalPrice: json['originalPrice'].toDouble(),
      discountedPrice: json['discountedPrice'].toDouble(),
      imagePath: json['imagePath'],
      expireAt: DateTime.parse(json['expireAt']),
      latitude: json['latitude'].toDouble(),
      longitude: json['longitude'].toDouble(),
      categoryName: json['categoryName'],
      isReserved: json['isReserved'],
      distanceInMeters: json['distanceInMeters'].toDouble(),
    );
  }
}
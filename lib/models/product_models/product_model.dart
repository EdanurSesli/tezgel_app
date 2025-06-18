class ProductResponse {
  String? message;
  List<Product>? data;
  int? statusCode;
  bool? isSuccess;
  bool? hasExceptionError;
  String? validationErrors;

  ProductResponse({
    this.message,
    this.data,
    this.statusCode,
    this.isSuccess,
    this.hasExceptionError,
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
  String? id;
  String? name;
  String? description;
  double? originalPrice;
  double? discountedPrice;
  String? imagePath;
  String? expireAt;
  String? latitude;
  String? longitude;
  String? categoryName;
  bool? isReserved;
  String? distanceInMeters;

  Product({
    this.id,
    this.name,
    this.description,
    this.originalPrice,
    this.discountedPrice,
    this.imagePath,
    this.expireAt,
    this.latitude,
    this.longitude,
    this.categoryName,
    this.isReserved,
    this.distanceInMeters,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      originalPrice: json['originalPrice'].toDouble(),
      discountedPrice: json['discountedPrice'].toDouble(),
      imagePath: json['imagePath'],
      expireAt: json['expireAt'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      categoryName: json['categoryName'],
      isReserved: json['isReserved'],
      distanceInMeters: json['distanceInMeters'],
    );
  }
}

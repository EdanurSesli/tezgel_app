class ReservationListResponse {
  String? message;
  List<ReservationItem>? data;
  int? statusCode;
  bool? isSuccess;
  bool? hasExceptionError;
  List<String>? validationErrors;

  ReservationListResponse({
    this.message,
    this.data,
    this.statusCode,
    this.isSuccess,
    this.hasExceptionError,
    this.validationErrors,
  });

  factory ReservationListResponse.fromJson(Map<String, dynamic> json) {
    return ReservationListResponse(
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => ReservationItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      statusCode: json['statusCode'] as int,
      isSuccess: json['isSuccess'] as bool,
      hasExceptionError: json['hasExceptionError'] as bool,
      validationErrors: json['validationErrors'] != null
          ? List<String>.from(json['validationErrors'] as List<dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'data': data!.map((e) => e.toJson()).toList(),
      'statusCode': statusCode,
      'isSuccess': isSuccess,
      'hasExceptionError': hasExceptionError,
      'validationErrors': validationErrors,
    };
  }
}

class ReservationItem {
  String? id;
  String? companyName;
  String? closingTime;
  String? productId;
  String? productName;
  DateTime? createdDate;
  DateTime? expireAt;
  double? latitude;
  double? longitude;
  String? status;
  String? imagePath;
  double? originalPrice;
  double? discountedPrice;

  ReservationItem({
    this.id,
    this.companyName,
    this.closingTime,
    this.productId,
    this.productName,
    this.createdDate,
    this.expireAt,
    this.latitude,
    this.longitude,
    this.status,
    this.imagePath,
    this.originalPrice,
    this.discountedPrice,
  });

  factory ReservationItem.fromJson(Map<String, dynamic> json) {
    return ReservationItem(
      id: json['id']?.toString(),
      companyName: json['companyName']?.toString(),
      closingTime: json['closingTime']?.toString(),
      productId: json['productId']?.toString(),
      productName: json['productName']?.toString(),
      createdDate: json['createdDate'] != null ? DateTime.tryParse(json['createdDate'].toString()) : null,
      expireAt: json['expireAt'] != null ? DateTime.tryParse(json['expireAt'].toString()) : null,
      latitude: json['latitude'] != null ? (json['latitude'] as num).toDouble() : null,
      longitude: json['longitude'] != null ? (json['longitude'] as num).toDouble() : null,
      status: json['status']?.toString(),
      imagePath: json['imagePath']?.toString(),
      originalPrice: json['originalPrice'] != null ? (json['originalPrice'] as num).toDouble() : null,
      discountedPrice: json['discountedPrice'] != null ? (json['discountedPrice'] as num).toDouble() : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'companyName': companyName,
      'closingTime': closingTime,
      'productId': productId,
      'productName': productName,
      'createdDate': createdDate?.toIso8601String(),
      'expireAt': expireAt?.toIso8601String(),
      'latitude': latitude,
      'longitude': longitude,
      'status': status,
      'imagePath': imagePath,
      'originalPrice': originalPrice,
      'discountedPrice': discountedPrice,
    };
  }
}

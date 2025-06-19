class ReservationCreateResponse {
  String? message;
  ReservationData? data;
  int? statusCode;
  bool? isSuccess;
  bool? hasExceptionError;
  List<String>? validationErrors;

  ReservationCreateResponse({
    this.message,
    this.data,
    this.statusCode,
    this.isSuccess,
    this.hasExceptionError,
    this.validationErrors,
  });

  factory ReservationCreateResponse.fromJson(Map<String, dynamic> json) {
    return ReservationCreateResponse(
      message: json['message'] as String,
      data: ReservationData.fromJson(json['data'] as Map<String, dynamic>),
      statusCode: json['statusCode'] as int,
      isSuccess: json['isSuccess'] as bool,
      hasExceptionError: json['hasExceptionError'] as bool,
      validationErrors: json['validationErrors'] != null
          ? List<String>.from(json['validationErrors'] as List)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'data': data!.toJson(),
      'statusCode': statusCode,
      'isSuccess': isSuccess,
      'hasExceptionError': hasExceptionError,
      'validationErrors': validationErrors,
    };
  }
}

class ReservationData {
  final String reservationId;

  ReservationData({required this.reservationId});

  factory ReservationData.fromJson(Map<String, dynamic> json) {
    return ReservationData(
      reservationId: json['reservationId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'reservationId': reservationId,
    };
  }
}

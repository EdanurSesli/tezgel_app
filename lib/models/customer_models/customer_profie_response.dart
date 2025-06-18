class CustomerProfileResponse {
  final String? message;
  final CustomerData? data;
  final int? statusCode;
  final bool? isSuccess;
  final bool? hasExceptionError;
  final String? validationErrors;

  CustomerProfileResponse({
    this.message,
    this.data,
    this.statusCode,
    this.isSuccess,
    this.hasExceptionError,
    this.validationErrors,
  });

  factory CustomerProfileResponse.fromJson(Map<String, dynamic> json) {
    return CustomerProfileResponse(
      message: json['message'],
      data: json['data'] != null ? CustomerData.fromJson(json['data']) : null,
      statusCode: json['statusCode'],
      isSuccess: json['isSuccess'],
      hasExceptionError: json['hasExceptionError'],
      validationErrors: json['validationErrors'] ,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'data': data?.toJson(),
      'statusCode': statusCode,
      'isSuccess': isSuccess,
      'hasExceptionError': hasExceptionError,
      'validationErrors': validationErrors,
    };
  }
}

class CustomerData {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? address;
  final DateTime? birthDate;

  CustomerData({
    this.firstName,
    this.lastName,
    this.email,
    this.address,
    this.birthDate,
  });

  factory CustomerData.fromJson(Map<String, dynamic> json) {
    return CustomerData(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      address: json['address'],
      birthDate: json['birthDate'] != null ? DateTime.tryParse(json['birthDate']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'address': address,
      'birthDate': birthDate?.toIso8601String(),
    };
  }
}

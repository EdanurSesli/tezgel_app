class BusinessProfileResponse {
  final String? message;
  final BusinessData? data;
  final int? statusCode;
  final bool? isSuccess;
  final bool? hasExceptionError;
  final List<String>? validationErrors;

  BusinessProfileResponse({
    this.message,
    this.data,
    this.statusCode,
    this.isSuccess,
    this.hasExceptionError,
    this.validationErrors,
  });

  factory BusinessProfileResponse.fromJson(Map<String, dynamic> json) {
    return BusinessProfileResponse(
      message: json['message'],
      data: json['data'] != null ? BusinessData.fromJson(json['data']) : null,
      statusCode: json['statusCode'],
      isSuccess: json['isSuccess'],
      hasExceptionError: json['hasExceptionError'],
      validationErrors: (json['validationErrors'] as List?)?.map((e) => e.toString()).toList(),
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

class BusinessData {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? companyName;
  final String? companyType;
  final String? closingTime;

  BusinessData({
    this.firstName,
    this.lastName,
    this.email,
    this.companyName,
    this.companyType,
    this.closingTime,
  });

  factory BusinessData.fromJson(Map<String, dynamic> json) {
    return BusinessData(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      companyName: json['companyName'],
      companyType: json['companyType'],
      closingTime: json['closingTime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'companyName': companyName,
      'companyType': companyType,
      'closingTime': closingTime,
    };
  }
}

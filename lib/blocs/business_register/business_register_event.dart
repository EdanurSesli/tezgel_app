import 'package:equatable/equatable.dart';

abstract class BusinessRegisterEvent extends Equatable {
  const BusinessRegisterEvent();

  @override
  List<Object?> get props => [];
}

class BusinessRegisterSubmitted extends BusinessRegisterEvent {
  final String marketName;
  final String companyType;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String password;
  final double latitude;
  final double longitude;

  const BusinessRegisterSubmitted({
    required this.marketName,
    required this.companyType,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.password,
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object?> get props => [
        marketName,
        companyType,
        firstName,
        lastName,
        username,
        email,
        password,
        latitude,
        longitude,
      ];
}
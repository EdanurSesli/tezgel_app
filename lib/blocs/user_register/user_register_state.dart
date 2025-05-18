import 'package:equatable/equatable.dart';
import '../../models/register_models/base_register_response.dart';

abstract class UserRegisterState extends Equatable {
  const UserRegisterState();

  @override
  List<Object?> get props => [];
}

class UserRegisterInitial extends UserRegisterState {}

class UserRegisterLoading extends UserRegisterState {}

class UserRegisterSuccess extends UserRegisterState {
  final BaseRegisterResponse response;

  const UserRegisterSuccess(this.response);

  @override
  List<Object?> get props => [response];
}

class UserRegisterFailure extends UserRegisterState {
  final String error;

  const UserRegisterFailure(this.error);

  @override
  List<Object?> get props => [error];
}

class UserRegisterValidationError extends UserRegisterState {
  final Map<String, String> errors;

  const UserRegisterValidationError(this.errors);

  @override
  List<Object?> get props => [errors];
}

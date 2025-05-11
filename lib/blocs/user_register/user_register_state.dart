import 'package:equatable/equatable.dart';
import '../../models/user_register_response.dart';

abstract class UserRegisterState extends Equatable {
  const UserRegisterState();

  @override
  List<Object?> get props => [];
}

class UserRegisterInitial extends UserRegisterState {}

class UserRegisterLoading extends UserRegisterState {}

class UserRegisterSuccess extends UserRegisterState {
  final UserRegisterResponse response;

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

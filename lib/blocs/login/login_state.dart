import 'package:equatable/equatable.dart';
import 'package:tezgel_app/models/login_models/login_response_model.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginResponseModel loginResponse;  // This is likely the current property name

  const LoginSuccess(this.loginResponse);
}

class LoginFailure extends LoginState {
  final String error;

  const LoginFailure({required this.error});

  @override
  List<Object> get props => [error];
}

import 'package:equatable/equatable.dart';

abstract class BusinessRegisterState extends Equatable {
  const BusinessRegisterState();

  @override
  List<Object?> get props => [];
}

class BusinessRegisterInitial extends BusinessRegisterState {}

class BusinessRegisterLoading extends BusinessRegisterState {}

class BusinessRegisterSuccess extends BusinessRegisterState {}

class BusinessRegisterFailure extends BusinessRegisterState {
  final String error;

  const BusinessRegisterFailure(this.error);

  @override
  List<Object?> get props => [error];
}

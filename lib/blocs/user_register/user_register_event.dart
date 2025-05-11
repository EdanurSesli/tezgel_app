import 'package:equatable/equatable.dart';
import '../../models/register_models/user_register_request.dart';

abstract class UserRegisterEvent extends Equatable {
  const UserRegisterEvent();

  @override
  List<Object?> get props => [];
}

class UserRegisterSubmitted extends UserRegisterEvent {
  final UserRegisterRequest request;

  const UserRegisterSubmitted(this.request);

  @override
  List<Object?> get props => [request];
}

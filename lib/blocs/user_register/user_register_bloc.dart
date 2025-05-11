import 'package:flutter_bloc/flutter_bloc.dart';
import 'user_register_event.dart';
import 'user_register_state.dart';
import '../../services/user_register_service.dart';

class UserRegisterBloc extends Bloc<UserRegisterEvent, UserRegisterState> {
  final UserRegisterService _service;

  UserRegisterBloc({UserRegisterService? service})
      : _service = service ?? UserRegisterService(),
        super(UserRegisterInitial()) {
    on<UserRegisterSubmitted>(_onSubmitted);
  }

  Future<void> _onSubmitted(
    UserRegisterSubmitted event,
    Emitter<UserRegisterState> emit,
  ) async {
    emit(UserRegisterLoading());
    try {
      final response = await _service.register(event.request);
      emit(UserRegisterSuccess(response));
    } catch (e) {
      emit(UserRegisterFailure(e.toString()));
    }
  }
}

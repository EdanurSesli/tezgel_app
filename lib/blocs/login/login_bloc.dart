import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

  void _onLoginButtonPressed(
      LoginButtonPressed event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    try {
      // Burada backend API çağrısı yapılmalı.
      await Future.delayed(const Duration(seconds: 2));

      // Başarı durumu simülasyonu
      if (event.email == "edanur" && event.password == "123") {
        emit(LoginSuccess());
      } else {
        emit(const LoginFailure(error: "Geçersiz e-posta veya şifre"));
      }
    } catch (error) {
      emit(LoginFailure(error: error.toString()));
    }
  }
}

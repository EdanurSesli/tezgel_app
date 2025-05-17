import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';
import '../../services/login_service.dart';       // LoginService yolu projenize göre
import '../../models/login_models/login_request_model.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginService loginService;

  LoginBloc({required this.loginService}) : super(LoginInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

  void _onLoginButtonPressed(
      LoginButtonPressed event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    try {
      final request = LoginRequestModel(
        username: event.email,
        password: event.password,
      );

      final response = await loginService.login(request);

      // Burada backend'den dönen response yapısına göre kontrol yap
      // Örnek: token var mı, login başarılı mı vs.

      if (response.data!.accessToken != null && response.data!.accessToken!.isNotEmpty) {
        emit(LoginSuccess());
      } else {
        emit(const LoginFailure(error: "Geçersiz kullanıcı adı veya şifre"));
      }
    } catch (error) {
      emit(LoginFailure(error: error.toString()));
    }
  }
}

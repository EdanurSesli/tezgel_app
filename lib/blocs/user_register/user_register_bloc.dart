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
      // Validation errors map
      final Map<String, String> validationErrors = {};

      // Check required fields
      if (event.request.firstName?.isEmpty ?? true) {
        validationErrors['firstName'] = 'Ad alanı zorunludur';
      }
      if (event.request.lastName?.isEmpty ?? true) {
        validationErrors['lastName'] = 'Soyad alanı zorunludur';
      }
      if (event.request.userName?.isEmpty ?? true) {
        validationErrors['userName'] = 'Kullanıcı adı zorunludur';
      }
      if (event.request.email?.isEmpty ?? true) {
        validationErrors['email'] = 'E-posta alanı zorunludur';
      } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(event.request.email!)) {
        validationErrors['email'] = 'Geçerli bir e-posta adresi giriniz';
      }
      if (event.request.password?.isEmpty ?? true) {
        validationErrors['password'] = 'Şifre alanı zorunludur';
      } else if ((event.request.password?.length ?? 0) < 6) {
        validationErrors['password'] = 'Şifre en az 6 karakter olmalıdır';
      }
      if (event.request.birthDate == null) {
        validationErrors['birthDate'] = 'Doğum tarihi zorunludur';
      }
      if (event.request.address?.isEmpty ?? true) {
        validationErrors['address'] = 'Adres alanı zorunludur';
      }
      if (event.request.latitude == null || event.request.longitude == null) {
        validationErrors['location'] = 'Konum seçimi zorunludur';
      }

      // If there are validation errors, emit them
      if (validationErrors.isNotEmpty) {
        emit(UserRegisterValidationError(validationErrors));
        return;
      }

      // If validation passes, proceed with registration
      final response = await _service.register(event.request);
      emit(UserRegisterSuccess(response));
    } catch (e) {
      emit(UserRegisterFailure(e.toString()));
    }
  }
}

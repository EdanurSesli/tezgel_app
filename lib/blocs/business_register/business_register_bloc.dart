import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tezgel_app/models/register_models/business_register_request.dart';
import 'package:tezgel_app/services/business_register_service.dart';
import 'business_register_event.dart';
import 'business_register_state.dart';

class BusinessRegisterBloc extends Bloc<BusinessRegisterEvent, BusinessRegisterState> {
  final BusinessRegisterService _service;

  BusinessRegisterBloc({BusinessRegisterService? service})
      : _service = service ?? BusinessRegisterService(),
        super(BusinessRegisterInitial()) {
    on<BusinessRegisterSubmitted>(_onSubmitted);
  }

  Future<void> _onSubmitted(
    BusinessRegisterSubmitted event,
    Emitter<BusinessRegisterState> emit,
  ) async {
    emit(BusinessRegisterLoading());
    try {
      final request = BusinessRegisterRequest(
        firstName: event.firstName,
        lastName: event.lastName,
        email: event.email,
        password: event.password,
        userName: event.username,
        latitude: event.latitude,
        longitude: event.longitude,
        closingTime: event.closingTime,  // string olarak direkt gönder
        companyName: event.marketName,
        companyType: event.companyType,
      );

      final response = await _service.businessregister(request);

      if (response.isSuccess == true) {
        emit(BusinessRegisterSuccess());
      } else {
        emit(BusinessRegisterFailure(response.message ?? "Kayıt başarısız"));
      }
    } catch (e) {
      emit(BusinessRegisterFailure(e.toString()));
    }
  }
}

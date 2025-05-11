import 'package:flutter_bloc/flutter_bloc.dart';
import 'business_register_event.dart';
import 'business_register_state.dart';

class BusinessRegisterBloc extends Bloc<BusinessRegisterEvent, BusinessRegisterState> {
  BusinessRegisterBloc() : super(BusinessRegisterInitial()) {
    on<BusinessRegisterSubmitted>(_onSubmitted);
  }

  Future<void> _onSubmitted(BusinessRegisterSubmitted event, Emitter<BusinessRegisterState> emit) async {
    emit(BusinessRegisterLoading());
    try {
      await Future.delayed(const Duration(seconds: 2));

      emit(BusinessRegisterSuccess());
    } catch (e) {
      emit(BusinessRegisterFailure(e.toString()));
    }
  }
}

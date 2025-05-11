import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<LoadHomeData>(_onLoadHomeData);
  }

  Future<void> _onLoadHomeData(
      LoadHomeData event, Emitter<HomeState> emit) async {
    emit(HomeLoading());

    try {
      await Future.delayed(const Duration(seconds: 2));

      emit(const HomeLoaded(
        productName: 'Ekmek',
        productLocation: 'Bakırköy/İstanbul',
        productCategory: 'Unlu Mamüller',
        productTime: '1 saat önce',
        businessName: 'Kardeşler Fırın',
        oldPrice: 30.00,
        newPrice: 20.00,
        description:
            "We are looking for an experienced mobile app developer to create a cutting-edge iOS and Android applications for our startup.",
        imagePath: 'assets/ekmek.jpeg',
      ));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}

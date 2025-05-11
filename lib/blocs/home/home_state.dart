import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final String productName;
  final String productLocation;
  final String productCategory;
  final String productTime;
  final String businessName;
  final double oldPrice;
  final double newPrice;
  final String description;
  final String imagePath;

  const HomeLoaded({
    required this.productName,
    required this.productLocation,
    required this.productCategory,
    required this.productTime,
    required this.businessName,
    required this.oldPrice,
    required this.newPrice,
    required this.description,
    required this.imagePath,
  });

  @override
  List<Object?> get props => [
        productName,
        productLocation,
        productCategory,
        productTime,
        businessName,
        oldPrice,
        newPrice,
        description,
        imagePath,
      ];
}

class HomeError extends HomeState {
  final String error;

  const HomeError(this.error);

  @override
  List<Object?> get props => [error];
}

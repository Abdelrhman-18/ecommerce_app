part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

// i deleted the favorites list from here

final class HomeSuccess extends HomeState {
  final List<ProductModel> products;
// final List<ProductModel> favorites;

  HomeSuccess({required this.products,
  // required this.favorites
  });
}

final class HomeError extends HomeState {
  final String errorMessage;

  HomeError({required this.errorMessage});
}


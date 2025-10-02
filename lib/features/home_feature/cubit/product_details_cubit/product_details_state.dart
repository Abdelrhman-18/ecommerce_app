part of 'product_details_cubit.dart';

sealed class ProductDetailsState {}

final class ProductDetailsInitial extends ProductDetailsState {}

final class ProductDetailsLoading extends ProductDetailsState {}

final class ProductDetailsLoaded extends ProductDetailsState {
  final ProductModel product;

  ProductDetailsLoaded({required this.product});
}

final class ProductQuantityUpdated extends ProductDetailsState {
  final int quantity;

  ProductQuantityUpdated({required this.quantity});
}

final class ProductSizeUpdated extends ProductDetailsState {
  final ProductSize size;

  ProductSizeUpdated({required this.size});
}

final class ProductAddToCart extends ProductDetailsState {
  final String productId;

  ProductAddToCart({required this.productId});
}

final class ProductAddingToCart extends ProductDetailsState {}

final class ProductDetailsError extends ProductDetailsState {
  final String message;

  ProductDetailsError({required this.message});
}

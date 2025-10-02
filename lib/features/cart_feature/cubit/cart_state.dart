part of 'cart_cubit.dart';

sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartLoaded extends CartState {
  final List<AddToCartModel> cartItems;
  final double subTotal;
  final bool flag;

  CartLoaded({
    required this.cartItems,
    required this.subTotal,
    this.flag = false,
  });

  CartLoaded copyWith({
    List<AddToCartModel>? cartItems,
    double? subTotal,
    bool? flag,
  }) {
    return CartLoaded(
      cartItems: cartItems ?? this.cartItems,
      subTotal: subTotal ?? this.subTotal,
      flag: flag ?? this.flag,
    );
  }
}

final class CartError extends CartState {
  final String error;

  CartError(this.error);
}

final class CartQuantityUpdatedState extends CartState {
  final int quantity;
  final String productId;

  CartQuantityUpdatedState({required this.quantity, required this.productId});
}

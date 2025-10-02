import 'package:ecommerce_app/features/cart_feature/model/add_to_cart_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  int quantity = 1;
  bool flag = false;

  void getCartItems() {
    emit(CartLoading());
    _emitUpdatedState();
  }

  void incrementQuantity(String productId, [int? initialValue]) {
    if (initialValue != null) {
      quantity = initialValue;
    }
    quantity++;

    final index =
    dummyCart.indexWhere((element) => element.productId == productId);
    dummyCart[index] =
        dummyCart[index].copyWith(quantity: quantity);

    emit(CartQuantityUpdatedState(quantity: quantity, productId: productId));
    _emitUpdatedState();
  }

  void decrementQuantity(String productId, [int? initialValue]) {
    if (initialValue != null) {
      quantity = initialValue;
    }
    quantity--;

    final index =
    dummyCart.indexWhere((element) => element.productId == productId);
    dummyCart[index] =
        dummyCart[index].copyWith(quantity: quantity);

    emit(CartQuantityUpdatedState(quantity: quantity, productId: productId));
    _emitUpdatedState();
  }

  void toggleCheckBox(bool value) {
    flag = value;
    _emitUpdatedState();
  }
  void _emitUpdatedState() {
    emit(CartLoaded(
      cartItems: List.from(dummyCart),
      subTotal: _subTotal,
      flag: flag,
    ));
  }

  double get _subTotal => dummyCart.fold<double>(
    0,
        (previousValue, element) =>
    previousValue + element.price * element.quantity,
  );
}
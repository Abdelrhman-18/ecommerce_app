// import 'package:ecommerce_app/features/home_feature/model/add_to_cart_model.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// part 'cart_state.dart';
//
// class CartCubit extends Cubit<CartState> {
//   CartCubit() : super(CartInitial());
//
//   int quantity = 1;
//   bool flag = false;
//
//   void getCartItems() {
//     emit(CartLoading());
//     emit(CartLoaded(dummyCart, _subTotal));
//   }
//
//   void incrementQuantity(String productId, [int? initialValue]) {
//     if (initialValue != null) {
//       quantity = initialValue;
//     }
//     quantity++;
//
//     final index =
//     dummyCart.indexWhere((element) => element.productId == productId);
//     dummyCart[index] =
//         dummyCart[index].copyWith(quantity: quantity);
//
//     emit(CartQuantityUpdated(quantity: quantity, productId: productId));
//     emit(CartLoaded(dummyCart, _subTotal));
//   }
//
//   void decrementQuantity(String productId, [int? initialValue]) {
//     if (initialValue != null) {
//       quantity = initialValue;
//     }
//
//     final index =
//     dummyCart.indexWhere((element) => element.productId == productId);
//     dummyCart[index] =
//         dummyCart[index].copyWith(quantity: quantity);
//     quantity--;
//
//     emit(CartQuantityUpdated(quantity: quantity, productId: productId));
//     emit(CartLoaded(dummyCart, _subTotal));
//   }
//
//   void checkBox(bool flag) {
//     emit(CheckBox(!flag));
//   }
//
//   double get _subTotal => dummyCart.fold<double>(
//     0,
//         (previousValue, element) =>
//     previousValue + element.price * element.quantity,
//   );
// }  ركز معايا ف الكود دا شويه
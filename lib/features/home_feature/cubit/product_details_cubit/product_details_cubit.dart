import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/cart_feature/model/add_to_cart_model.dart';
import 'package:ecommerce_app/features/home_feature/model/product_model.dart';
import 'package:ecommerce_app/features/home_feature/repository/product_repository.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  // final products = ProductRepository.getProducts();
  final products = ProductRepository.getProducts;
  int quantity = 1;
  ProductSize? size;

  // ✅ Get Product Details
  void getProductDetails(String productId) async {
    emit(ProductDetailsLoading());
    try {
      final selectedProduct = products.firstWhere(
        (item) => item.id == productId,
        orElse: () => throw Exception("Product not found"),
      );

      await Future.delayed(const Duration(seconds: 1));

      emit(ProductDetailsLoaded(product: selectedProduct));
    } catch (e) {
      emit(ProductDetailsError(message: e.toString()));
    }
  }

  // ✅ Add To Cart
  void addToCart(String productId) async {
    emit(ProductAddingToCart());
    final cartItem = AddToCartModel(
      name: products.firstWhere((item) => item.id == productId).name,
      imageUrl: products.firstWhere((item) => item.id == productId).imageUrl,
      price: products.firstWhere((item) => item.id == productId).price,
      productId: productId,
      size: size!,
      quantity: quantity,
    );
    dummyCart.add(cartItem);
    await Future.delayed(const Duration(seconds: 1));
    emit(ProductAddToCart(productId: productId));
  }

  // ✅ Select Size
  void selectSize(ProductSize selectedSize) {
    size = selectedSize;
    emit(ProductSizeUpdated(size: selectedSize));
  }

  // ✅ Increment Quantity
  void incrementQuantity(String productId, [int? initialValue]) {
    if (initialValue != null) {
      quantity = initialValue;
    }

    quantity++;

    emit(ProductQuantityUpdated(quantity: quantity));
  }

  // ✅ Decrement Quantity
  void decrementQuantity(String productId, [int? initialValue]) {
    if (initialValue != null) {
      quantity = initialValue;
    }

    quantity--;

    emit(ProductQuantityUpdated(quantity: quantity));
  }
}

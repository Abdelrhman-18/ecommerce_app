import 'package:ecommerce_app/features/favorite_feature/screens/favorite_screen.dart';
import 'package:ecommerce_app/features/home_feature/repository/product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/features/home_feature/model/product_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final products = ProductRepository.getProducts();
  List<ProductModel> getFavoriteProducts = [];

  void getHomeData() async {
    emit(HomeLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      if (products.isNotEmpty) {
        emit(HomeSuccess(
          products: products,
          favorites: getFavoriteProducts,
        ));
      } else {
        emit(HomeError(errorMessage: "No products found"));
      }
    } catch (e) {
      emit(HomeError(errorMessage: e.toString()));
    }
  }

  void toggleFavorite(ProductModel productItem) {
    final index = products.indexWhere((item) => item.id == productItem.id);

    if (index != -1) {
      final updatedProduct = productItem.copyWith(
        isFavorite: !productItem.isFavorite,
      );

      products[index] = updatedProduct;

      if (updatedProduct.isFavorite) {
        getFavoriteProducts.add(updatedProduct);
      } else {
        getFavoriteProducts.removeWhere((item) => item.id == updatedProduct.id);
      }

      emit(HomeSuccess(
        products: List.from(products),
        favorites: List.from(getFavoriteProducts),
      ));
    }
  }
  List<ProductModel> get getFavoriteProductsList => getFavoriteProducts;
}

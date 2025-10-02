import 'dart:developer';

import 'package:ecommerce_app/features/home_feature/repository/product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/features/home_feature/model/product_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  // final products = ProductRepository.getProducts();
  // List<ProductModel> getFavoriteProducts = [];

  final products = ProductRepository.getProducts;

  void getHomeData() async {
    emit(HomeLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      if (products.isNotEmpty) {
        emit(HomeSuccess(
          products: products,
        ));
      } else {
        emit(HomeError(errorMessage: "No products found"));
      }
    } catch (e) {
      emit(HomeError(errorMessage: e.toString()));
    }
  }

  // void toggleFavorite(ProductModel productItem) {
  //   final index = products.indexWhere((item) => item.id == productItem.id);

  //   if (index != -1) {
  //     final updatedProduct = productItem.copyWith(
  //       isFavorite: !productItem.isFavorite,
  //     );

  //     products[index] = updatedProduct;

  //     if (updatedProduct.isFavorite) {
  //       getFavoriteProducts.add(updatedProduct);
  //     } else {
  //       getFavoriteProducts.removeWhere((item) => item.id == updatedProduct.id);
  //     }

  //     emit(HomeSuccess(
  //       products: List.from(products),
  //       favorites: List.from(getFavoriteProducts),
  //     ));
  //   }
  // }
    void toggleFavorite(ProductModel productItem) {
    final index = products.indexWhere((item) => item.id == productItem.id);
    if (index == -1) return;

    products[index] = products[index].copyWith(
      isFavorite: !products[index].isFavorite,
    );
    log("favorite products length: ${products.where((item) => item.isFavorite).length}");

    emit(HomeSuccess(products: List<ProductModel>.from(products)));
  }
}

import 'package:ecommerce_app/features/home_feature/repository/product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/features/home_feature/model/product_model.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void getHomeData() async {
    emit(HomeLoading());
    try {
      final products = ProductRepository.getProducts();
      await Future.delayed(const Duration(seconds: 1));
      if (products.isNotEmpty) {
        emit(HomeSuccess(products: products));
      } else {
        emit(HomeError(errorMessage: "No products found"));
      }
    } catch (e) {
      emit(HomeError(errorMessage: e.toString()));
    }
  }
}

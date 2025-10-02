import 'package:ecommerce_app/features/bottom_nav/screens/bottom_nav.dart';
import 'package:ecommerce_app/features/cart_feature/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/cart_feature/model/add_to_cart_model.dart';
import 'package:ecommerce_app/features/cart_feature/screens/cart_screen.dart';
import 'package:ecommerce_app/features/cart_feature/screens/checkout_screen.dart';
import 'package:ecommerce_app/features/favorite_feature/screens/favorite_screen.dart';
import 'package:ecommerce_app/features/home_feature/cubit/product_details_cubit/product_details_cubit.dart';
import 'package:ecommerce_app/features/home_feature/screens/home_screen.dart';
import 'package:ecommerce_app/features/home_feature/screens/product_details_page.dart';
import 'package:ecommerce_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RoutesGenerator {
  static GoRouter mainRouting = GoRouter(
    initialLocation: AppRouter.bottomNav,
    routes: [
      GoRoute(
        name: AppRouter.home,
        path: AppRouter.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        name: AppRouter.bottomNav,
        path: AppRouter.bottomNav,
        builder: (context, state) => const BottomNav(),
      ),
      GoRoute(
        name: AppRouter.favorite,
        path: AppRouter.favorite,
        builder: (context, state) => const FavoriteScreen(),
      ),
      GoRoute(
        name: AppRouter.detailsPage,
        path: AppRouter.detailsPage,
        pageBuilder: (context, state) {
          final productId = state.extra as String;
          return MaterialPage(
            child: BlocProvider(
              create: (context) =>
              ProductDetailsCubit()..getProductDetails(productId),
              child: ProductDetailsPage(productId: productId),
            ),
          );
        },
      ),
      GoRoute(
        name: AppRouter.cart,
        path: AppRouter.cart,
        pageBuilder: (context, state) {
          return MaterialPage(
            child: BlocProvider(
              create: (context) => CartCubit()..getCartItems(),
              child: const CartScreen(),
            ),
          );
        },
      ),
      GoRoute(
        name: AppRouter.checkoutPage,
        path: AppRouter.checkoutPage,
        pageBuilder: (context, state) {
          final extraData = state.extra as Map<String, dynamic>;

          return MaterialPage(
            child: CheckoutScreen(
              listOfProducts: extraData['listOfProducts'] as List<AddToCartModel>,
              productNumber: extraData['productNumber'] as int,
              totalAmount: extraData['totalAmount'] as double,
            ),
          );
        },
      ),

    ],
  );
}

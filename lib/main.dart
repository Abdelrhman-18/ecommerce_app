import 'package:ecommerce_app/ecommerce_app.dart';
import 'package:ecommerce_app/features/cart_feature/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CartCubit()..getCartItems()),
      ],
      child: const EcommerceApp(),
    ),
  );
}

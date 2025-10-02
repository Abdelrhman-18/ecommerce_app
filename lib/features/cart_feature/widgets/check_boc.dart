import 'package:ecommerce_app/features/cart_feature/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      buildWhen: (previous, current) => current is CartLoaded,
      builder: (context, state) {
        final cartCubit = context.read<CartCubit>();

        bool isChecked = false;
        if (state is CartLoaded) {
          isChecked = state.flag;
        }

        return Checkbox(
          value: isChecked,
          onChanged: (bool? newValue) {
            if (newValue != null) {
              cartCubit.toggleCheckBox(newValue);
            }
          },
        );
      },
    );
  }
}

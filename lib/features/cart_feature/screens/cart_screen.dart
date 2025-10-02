import 'package:ecommerce_app/config/app_colors.dart';
import 'package:ecommerce_app/config/app_images.dart';
import 'package:ecommerce_app/features/cart_feature/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/cart_feature/widgets/check_boc.dart';
import 'package:ecommerce_app/routes/app_routes.dart';
import 'package:ecommerce_app/shared/counter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CartCubit>();
    return BlocBuilder<CartCubit, CartState>(
      bloc: cubit,
      buildWhen: (previous, current) =>
      current is CartLoading ||
          current is CartLoaded ||
          current is CartError,
      builder: (context, state) {
        if (state is CartLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (state is CartLoaded) {
          final cartItems = state.cartItems;
          return Scaffold(
            backgroundColor: AppColors.whiteColor,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                onPressed: () => context.canPop()
                    ? context.pop()
                    : context.go(AppRouter.bottomNav),
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 24.sp,
                ),
              ),
              title: Text(
                "My Cart",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              centerTitle: true,
              actions: [
                Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Image.asset(
                    AppImage.cartIcon,
                    color: AppColors.blackColor,
                  ),
                ),
              ],
            ),

            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemCount: cartItems.length,
                      separatorBuilder: (BuildContext context, int index) =>
                      const Divider(endIndent: 15, indent: 15),
                      itemBuilder: (context, index) {
                        final cartItem = cartItems[index];
                        return Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(color: Colors.white),
                            child: Row(
                              children: [
                                CheckBoxWidget(),
                                SizedBox(width: 10),
                                SizedBox(
                                  height: 130,
                                  width: 100,
                                  child: Card(
                                    color: AppColors.lightGreyColor,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        cartItem.imageUrl,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        cartItem.name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 23,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        "Size: ${cartItem.size.name}",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      BlocBuilder<CartCubit, CartState>(
                                        buildWhen: (previous, current) =>
                                        current is CartQuantityUpdatedState &&
                                            current.productId ==
                                                cartItem.productId,
                                        builder: (context, state) {
                                          final cubit = context
                                              .read<CartCubit>();

                                          if (state is CartQuantityUpdatedState) {
                                            return Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                CustomCounter(
                                                  counter: state.quantity,
                                                  productId: cartItem.productId,
                                                  cubit: cubit,
                                                ),
                                                Text(
                                                  "\$${(state.quantity * cartItem.price).toStringAsFixed(1)}",
                                                  style: const TextStyle(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            );
                                          }

                                          return Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomCounter(
                                                counter: cartItem.quantity,
                                                productId: cartItem.productId,
                                                cubit: cubit,
                                                initialValue: cartItem.quantity,
                                              ),
                                              Text(
                                                "\$${(cartItem.quantity * cartItem.price).toStringAsFixed(1)}",
                                                style: const TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      padding: EdgeInsets.symmetric(
                        horizontal: 30.w,
                        vertical: 15.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),
                    onPressed: () {
                      bottomSheet(context, state);
                    },
                    child: Text(
                      "Go to Checkout",
                      style: TextStyle(color: AppColors.whiteColor),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (state is CartError) {
          return Scaffold(body: Center(child: Text("Something went wrong")));
        } else {
          return Scaffold(body: Center(child: Text("Something went wrong")));
        }
      },
    );
  }
}

Future<void> bottomSheet(BuildContext context, CartLoaded state) {
  return showModalBottomSheet<void>(
    elevation: 0,
    backgroundColor: AppColors.whiteColor,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      final cartItems = state.cartItems;
      final subTotal = state.subTotal;
      final shipping = 10.0;
      final total = subTotal + shipping;

      return SizedBox(
        height: 370,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 5,
                width: 100,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.greyColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.grey100,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.lightGreyColor),
                ),
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.percent, color: AppColors.lightGreyColor),
                    Text(
                      "Enter your promo code",
                      style: TextStyle(color: AppColors.lightGreyColor),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: AppColors.grey600,
                      size: 18,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              totalAndSubTotalWidget(
                context,
                "Subtotal",
                "\$${subTotal.toStringAsFixed(2)}",
              ),
              const SizedBox(height: 10),
              totalAndSubTotalWidget(context, "Shipping", "\$${shipping.toStringAsFixed(2)}"),
              const SizedBox(height: 10),
              Dash(
                direction: Axis.horizontal,
                length: 350,
                dashLength: 10,
                dashColor: AppColors.greyColor,
              ),
              const SizedBox(height: 10),
              totalAndSubTotalWidget(
                context,
                "Total",
                "\$${total.toStringAsFixed(2)}",
              ),
              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                  ),
                  onPressed: () {
                    context.goNamed(
                      AppRouter.checkoutPage,
                      extra: {
                        'listOfProducts': cartItems,
                        'productNumber': cartItems.length,
                        'totalAmount': total,
                      },
                    );
                  },
                  child: Text(
                    "Proceed to Checkout",
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget totalAndSubTotalWidget(
    BuildContext context,
    String titel,
    String amount,
    ) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        titel,
        style: TextStyle(fontSize: 16.sp, color: Colors.grey[700]),
      ),
      Text(
        amount,
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
      ),
    ],
  );
}

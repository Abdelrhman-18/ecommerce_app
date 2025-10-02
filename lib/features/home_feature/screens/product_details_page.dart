import 'package:ecommerce_app/config/app_colors.dart';
import 'package:ecommerce_app/config/app_images.dart';
import 'package:ecommerce_app/features/home_feature/cubit/product_details_cubit/product_details_cubit.dart';
import 'package:ecommerce_app/features/home_feature/model/product_model.dart';
import 'package:ecommerce_app/features/home_feature/widget/error_dialog.dart';
import 'package:ecommerce_app/features/home_feature/widget/product_shimmer.dart';
import 'package:ecommerce_app/routes/app_routes.dart';
import 'package:ecommerce_app/shared/counter_widget.dart';
import 'package:ecommerce_app/shared/error_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProductDetailsPage extends StatelessWidget {
  final String productId;

  const ProductDetailsPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductDetailsCubit>();

    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      bloc: cubit,
      buildWhen: (previous, current) =>
          current is ProductDetailsLoading ||
          current is ProductDetailsLoaded ||
          current is ProductDetailsError,
      builder: (context, state) {
        if (state is ProductDetailsLoading) {
          return const ProductDetailsShimmer();
        }

        if (state is ProductDetailsLoaded) {
          final product = state.product;

          return Scaffold(
            backgroundColor: AppColors.backgroundProductDetails,
            extendBodyBehindAppBar: true,
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
                "Detail Product",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.sp,
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
            body: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(height: 110.h),
                    SizedBox(
                      width: double.infinity,
                      height: 300.h,
                      child: Image.asset(product.imageUrl, fit: BoxFit.contain),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 400.h),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40.r),
                      topLeft: Radius.circular(40.r),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                SizedBox(height: 15.h),
                                Text(
                                  product.name,
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 18.sp,
                                    ),
                                    SizedBox(width: 2.w),
                                    RichText(
                                      text: TextSpan(
                                        text: " ${product.rating}  ",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Colors.black,
                                        ),
                                        children: const <TextSpan>[
                                          TextSpan(
                                            text: "(320 Review)",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            Column(
                              children: [
                                BlocBuilder<
                                  ProductDetailsCubit,
                                  ProductDetailsState
                                >(
                                  buildWhen: (previous, current) =>
                                      current is ProductQuantityUpdated,
                                  builder: (context, state) {
                                    final quantity =
                                        state is ProductQuantityUpdated
                                        ? state.quantity
                                        : 1;
                                    return CustomCounter(
                                      counter: quantity,
                                      productId: productId,
                                      cubit: cubit ,
                                      initialValue: null,

                                    );
                                  },
                                ),

                                Text(
                                  "Available in stock",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        SizedBox(height: 12.h),
                        Text(
                          "Size",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
                          buildWhen: (previous, current) =>
                              current is ProductSizeUpdated,
                          builder: (context, state) {
                            final selectedSize = state is ProductSizeUpdated
                                ? state.size
                                : null;

                            return Row(
                              children: ProductSize.values
                                  .map(
                                    (size) => _buildSizeCircle(
                                      context,
                                      size,
                                      selectedSize == size,
                                    ),
                                  )
                                  .toList(),
                            );
                          },
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          "Description",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          product.description,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey[700],
                          ),
                        ),
                        const Spacer(),


                      ],
                    ),
                  ),
                ),
              ],
            ),
            bottomNavigationBar: Container(
              color: AppColors.whiteColor,
              child :Padding(
                padding:  EdgeInsets.all(20.0.w),
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "\$",
                        style: TextStyle(
                          fontSize: 22.sp,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        children:  <TextSpan>[
                          TextSpan(
                            text:  "${product.price}",
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
                      buildWhen: (previous, current) =>
                      current is ProductAddingToCart || current is ProductAddToCart,
                      builder: (context, state) {
                        if (state is ProductAddingToCart) {
                          return ElevatedButton(
                            onPressed: null,
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 12.h,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                            ),
                            child: const CircularProgressIndicator(),
                          );
                        } else if (state is ProductAddToCart) {
                          return ElevatedButton(
                            onPressed: null,
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: 30.w,
                                vertical: 15.h,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.r),
                              ),
                            ),
                            child: const Text("Added ✅"),
                          );
                        }

                        return ElevatedButton.icon(
                          onPressed: () {
                            if (cubit.size != null) {
                              return cubit.addToCart(product.id);
                            } else {
                              showErrorDialog(context,"please select a size");
                            }
                          },
                          icon: SizedBox(
                            height: 30,
                              child: Image.asset(AppImage.cartIcon)),
                          label: Text(
                            "Add to Cart",
                            style: TextStyle(fontSize: 16.sp,color: AppColors.whiteColor),

                          ),
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
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        if (state is ProductDetailsError) {
          return ErrorScreen(onRetry: () {});
        }

        return const SizedBox.shrink();
      },
    );
  }
}

Widget _buildSizeCircle(
  BuildContext context,
  ProductSize size,
  bool isSelected,
) {
  return GestureDetector(
    onTap: () => context.read<ProductDetailsCubit>().selectSize(size),
    child: Container(
      margin: EdgeInsets.only(right: 8.w),
      width: 40.w,
      height: 40.w,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryColor : Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? AppColors.primaryColor : Colors.grey.shade300,
          width: 2,
        ),
      ),
      child: Center(
        child: Text(
          size.name,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),
  );
}

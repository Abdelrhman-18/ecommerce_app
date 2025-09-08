import 'package:ecommerce_app/config/color_manager.dart';
import 'package:ecommerce_app/config/text_style.dart';
import 'package:ecommerce_app/features/home_feature/home_cubit/home_cubit.dart';
import 'package:ecommerce_app/features/home_feature/model/product_model.dart';
import 'package:ecommerce_app/features/home_feature/widget/custom_appbar.dart';
import 'package:ecommerce_app/features/home_feature/widget/custom_carousel.dart';
import 'package:ecommerce_app/features/home_feature/widget/product_card.dart';
import 'package:ecommerce_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit()..getHomeData(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }



          if (state is HomeSuccess) {
            return Scaffold(
              backgroundColor: ColorManager.whiteColor,
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // AppBar
                      const CustomAppbar(),
                      SizedBox(height: 20.h),

                      // Carousel
                      const CustomCarousel(),
                      SizedBox(height: 20.h),

                      // New Arrivals Header
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "New Arrivals🔥",
                              style: AppTextStyles.newArrivalsStyle,
                            ),
                            GestureDetector(
                              onTap: () {
                                // TODO: Navigate to all products screen
                              },
                              child: Text(
                                "See All",
                                style: AppTextStyles.seeAllStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 12.h),

                      // Products Grid
                      Padding(
                        padding: EdgeInsets.all(8.0.w),
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.products.length,
                          gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.w,
                            mainAxisSpacing: 10.h,
                            childAspectRatio: 0.65,
                          ),
                          itemBuilder: (context, index) {
                            final ProductModel product =
                            state.products[index];
                            return InkWell(
                              onTap: ()=> context.goNamed(AppRouter.detailsPage),
                              child: ProductCard(
                                product: product,
                                onFavoriteToggle: () {
                                  // TODO: Add toggle favorite logic
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          if (state is HomeError) {
            return Scaffold(
              body: Center(
                child: Text(
                  "Please check your internet connection",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }
          // Default Empty View
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

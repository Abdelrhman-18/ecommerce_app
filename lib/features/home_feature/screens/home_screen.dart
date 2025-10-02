// Flutter core
import 'package:flutter/material.dart';

// Third-party packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

// Config
import 'package:ecommerce_app/config/app_colors.dart';
import 'package:ecommerce_app/config/text_style.dart';

// Features - Home
import 'package:ecommerce_app/features/home_feature/cubit/home_cubit/home_cubit.dart';
import 'package:ecommerce_app/features/home_feature/model/product_model.dart';
import 'package:ecommerce_app/features/home_feature/widget/custom_appbar.dart';
import 'package:ecommerce_app/features/home_feature/widget/custom_carousel.dart';
import 'package:ecommerce_app/features/home_feature/widget/home_shimmer.dart';
import 'package:ecommerce_app/features/home_feature/widget/product_card.dart';

// Routes
import 'package:ecommerce_app/routes/app_routes.dart';

// Shared
import 'package:ecommerce_app/shared/error_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit()..getHomeData(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return HomeShimmer();
          }

          if (state is HomeSuccess) {
            final cubit =  context.read<HomeCubit>();

            return Scaffold(
              backgroundColor: AppColors.whiteColor,
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //TODO: AppBar
                      const CustomAppbar(),
                      SizedBox(height: 20.h),

                      //TODO: Carousel
                      const CustomCarousel(),
                      SizedBox(height: 20.h),

                      //TODO: New Arrivals Header
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

                      //TODO: Products Grid
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
                            final ProductModel product = state.products[index];
                            return GestureDetector(
                              onTap: () {
                                context.goNamed(
                                  AppRouter.detailsPage,
                                  extra: product.id,
                                );
                              },
                              child: ProductCard(
                                product: product,
                                onFavoriteToggle: () =>cubit.toggleFavorite(product),
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
            return ErrorScreen(onRetry: (){},);
          }
          // Default Empty View
          return const SizedBox.shrink();
        },
      ),
    );
  }
}


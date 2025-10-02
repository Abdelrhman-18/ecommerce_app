import 'package:ecommerce_app/config/app_colors.dart';
import 'package:ecommerce_app/features/home_feature/cubit/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (_) => HomeCubit()..getHomeData(),
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          title: const Text("My Favorite"),
          titleTextStyle: TextStyle(
            color: AppColors.blackColor,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          centerTitle: true,
          actions: [
            Stack(
              children: [
                const Icon(EvaIcons.bellOutline),
                Positioned(
                  left: 11.w,
                  top: 3.w,
                  child: CircleAvatar(
                    backgroundColor: AppColors.redColor,
                    radius: 3.r,
                  ),
                ),
              ],
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: AppColors.lightGreyColor),
                ),
                child: Row(
                  children: [
                    const Icon(EvaIcons.searchOutline),
                    const SizedBox(width: 10),
                    Text(
                      "search something...",
                      style: TextStyle(
                        color: AppColors.greyColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.tune),
                  ],
                ),
              ),
              SizedBox(
                height: 60,
                child: ListView.builder(
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppColors.lightGreyColor,
                        ),
                      ),
                      child: Text(
                        categories[index].name,
                        style: TextStyle(
                          color: AppColors.greyColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  },
                ),
              ),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeSuccess) {
                    final favorites = state.favorites;

                    if (favorites.isEmpty) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text("No favorites yet"),
                        ),
                      );
                    }

                    return Padding(
                      padding: EdgeInsets.all(8.0.w),
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: favorites.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.w,
                          mainAxisSpacing: 10.h,
                          childAspectRatio: 0.65,
                        ),
                        itemBuilder: (context, index) {
                          final product = favorites[index];
                          return ListTile(
                            title: Text(product.name),
                            trailing: const Icon(Icons.favorite, color: Colors.red),
                          );
                        },
                      ),
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class CategoryName {
  final String name;
  CategoryName({required this.name});
}

List<CategoryName> categories = [
  CategoryName(name: "All"),
  CategoryName(name: "Men"),
  CategoryName(name: "Women"),
  CategoryName(name: "Latest"),
  CategoryName(name: "Most Popular"),
  CategoryName(name: "Best Sellers"),
];

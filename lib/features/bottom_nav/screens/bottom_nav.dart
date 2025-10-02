// Flutter core
import 'package:flutter/material.dart';

// Third-party packages
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports - Config
import 'package:ecommerce_app/config/app_colors.dart';
import 'package:ecommerce_app/config/app_images.dart';

// Project imports - Features / Screens
import 'package:ecommerce_app/features/home_feature/screens/home_screen.dart';
import 'package:ecommerce_app/features/cart_feature/screens/cart_screen.dart';
import 'package:ecommerce_app/features/favorite_feature/screens/favorite_screen.dart';
import 'package:ecommerce_app/features/profile_feature/screens/profile_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {

   int selectIndex =0;

  final List<Widget> pages = [
    const HomeScreen(),
     CartScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: AppColors.whiteColor,
        ),
        child: BottomNavigationBar(
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.grey100,
          currentIndex: selectIndex,
          onTap: (index){
            setState(() {
              selectIndex =index;
            });

          },
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                AppImage.homeIcon,
                height: 30.h,
                width: 30.w,
                color: selectIndex==0?AppColors.primaryColor:AppColors.greyColor,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 30.h,
                width: 30.w,

                child: Image.asset(
                  AppImage.deliveryIcon,
                  color: selectIndex==1?AppColors.primaryColor:AppColors.greyColor,

                ),
              ),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                AppImage.favoriteIcon,
                height: 30.h,
                width: 30.w,
                color: selectIndex==2?AppColors.primaryColor:AppColors.greyColor,

              ),
              label: "Favorite",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
               AppImage.userIcon,
                height: 30.h,
                width: 30.w,
                color: selectIndex==3?AppColors.primaryColor:AppColors.greyColor,

              ),
              label: "Profile",
            ),
          ],
        ),
      ),
      body: pages[selectIndex],
    );

  }
}

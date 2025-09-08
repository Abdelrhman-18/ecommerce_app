import 'package:ecommerce_app/config/color_manager.dart';
import 'package:ecommerce_app/features/cart_feature/screens/cart_screen.dart';
import 'package:ecommerce_app/features/favorite_feature/screens/favorite_screen.dart';
import 'package:ecommerce_app/features/home_feature/screens/home_screen.dart';
import 'package:ecommerce_app/features/profile_feature/screens/profile_screen.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  // Initialize the controller directly
  final PersistentTabController controller = PersistentTabController(
    initialIndex: 0,
  );

  // Define your list of screens
  final List<Widget> pages = [
    HomeScreen(),
    CartScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: controller,

      tabs: [
        PersistentTabConfig(
          screen: pages[0],
          item: ItemConfig(
            icon: Icon(EvaIcons.home),
            title: "Home",
            activeForegroundColor: ColorManager.primaryColor,
          ),
        ),
        PersistentTabConfig(
          screen: pages[1],
          item: ItemConfig(
            icon: Icon(Icons.shopping_cart_outlined),
            title: "My Cart",
            activeForegroundColor: ColorManager.primaryColor,
          ),
        ),
        PersistentTabConfig(
          screen: pages[2],
          item: ItemConfig(
            icon: Icon(Icons.favorite_border),
            title: "Favorite",
            activeForegroundColor: ColorManager.primaryColor,
          ),
        ),
        PersistentTabConfig(
          screen: pages[3],
          item: ItemConfig(
            icon: Icon(
              EvaIcons.personOutline,

            ),
            title: "My Profile",
            activeForegroundColor: ColorManager.primaryColor,
          ),
        ),
      ],
      navBarBuilder: (navBarConfig) =>
          Style1BottomNavBar(navBarConfig: navBarConfig),
    );
  }
}

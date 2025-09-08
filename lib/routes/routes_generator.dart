import 'package:ecommerce_app/features/bottom_nav/screens/bottom_nav.dart';
import 'package:ecommerce_app/features/home_feature/screens/home_screen.dart';
import 'package:ecommerce_app/features/home_feature/screens/product_details_page.dart';
import 'package:ecommerce_app/routes/app_routes.dart';
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
        name: AppRouter.detailsPage,
        path: AppRouter.detailsPage,
        builder: (context, state) => const ProductDetailsPage(),
      ),
    ],
  );
}

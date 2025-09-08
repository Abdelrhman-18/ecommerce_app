import 'package:ecommerce_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go(AppRouter.home);
            }
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Center(child: Text("welcome in product details page ")),
    );
  }
}

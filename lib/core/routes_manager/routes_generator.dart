import 'package:e_commerce_app/core/routes_manager/routes.dart';
import 'package:e_commerce_app/features/auth/presentation/login/login.dart';
import 'package:e_commerce_app/features/auth/presentation/regester/register.dart';
import 'package:flutter/material.dart';


import '../../features/cart/screens/cart_screen.dart';
import '../../features/main_layout/main_layout.dart';
import '../../features/product_details/presentation/screen/product_details.dart';
import '../../features/products_screen/presentation/screens/products_screen.dart';
import '../../features/splash/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.cartRoute:
        return MaterialPageRoute(builder: (_) =>  CartScreen());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) =>  MainLayout());

      case Routes.productsScreenRoute:
        return MaterialPageRoute(builder: (_) =>  ProductsScreen());

      case Routes.productDetails:
        return MaterialPageRoute(builder: (_) =>  ProductDetails());

      case Routes.signInRoute:
        return MaterialPageRoute(builder: (_) =>  Login());

      case Routes.splashScreenRoute:
        return MaterialPageRoute(builder: (_) =>  SplashScreen());

      case Routes.signUpRoute:
        return MaterialPageRoute(builder: (_) => Register());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}

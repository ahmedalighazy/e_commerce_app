import 'package:e_commerce_app/core/routes_manager/routes.dart';
import 'package:e_commerce_app/features/auth/presentation/login/login.dart';
import 'package:e_commerce_app/features/auth/presentation/regester/register.dart';
import 'package:flutter/material.dart';

class RoutesGenerator{
  static Route<dynamic> getRoute(RouteSettings settings){
    switch(settings.name){
      case Routes.signInRoute:
        return MaterialPageRoute(builder: (_)=> Login());

      case Routes.signUpRoute:
        return MaterialPageRoute(builder: (_)=> Register());

      default :
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


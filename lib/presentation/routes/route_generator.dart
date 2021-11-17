import 'package:flutter/material.dart';
import 'package:lohfinder_frontend/presentation/screens/home/home_screen.dart';
import 'package:lohfinder_frontend/presentation/screens/welcome/welcome_screen.dart';

import 'error_route.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.route:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case WelcomeScreen.route:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      default:
        return MaterialPageRoute(builder: (_) => const ErrorRoute());
    }
  }
}
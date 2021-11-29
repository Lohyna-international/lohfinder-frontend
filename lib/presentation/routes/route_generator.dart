import 'package:flutter/material.dart';
import 'package:lohfinder_frontend/presentation/screens/events_list/events_list_screen.dart';
import 'package:lohfinder_frontend/presentation/screens/sign_in/sign_in_screen.dart';
import 'package:lohfinder_frontend/presentation/screens/sign_up/sign_up_step_one_screen.dart';
import 'package:lohfinder_frontend/presentation/screens/sign_up/sign_up_step_three_screen.dart';
import 'package:lohfinder_frontend/presentation/screens/sign_up/sign_up_step_two_screen.dart';
import 'package:lohfinder_frontend/presentation/screens/welcome/welcome_screen.dart';

import 'error_route.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case EventsListScreen.route:
        return MaterialPageRoute(builder: (_) => const EventsListScreen());
      case SignInScreen.route:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case SignUpStepOneScreen.route:
        return MaterialPageRoute(builder: (_) => const SignUpStepOneScreen());
      case SignUpStepTwoScreen.route:
        return MaterialPageRoute(builder: (_) => const SignUpStepTwoScreen());
      case SignUpStepThreeScreen.route:
        return MaterialPageRoute(builder: (_) => const SignUpStepThreeScreen());
      case WelcomeScreen.route:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      default:
        return MaterialPageRoute(builder: (_) => const ErrorRoute());
    }
  }
}

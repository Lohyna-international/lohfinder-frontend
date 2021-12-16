import 'package:flutter/material.dart';
import 'package:lohfinder_frontend/data/models/event.dart';
import 'package:lohfinder_frontend/presentation/screens/create_event/create_event_screen.dart';
import 'package:lohfinder_frontend/presentation/screens/event_info/event_info_screen.dart';
import 'package:lohfinder_frontend/presentation/screens/events_list/events_list_screen.dart';
import 'package:lohfinder_frontend/presentation/screens/sign_in/sign_in_screen.dart';
import 'package:lohfinder_frontend/presentation/screens/sign_up/sign_up_step_one_screen.dart';
import 'package:lohfinder_frontend/presentation/screens/sign_up/sign_up_step_three_screen.dart';
import 'package:lohfinder_frontend/presentation/screens/sign_up/sign_up_step_two_screen.dart';
import 'package:lohfinder_frontend/presentation/screens/welcome/welcome_screen.dart';

import 'error_route.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    late final Widget route;
    final args = settings.arguments;
    switch (settings.name) {
      case CreateEventScreen.route:
        route = const CreateEventScreen();
        break;

      case EventInfoScreen.route:
        if (args is Event) {
          route = EventInfoScreen(args);
        } else {
          route = const ErrorRoute();
        }
        break;

      case EventsListScreen.route:
        route = const EventsListScreen();
        break;

      case SignInScreen.route:
        route = const SignInScreen();
        break;

      case SignUpStepOneScreen.route:
        route = const SignUpStepOneScreen();
        break;

      case SignUpStepTwoScreen.route:
        route = const SignUpStepTwoScreen();
        break;

      case SignUpStepThreeScreen.route:
        route = const SignUpStepThreeScreen();
        break;

      case WelcomeScreen.route:
        route = const WelcomeScreen();
        break;

      default:
        route = const ErrorRoute();
        break;
    }
    return MaterialPageRoute(builder: (_) => route);
  }
}

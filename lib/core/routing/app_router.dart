import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/routing/routes.dart';
import 'package:flutter_advanced/features/login/ui/login_screen.dart';
import 'package:flutter_advanced/features/onboarding/onboarding_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings routeSettings) {
    //! this argument passed to any screen need it like this (argument as modelName).
    final arguments = routeSettings.arguments;

    switch (routeSettings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${routeSettings.name}'),
            ),
          ),
        );
    }
  }
}

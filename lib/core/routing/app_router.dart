import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/di/dependency_injection.dart';
import 'package:flutter_advanced/core/routing/routes.dart';
import 'package:flutter_advanced/features/home/ui/home_screen.dart';
import 'package:flutter_advanced/features/login/ui/login_screen.dart';
import 'package:flutter_advanced/features/onboarding/onboarding_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/login/logic/cubit/login_cubit.dart';

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
          builder: (_) => BlocProvider(
            create: (_) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
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

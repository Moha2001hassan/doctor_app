import 'package:complet_project/core/di/dependency_injection.dart';
import 'package:complet_project/features/login/ui/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/routing/routes.dart';
import '../../features/login/logic/cubit/login_cubit.dart';
import '../../features/onboarding/ui/onboarding_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    //final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );

      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text("No Routes defined for ${settings.name}"),
            ),
          ),
        );
    }
  }
}

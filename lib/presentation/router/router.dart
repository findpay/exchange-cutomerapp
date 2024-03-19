import 'package:flutter/material.dart';

import '../screens/splash/splash.dart';

class RouteNames {
  static const String splashScreen = '/splash';
  static const String countriesScreen = '/countries';
  static const String signinScreen = '/signinScreen';
  static const String homeScreen = '/homeScreen';
  static const String otpScreen = '/OtpScreen';
  static const String videoScreen = '/videoScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const SplashScreen());
      // case RouteNames.resultScreen:
      //   final body = settings.arguments as Map<String, dynamic>;
      //   return MaterialPageRoute(
      //       settings: settings, builder: (_) => ResultScreen(body: body));

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}

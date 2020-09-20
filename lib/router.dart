import 'package:flutter/material.dart';
import 'package:roome_ui/ui/home_screen.dart';
import 'package:roome_ui/ui/landing_screen.dart';
import 'package:roome_ui/ui/login_screen.dart';
import 'package:roome_ui/ui/search_screen.dart';
import 'package:roome_ui/ui/signup_screen.dart';
import 'package:roome_ui/utils/app_constants.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.LandingScreen:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => LandingScreen(),
          transitionDuration: Duration(milliseconds: 500),
          transitionsBuilder:
              (_, Animation<double> animation, __, Widget child) {
            return Opacity(
              opacity: animation.value,
              child: child,
            );
          },
        );
      case RoutePaths.LoginScreen:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => LoginScreen(),
          transitionDuration: Duration(milliseconds: 500),
          transitionsBuilder:
              (_, Animation<double> animation, __, Widget child) {
            return Opacity(
              opacity: animation.value,
              child: child,
            );
          },
        );
      case RoutePaths.SignupScreen:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => SignupScreen(),
          transitionDuration: Duration(milliseconds: 500),
          transitionsBuilder:
              (_, Animation<double> animation, __, Widget child) {
            return Opacity(
              opacity: animation.value,
              child: child,
            );
          },
        );

      case RoutePaths.HomeScreen:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => HomeScreen(),
          transitionDuration: Duration(milliseconds: 500),
          transitionsBuilder:
              (_, Animation<double> animation, __, Widget child) {
            return Opacity(
              opacity: animation.value,
              child: child,
            );
          },
        );
      case RoutePaths.SearchScreen:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => SearchScreen(),
          transitionDuration: Duration(milliseconds: 500),
          transitionsBuilder:
              (_, Animation<double> animation, __, Widget child) {
            return Opacity(
              opacity: animation.value,
              child: child,
            );
          },
        );
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

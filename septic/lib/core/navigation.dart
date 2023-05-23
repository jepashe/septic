import 'package:flutter/material.dart';
import 'package:septic/screens/auth_screen.dart';
import 'package:septic/screens/splash_screen.dart';

abstract class MainNavigationRouteNames {
  static const splash = 'splash';
  static const auth = '/auth';
  static const titleScreen = '/title_screen';
  static const settingsScreen = '/settings';
}

class MainNavigation {
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.splash: (context) => const SplashScreen(),
    MainNavigationRouteNames.auth: (context) => const AuthScreen(),
    //MainNavigationRouteNames.titleScreen: (context) => const TitleScreen(),
    //MainNavigationRouteNames.settingsScreen: (context) => SettingsScreen(),
  };
}

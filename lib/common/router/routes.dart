import 'package:flutter/material.dart';
import 'package:ismart/common/ui/screens/home_screen/home_screen.dart';
import 'package:ismart/features/account/screens/login_screen.dart';
import 'package:ismart/features/account/screens/signin_screen.dart';
import 'package:ismart/features/stations_feature/screens/charging_screen.dart';
import 'package:ismart/features/stations_feature/screens/search_screen.dart';

const String logInScreenRoute = '/login_screen_route';
const String signInScreenRoute = '/signin_scren_route';
const String homeScreenPath = '/root';
const String chargingScreenRoute = '/root/chargingScreenRoute';
const String chargingscreenSessionStarted =
    '/root/chargingscreenSessionStarted';
const String searchScreenRoute = '/root/search_screen_route';

Map<String, WidgetBuilder> routes = {
  homeScreenPath: (context) => const HomeScreen(),
  logInScreenRoute: (context) => const LoginScreen(),
  signInScreenRoute: (context) => const SignInScreen(),
  searchScreenRoute: (context) => const SearchScreen(),
  chargingScreenRoute: (context) => const ChargingScreen()
};

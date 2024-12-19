import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:weather_app_zagsystem/MVVM/Views/screen/home_screen.dart';
=======
import 'package:weather_app_zagsystem/MVVM/Views/home_screen.dart';
import 'package:weather_app_zagsystem/MVVM/Views/login_screen.dart';
import 'package:weather_app_zagsystem/MVVM/Views/sign_up_screen.dart';

import 'package:weather_app_zagsystem/MVVM/Views/splash_screen.dart';
>>>>>>> eldeeb

import '../MVVM/Views/Details/Screen/Details_Screen.dart';
import 'routs.dart';

class AppRouts {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homePage:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
<<<<<<< HEAD
      case Routes.detailScreen:
        return MaterialPageRoute(builder: (context) => DetailsScreen());
=======
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case Routes.signUpScreen:
        return MaterialPageRoute(builder: (context) => SignUpScreen());
>>>>>>> eldeeb
      default:
        return null;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:weather_app_zagsystem/MVVM/Views/home_screen.dart';

import 'routs.dart';
class AppRouts {

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homePage: 
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      
      default:
        return null;
    }
  }
}

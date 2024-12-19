import 'package:flutter/material.dart';
import 'package:weather_app_zagsystem/MVVM/Views/screen/home_screen.dart';

import '../MVVM/Views/Details/Screen/Details_Screen.dart';
import 'routs.dart';

class AppRouts {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homePage:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case Routes.detailScreen:
        return MaterialPageRoute(builder: (context) => DetailsScreen());
      default:
        return null;
    }
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/MVVM/View_Models/Weathercubit/weather_cubit_cubit.dart';
import '../MVVM/View_Models/Authcubit/auth_cubit.dart';
import '../MVVM/Views/Auth/Screens/login_screen.dart';
import '../MVVM/Views/Auth/Screens/sign_up_screen.dart';
import '../MVVM/Views/Home/Screens/home_Screen.dart';
import '../MVVM/Views/Settings/Screen/Settings_Screen.dart';
import '../MVVM/Views/splash_screen.dart';
import 'routs.dart';

class AppRouts {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homePage:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => WeatherCubit(),
                  child: const HomeScreen(),
                ));
      case Routes.settingsScreen:
        return MaterialPageRoute(builder: (context) => SettingsScreen());
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => AuthCubit(FirebaseAuth.instance),
                  child: LoginScreen(),
                ));
      case Routes.signUpScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => AuthCubit(FirebaseAuth.instance),
                  child: SignUpScreen(),
                ));
      default:
        return null;
    }
  }
}

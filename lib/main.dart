import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'routing/appRouting.dart';
import 'routing/routs.dart';
import 'theming/colors.dart';

void main() {
  runApp(MainApp(appRouter: AppRouts()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.appRouter});
  final AppRouts appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
<<<<<<< Updated upstream
      theme: ThemeData(
        scaffoldBackgroundColor: ColorsManager.primaryColor,
        primaryColor: ColorsManager.primaryColor,
        fontFamily: "Poppins",
      ),
<<<<<<< Updated upstream
      initialRoute: Routes.splashScreen,
=======
      initialRoute: Routes.homePage,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}

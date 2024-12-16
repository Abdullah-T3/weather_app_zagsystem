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
      theme: ThemeData(
        scaffoldBackgroundColor: ColorsManager.primaryColor,
        primaryColor: ColorsManager.primaryColor,
      ),
      initialRoute: Routes.homePage,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}

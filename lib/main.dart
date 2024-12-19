import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/firebase_options.dart';

import 'routing/appRouting.dart';
import 'routing/routs.dart';
import 'theming/colors.dart';

void main() async {
  // Ensure Flutter bindings are initialized before using async code
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Run the app after Firebase is initialized
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
        fontFamily: "Poppins",
      ),
<<<<<<< Updated upstream
      initialRoute: Routes.splashScreen,
=======
      initialRoute: Routes.homePage,
>>>>>>> Stashed changes
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}

import 'package:flutter/material.dart';
<<<<<<< Updated upstream
=======
import 'package:hive_flutter/adapters.dart';
import 'package:weather_app/firebase_options.dart';
>>>>>>> Stashed changes

import 'routing/appRouting.dart';
import 'routing/routs.dart';
import 'theming/colors.dart';

<<<<<<< Updated upstream
void main() {
=======
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
>>>>>>> Stashed changes
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
      ),
      initialRoute: Routes.homePage,
=======
      theme: ThemeData(scaffoldBackgroundColor: ColorsManager.primaryColor, primaryColor: ColorsManager.primaryColor, fontFamily: "Poppins"),
      initialRoute: Routes.splashScreen,
>>>>>>> Stashed changes
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}

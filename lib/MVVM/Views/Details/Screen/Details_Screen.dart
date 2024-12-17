import 'package:flutter/material.dart';
import 'package:weather_app_zagsystem/Responsive/UiComponanets/InfoWidget.dart';
import 'package:weather_app_zagsystem/theming/colors.dart';

import '../../../../theming/styles.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.secondaryColor,
        title: Text(
          "App Conditions",
          style: TextStyles.title,
        ),
      ),
      body: Center(
        child: Infowidget(
          builder: (context, deviceInfo) {
            return Padding(
              padding: EdgeInsetsDirectional.only(top: deviceInfo.screenHeight * 0.02, start: deviceInfo.screenWidth * 0.05, end: deviceInfo.screenWidth * 0.05),
              child: Column(
                spacing: deviceInfo.screenHeight * 0.01,
                children: [
                  Text(
                    "Cairo",
                    style: TextStyles.title,
                  ),
                  Image.asset("assets/image/sun.png")
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

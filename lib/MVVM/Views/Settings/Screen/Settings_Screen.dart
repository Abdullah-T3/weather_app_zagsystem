import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/helpers/extantions.dart';
import 'package:weather_app/routing/routs.dart';

import '../../../../Responsive/UiComponanets/InfoWidget.dart';
import '../../../../theming/colors.dart';
import '../../../../theming/styles.dart';
import '../../../View_Models/Authcubit/auth_cubit.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String selectedTemperatureUnit = "Celsius"; // Default selected unit
  String selectedWindSpeedUnit = "Km/h"; // Default wind speed unit

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.secondaryColor,
        title: Text(
          "Settings",
          style: TextStyles.title,
        ),
      ),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          // If the user is not authenticated, navigate to the login screen
          if (state is Unauthenticated) {
            context.pushReplacementNamed(Routes.loginScreen);
          }
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is AuthLoading) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Loading...")));
          }
        },
        child: Infowidget(
          builder: (context, deviceInfo) {
            return Padding(
              padding: EdgeInsetsDirectional.only(
                top: deviceInfo.screenHeight * 0.02,
                start: deviceInfo.screenWidth * 0.05,
                end: deviceInfo.screenWidth * 0.05,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Units",
                    style: TextStyles.title,
                  ),
                  SizedBox(height: deviceInfo.screenHeight * 0.02),
                  Container(
                    width: deviceInfo.screenWidth * 0.9,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: ColorsManager.secondaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Temperature",
                          style: TextStyles.textGray,
                        ),
                        SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            color: ColorsManager.primaryColor,
                            border: Border.all(color: ColorsManager.secondaryColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(deviceInfo.localWidth * 0.001),
                            child: ToggleButtons(
                              color: ColorsManager.choosedColor,
                              borderColor: ColorsManager.secondaryColor,
                              constraints: BoxConstraints(minWidth: deviceInfo.localWidth * 0.4, minHeight: deviceInfo.localHeight * 0.05),
                              isSelected: [
                                selectedTemperatureUnit == "Celsius",
                                selectedTemperatureUnit == "Fahrenheit",
                              ],
                              onPressed: (index) {
                                setState(() {
                                  selectedTemperatureUnit = index == 0 ? "Celsius" : "Fahrenheit";
                                });
                              },
                              borderRadius: BorderRadius.circular(10),
                              selectedColor: Colors.white,
                              fillColor: ColorsManager.secondaryColor,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Text("Celsius"),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  child: Text("Fahrenheit"),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: deviceInfo.screenHeight * 0.03),
                        Text(
                          "Wind Speed",
                          style: TextStyles.textGray,
                        ),
                        SizedBox(height: 8),
                        DropdownButton<String>(
                          value: selectedWindSpeedUnit,
                          items: [
                            "Km/h",
                            "Miles/h"
                          ]
                              .map(
                                (unit) => DropdownMenuItem(
                                  value: unit,
                                  child: Text(
                                    unit,
                                    style: TextStyles.textGray,
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedWindSpeedUnit = value!;
                            });
                          },
                          dropdownColor: ColorsManager.secondaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: deviceInfo.screenHeight * 0.03),
                  Text(
                    "About",
                    style: TextStyles.title,
                  ),
                  SizedBox(height: deviceInfo.screenHeight * 0.03),
                  Text(
                    "This app is a simple weather forecast app that uses the OpenWeatherMap API to get weather information. It is built using Flutter and the MVVM architecture.",
                    style: TextStyles.textGray,
                  ),
                  SizedBox(height: deviceInfo.screenHeight * 0.03),
                  MaterialButton(
                    onPressed: () {
                      context.read<AuthCubit>().signOut();
                    },
                    color: Colors.red,
                    padding: EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Logout",
                      style: TextStyles.logOutTextStyle,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:weather_app_zagsystem/MVVM/Views/screen/api_screen.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return ApiPage();
  }
}
import 'package:flutter/material.dart';

import '../Weather Forecast/Screens/Weather_Screen.dart';
import '../widget/bottomnavbar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void _onIndexChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  static const TextStyle _textStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.w400);

  final List<Widget> screens = const [
    WeatherScreen(),
    Center(child: Text("Search", style: _textStyle)),
    Center(child: Text("Notifications", style: _textStyle)),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomnavbarWidget(currentIndex: _currentIndex, onIndexChanged: _onIndexChanged),
    );
  }
}

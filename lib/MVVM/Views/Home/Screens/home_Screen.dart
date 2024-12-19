import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/scheduler.dart';
import 'package:weather_app/theming/colors.dart';

import '../../Settings/Screen/Settings_Screen.dart';
import '../../Weather Forecast/Screens/Weather_Screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const WeatherScreen(),
    const DetailsScreen(),
    const SettingsScreen(),
  ];

  // Define the icons
  final List<IconData> _iconList = [
    Icons.cloud_outlined,
    Icons.info_outline,
    Icons.settings_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: AnimatedBottomNavigationBar(
        gapWidth: 10,
        icons: _iconList,
        activeIndex: _currentIndex,
        gapLocation: GapLocation.end,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        activeColor: Colors.blue,
        inactiveColor: Colors.white,
        backgroundColor: ColorsManager.secondaryColor,
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Details Screen'),
    );
  }
}

// Example WeatherScreen, DetailsScreen, and SettingsScreen remain the same

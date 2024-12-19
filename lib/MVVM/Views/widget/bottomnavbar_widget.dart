import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_zagsystem/theming/colors.dart';

class BottomnavbarWidget extends StatefulWidget {
  final int currentIndex;
  final Function(int) onIndexChanged;
  const BottomnavbarWidget({
    super.key,
    required this.currentIndex,
    required this.onIndexChanged,
  });

  @override
  State<BottomnavbarWidget> createState() => _BottomnavbarWidgetState();
}

class _BottomnavbarWidgetState extends State<BottomnavbarWidget> {
  final List<IconData> icons = const [
    Icons.cloud,
    Icons.menu,
    Icons.settings,
  ];
  late int _currentIndex;
  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
      icons: icons,
      activeIndex: _currentIndex,
      notchSmoothness: NotchSmoothness.softEdge,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });

        widget.onIndexChanged(index);
      },
      backgroundColor: ColorsManager.secondaryColor,
      activeColor: const Color(0xFF0467D9),
      inactiveColor: Colors.grey,
    );
  }
}

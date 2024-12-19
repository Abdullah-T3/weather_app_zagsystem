import 'package:flutter/material.dart';

import '../widget/air_condition_api_widget.dart';

class AirCondition extends StatefulWidget {
  const AirCondition({super.key});

  @override
  State<AirCondition> createState() => _AirConditionState();
}

class _AirConditionState extends State<AirCondition> {
  @override
  Widget build(BuildContext context) {
   return AirConditionApiWidget();
  }
}

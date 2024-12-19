import 'package:flutter/material.dart';
import '../../../../Responsive/UiComponanets/InfoWidget.dart';
import '../../../../theming/colors.dart';
import '../../../../theming/styles.dart';
import '../Widgets/build_item_widget.dart';

class DetailsScreen extends StatelessWidget {
  final String date;
  final String condition;
  final double maxTemp;
  final double minTemp;
  final String iconUrl;
  final String ctiyName;
  const DetailsScreen({
    super.key,
    required this.date,
    required this.condition,
    required this.maxTemp,
    required this.minTemp,
    required this.iconUrl,
    required this.ctiyName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.secondaryColor,
        title: Text(
          ctiyName,
          style: TextStyles.title,
        ),
      ),
      body: Center(
        child: Infowidget(
          builder: (context, deviceInfo) {
            return Padding(
              padding: EdgeInsetsDirectional.only(
                top: deviceInfo.screenHeight * 0.02,
                start: deviceInfo.screenWidth * 0.05,
                end: deviceInfo.screenWidth * 0.05,
              ),
              child: Column(
                children: [
                  Text(
                    ctiyName,
                    style: TextStyles.title.copyWith(
                      fontSize: 42,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    date,
                    style: TextStyles.title,
                  ),
                  SizedBox(height: 10),
                  if (iconUrl.isNotEmpty)
                    Image.network(
                      'https:$iconUrl',
                      width: deviceInfo.screenWidth * 0.4,
                      height: deviceInfo.screenWidth * 0.4,
                      errorBuilder: (_, __, ___) => const Icon(
                        Icons.error_outline,
                        color: Colors.red,
                        size: 50,
                      ),
                    ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BuildItemWidget(data: maxTemp.toString(), title: 'Max Temp'),
                      const SizedBox(width: 10),
                      BuildItemWidget(data: minTemp.toString(), title: 'Min Temp'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BuildItemWidget(
                        data: condition,
                        style: TextStyles.title,
                        title: 'Condition',
                      ),
                      const SizedBox(width: 10),
                      BuildItemWidget(data: minTemp.toString(), title: 'Min Temp'),
                    ],
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

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../theming/colors.dart';

class AirConditionApiWidget extends StatefulWidget {
  const AirConditionApiWidget({super.key});

  @override
  State<AirConditionApiWidget> createState() => _ApiWidgetState();
}

class _ApiWidgetState extends State<AirConditionApiWidget> {
  List<dynamic> dataContainer = [];
  Map<String, dynamic>? locationData;
  bool isLoading = true;
  String? errorMessage,
      region,
      country,
      conditionIcon,
      temperatureMax,
      locationName;
  var forecastDay, dayData;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      var response = await Dio().get(
          'https://api.weatherapi.com/v1/forecast.json?key=f6521affb2b847dbae4190056241512&q=Cairo&days=7&aqi=no&alerts=no');
      setState(() {
        dataContainer = response.data['forecast']['forecastday'];
        locationData = response.data['location'];
        region = locationData?['region'] ?? 'N/A';
        country = locationData?['country'] ?? 'N/A';
        forecastDay = dataContainer[0];
        dayData = forecastDay['day'];
        conditionIcon = dayData?['condition']?['icon'] ?? 'N/A';
        temperatureMax =
            '${dayData?['maxtemp_c']?.toStringAsFixed(1) ?? 'N/A'} °C';
        isLoading = false;
        errorMessage = null;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = 'Error fetching data';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (errorMessage != null) {
      return Center(
          child: Text(errorMessage!, style: const TextStyle(fontSize: 20)));
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Air Condition',
            style: TextStyle(color: ColorsManager.textWhite),
          ),
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: ColorsManager.textWhite,
            ),
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.9,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '$country',
                style: TextStyle(
                    fontSize: 25,
                    color: ColorsManager.textWhite,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '$region',
                style: TextStyle(
                    fontSize: 16,
                    color: ColorsManager.textWhite,
                    fontWeight: FontWeight.bold),
              ),
              Image(
                image: NetworkImage('https:$conditionIcon'),
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
              Text(
                '$temperatureMax',
                style: TextStyle(fontSize: 20, color: ColorsManager.textWhite),
              ),
            ],
          ),
        ),
      );
    }
  }
}

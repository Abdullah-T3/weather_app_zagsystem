import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../theming/colors.dart';
import 'aircondition_screen.dart';

class ApiPage extends StatefulWidget {
  const ApiPage({super.key});
  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
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
          title: Text('Weather Forecast',
              style: const TextStyle(
                  fontSize: 20, color: ColorsManager.textWhite)),
          backgroundColor: Colors.transparent,
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.9,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            // decoration: BoxDecoration(color: Colors.red),
            child: Column(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.start,
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
                    style:
                        TextStyle(fontSize: 20, color: ColorsManager.textWhite),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.38,
                    decoration: BoxDecoration(
                      color: ColorsManager.secondaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.all(2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: dataContainer.length,
                            itemBuilder: (context, idx) {
                              var forecasting = dataContainer[idx];
                              var day = forecasting['day'];
                              String conditionState =
                                  day?['condition']?['text'] ?? 'N/A';
                              String conditionIconState =
                                  day?['condition']?['icon'] ?? 'N/A';
                              String tempMax =
                                  '${day?['maxtemp_c']?.toStringAsFixed(1) ?? 'N/A'}';
                              String tempMin =
                                  '${day?['mintemp_c']?.toStringAsFixed(1) ?? 'N/A'}';

                              String displayDate;
                              displayDate = DateFormat('EEE')
                                  .format(DateTime.parse(forecasting['date']));

                              switch (conditionState) {
                                case 'Sunny':
                                  conditionState = 'Sunny';
                                  break;
                                case 'Patchy rain nearby':
                                  conditionState = 'Rain';
                                  break;
                                case 'Partly Cloudy ':
                                  conditionState = 'Cloudy';
                                  break;
                                default:
                                  conditionState = 'N/A';
                                  break;
                              }

                              return Container(
                                padding: const EdgeInsets.all(8),
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: ColorsManager.primaryColor,
                                ),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        displayDate,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: ColorsManager.textWhite),
                                      ),
                                      Row(spacing: 8, children: [
                                        Image(
                                          image: NetworkImage(
                                              'https:$conditionIconState'),
                                          width: 50,
                                          height: 50,
                                          fit: BoxFit.cover,
                                        ),
                                        Text(
                                          conditionState,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: ColorsManager.textWhite),
                                        ),
                                      ]),
                                      Text(
                                        '$tempMax/$tempMin',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: ColorsManager.textWhite),
                                        textAlign: TextAlign.end,
                                      )
                                    ]),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: ColorsManager.secondaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Air Condition",
                              style: TextStyle(
                                  fontSize: 16, color: ColorsManager.textWhite),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const AirCondition()));
                              },
                              child: Container(
                                  padding: const EdgeInsets.all(8),
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF0487E4),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text("See More",
                                      style: TextStyle(
                                          color: ColorsManager.textWhite))),
                            ),
                          ]),
                    ),
                  )
                ])),
      );
    }
  }
}

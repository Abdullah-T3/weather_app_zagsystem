import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../theming/colors.dart';
import '../../../View_Models/Weathercubit/weather_cubit_cubit.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WeatherCubit()..fetchWeather(),
      child: Scaffold(
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
        body: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is WeatherError) {
              return Center(
                child: Text(state.message, style: const TextStyle(fontSize: 20)),
              );
            } else if (state is WeatherLoaded) {
              final weather = state.weatherData;
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.9,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      weather.country,
                      style: TextStyle(
                        fontSize: 25,
                        color: ColorsManager.textWhite,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      weather.region,
                      style: TextStyle(
                        fontSize: 16,
                        color: ColorsManager.textWhite,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Image(
                      image: NetworkImage('https:${weather.conditionIcon}'),
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      weather.temperatureMax,
                      style: TextStyle(
                        fontSize: 20,
                        color: ColorsManager.textWhite,
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}

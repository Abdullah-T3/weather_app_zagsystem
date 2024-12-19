import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../Models/weather/weather_data_model.dart';

part 'weather_cubit_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherLoading());

  Future<void> fetchWeather() async {
    emit(WeatherLoading());
    try {
      var response = await Dio().get(
          'https://api.weatherapi.com/v1/forecast.json?key=f6521affb2b847dbae4190056241512&q=Cairo&days=7&aqi=no&alerts=no');
      final weatherData = WeatherData.fromJson(response.data);
      emit(WeatherLoaded(weatherData));
    } catch (e) {
      emit(WeatherError('Error fetching data'));
    }
  }
}
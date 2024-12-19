import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import '../../Models/weather/weather_data_model.dart';

part 'weather_cubit_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherLoading());

  static const _weatherBoxName = 'weatherBox';
  static const _cachedWeatherKey = 'weather_data';
  final _dio = Dio();

  Future<void> fetchWeather() async {
    try {
      emit(WeatherLoading());

      // Try to get cached data first
      final cachedData = await _getCachedWeather();
      if (cachedData != null) {
        emit(WeatherLoaded(cachedData));
      }

      // Fetch fresh data
      final response = await _dio.get(
        'https://api.weatherapi.com/v1/forecast.json',
        queryParameters: {
          'key': 'f6521affb2b847dbae4190056241512',
          'q': 'Cairo',
          'days': '7',
          'aqi': 'no',
          'alerts': 'no',
        },
      );

      if (response.statusCode == 200 && response.data != null) {
        final weatherData = WeatherData.fromJson(response.data);
        await _cacheWeather(weatherData);
        emit(WeatherLoaded(weatherData));
      } else {
        emit(WeatherError('Failed to load weather data'));
      }
    } on DioException catch (e) {
      String errorMessage = 'Network error occurred';
      if (e.response != null) {
        errorMessage = 'Error: ${e.response?.statusCode} - ${e.response?.statusMessage}';
      }
      emit(WeatherError(errorMessage));
    } catch (e) {
      emit(WeatherError('An unexpected error occurred: $e'));
      print('Error fetching weather data: $e');
    }
  }

  Future<void> _cacheWeather(WeatherData data) async {
    try {
      final box = await Hive.openBox<String>(_weatherBoxName);
      await box.put(_cachedWeatherKey, weatherDataToJson(data));
    } catch (e) {
      print('Error caching weather data: $e');
    }
  }

  Future<WeatherData?> _getCachedWeather() async {
    try {
      final box = await Hive.openBox<String>(_weatherBoxName);
      final jsonString = box.get(_cachedWeatherKey);
      if (jsonString != null) {
        return weatherDataFromJson(jsonString);
      }
    } catch (e) {
      print('Error retrieving cached weather data: $e');
    }
    return null;
  }

  @override
  Future<void> close() {
    _dio.close();
    return super.close();
  }
}

class WeatherData {
  final String region;
  final String country;
  final String conditionIcon;
  final String temperatureMax;

  WeatherData({
    required this.region,
    required this.country,
    required this.conditionIcon,
    required this.temperatureMax,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    final location = json['location'] ?? {};
    final forecastDay = (json['forecast']['forecastday'] ?? []).isNotEmpty
        ? json['forecast']['forecastday'][0]
        : {};
    final day = forecastDay['day'] ?? {};

    return WeatherData(
      region: location['region'] ?? 'N/A',
      country: location['country'] ?? 'N/A',
      conditionIcon: day['condition']?['icon'] ?? '',
      temperatureMax:
          '${day['maxtemp_c']?.toStringAsFixed(1) ?? 'N/A'} °C',
    );
  }
}
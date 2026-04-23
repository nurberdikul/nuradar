import 'package:dio/dio.dart';

class WeatherService {
  final Dio _dio;

  WeatherService({Dio? dio}) : _dio = dio ?? Dio();

  Future<String> getCurrentWeather() async {
    try {
      final response = await _dio.get(
        'https://api.open-meteo.com/v1/forecast',
        queryParameters: {
          'latitude': 43.2567,
          'longitude': 76.9286,
          'current_weather': true,
        },
      );

      final data = response.data;
      final current = data['current_weather'];
      if (current != null) {
        final temp = current['temperature'];
        if (temp is num) {
          final sign = temp > 0 ? '+' : '';
          return '$sign${temp.toStringAsFixed(0)}°C';
        }
      }
      return 'N/A';
    } catch (e) {
      return 'N/A';
    }
  }
}

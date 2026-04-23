import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/weather_service.dart';

part 'dashboard_providers.g.dart';

@riverpod
WeatherService weatherService(Ref ref) {
  return WeatherService();
}

@riverpod
Future<String> weather(Ref ref) async {
  final service = ref.watch(weatherServiceProvider);
  return service.getCurrentWeather();
}

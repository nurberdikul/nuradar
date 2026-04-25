import 'package:flutter/material.dart';
import '../../data/weather_service.dart';

class DashboardProvider extends ChangeNotifier {
  final WeatherService _weatherService = WeatherService();
  
  String? _weather;
  bool _isLoadingWeather = true;
  String? _weatherError;

  String? get weather => _weather;
  bool get isLoadingWeather => _isLoadingWeather;
  String? get weatherError => _weatherError;

  DashboardProvider() {
    loadWeather();
  }

  Future<void> loadWeather() async {
    _isLoadingWeather = true;
    _weatherError = null;
    notifyListeners();

    try {
      _weather = await _weatherService.getCurrentWeather();
    } catch (e) {
      _weatherError = e.toString();
    } finally {
      _isLoadingWeather = false;
      notifyListeners();
    }
  }
}

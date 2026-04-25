import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../../../tasks/domain/entities/task_entity.dart';

class MapProvider extends ChangeNotifier {
  Position? _position;
  bool _isLoading = true;
  String? _error;

  Position? get position => _position;
  bool get isLoading => _isLoading;
  String? get error => _error;

  MapProvider() {
    _initLocation();
  }

  Future<void> _initLocation() async {
    await updateLocation();
  }

  Future<void> updateLocation() async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      _position = await _determinePosition();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  TaskEntity? checkNearbyTasks(List<TaskEntity> tasks) {
    if (_position == null) return null;

    for (final task in tasks) {
      if (task.latitude != null && task.longitude != null && !task.isCompleted) {
        final distance = Geolocator.distanceBetween(
          _position!.latitude,
          _position!.longitude,
          task.latitude!,
          task.longitude!,
        );

        if (distance <= 100) {
          return task;
        }
      }
    }
    return null;
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Службы геолокации отключены.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Разрешение на геолокацию отклонено.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Разрешение на геолокацию отклонено навсегда.');
    }

    return await Geolocator.getCurrentPosition();
  }
}

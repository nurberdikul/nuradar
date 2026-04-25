import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../providers/map_provider.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mapProvider = context.watch<MapProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Радар мест')),
      body: Builder(
        builder: (context) {
          if (mapProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (mapProvider.error != null) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Ошибка получения геоданных:\n${mapProvider.error}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            );
          }

          final position = mapProvider.position;
          if (position == null) return const SizedBox.shrink();

          return GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 16.0,
            ),
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            markers: _getMockMarkers(),
          );
        },
      ),
    );
  }

  Set<Marker> _getMockMarkers() {
    return {
      const Marker(
        markerId: MarkerId('sdu_library'),
        position: LatLng(43.2078, 76.6698),
        infoWindow: InfoWindow(
          title: 'Тихая зона библиотеки SDU',
          snippet: 'Идеально для фокусировки',
        ),
      ),
      const Marker(
        markerId: MarkerId('class_204a'),
        position: LatLng(43.2081, 76.6692),
        infoWindow: InfoWindow(
          title: 'Свободная аудитория 204-A',
          snippet: 'Много розеток и тишина',
        ),
      ),
      const Marker(
        markerId: MarkerId('bean_there'),
        position: LatLng(43.2075, 76.6705),
        infoWindow: InfoWindow(
          title: 'Кофейня Bean There',
          snippet: 'Вкусный кофе и быстрый Wi-Fi',
        ),
      ),
    };
  }
}

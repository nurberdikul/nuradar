import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../providers/map_provider.dart';

class MapPage extends ConsumerWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final positionAsync = ref.watch(mapProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Радар мест')),
      body: positionAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Ошибка получения геоданных:\n$err',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.red),
            ),
          ),
        ),
        data: (position) {
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

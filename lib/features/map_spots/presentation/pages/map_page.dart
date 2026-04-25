import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../providers/map_provider.dart';

class MapPage extends StatefulWidget {
  final bool isPicker;

  const MapPage({super.key, this.isPicker = false});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  LatLng? _selectedLocation;

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

          return FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(position.latitude, position.longitude),
              initialZoom: 16.0,
              onTap: (tapPosition, point) {
                setState(() {
                  _selectedLocation = point;
                });
              },
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.focus_buddy',
              ),
              MarkerLayer(
                markers: [
                  ..._getMockMarkers(),
                  Marker(
                    point: LatLng(position.latitude, position.longitude),
                    width: 40,
                    height: 40,
                    child: const Icon(Icons.my_location, color: Colors.blue, size: 30),
                  ),
                  if (_selectedLocation != null)
                    Marker(
                      point: _selectedLocation!,
                      width: 40,
                      height: 40,
                      child: const Icon(Icons.location_pin, color: Colors.green, size: 40),
                    ),
                ],
              ),
            ],
          );
        },
      ),
      floatingActionButton: widget.isPicker && _selectedLocation != null
          ? FloatingActionButton.extended(
              onPressed: () {
                Navigator.pop(context, _selectedLocation);
              },
              label: const Text('Выбрать эту локацию'),
              icon: const Icon(Icons.check),
            )
          : null,
    );
  }

  List<Marker> _getMockMarkers() {
    return [
      const Marker(
        point: LatLng(43.2078, 76.6698),
        width: 40,
        height: 40,
        child: Icon(Icons.location_on, color: Colors.red, size: 40),
      ),
      const Marker(
        point: LatLng(43.2081, 76.6692),
        width: 40,
        height: 40,
        child: Icon(Icons.location_on, color: Colors.red, size: 40),
      ),
      const Marker(
        point: LatLng(43.2075, 76.6705),
        width: 40,
        height: 40,
        child: Icon(Icons.location_on, color: Colors.red, size: 40),
      ),
    ];
  }
}

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../domain/entities/task_entity.dart';

class TaskDetailPage extends StatelessWidget {
  final TaskEntity task;

  const TaskDetailPage({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Детали задачи')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (task.imageUrls.isNotEmpty)
              kIsWeb
                  ? Image.network(
                      task.imageUrls.first,
                      fit: BoxFit.cover,
                      height: 250,
                    )
                  : Image.file(
                      File(task.imageUrls.first),
                      fit: BoxFit.cover,
                      height: 250,
                    ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (task.category != null)
                    Chip(
                      label: Text(task.category!),
                      backgroundColor: Theme.of(
                        context,
                      ).colorScheme.primaryContainer,
                      side: BorderSide.none,
                    ),
                  const SizedBox(height: 16),
                  if (task.description.isNotEmpty) ...[
                    Text(
                      task.description,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 24),
                  ],
                  if (task.latitude != null && task.longitude != null) ...[
                    Text(
                      'Местоположение',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: SizedBox(
                        height: 250,
                        child: kIsWeb
                            ? Container(
                                color: Colors.grey[200],
                                alignment: Alignment.center,
                                child: const Text(
                                  'Карта здесь (Web версия требует API ключ)',
                                  style: TextStyle(color: Colors.black54),
                                ),
                              )
                            : GoogleMap(
                                initialCameraPosition: CameraPosition(
                                  target: LatLng(
                                    task.latitude!,
                                    task.longitude!,
                                  ),
                                  zoom: 15,
                                ),
                                markers: {
                                  Marker(
                                    markerId: MarkerId(task.id),
                                    position: LatLng(
                                      task.latitude!,
                                      task.longitude!,
                                    ),
                                  ),
                                },
                                zoomControlsEnabled: false,
                                mapToolbarEnabled: false,
                                myLocationButtonEnabled: false,
                                scrollGesturesEnabled: false,
                                tiltGesturesEnabled: false,
                                rotateGesturesEnabled: false,
                                zoomGesturesEnabled: false,
                              ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

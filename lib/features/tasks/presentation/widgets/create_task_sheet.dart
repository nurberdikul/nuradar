import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entities/task_entity.dart';
import '../../domain/entities/task_priority.dart';
import '../providers/task_provider.dart';

class CreateTaskSheet extends ConsumerStatefulWidget {
  const CreateTaskSheet({super.key});

  @override
  ConsumerState<CreateTaskSheet> createState() => _CreateTaskSheetState();
}

class _CreateTaskSheetState extends ConsumerState<CreateTaskSheet> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  String? _imagePath;
  double? _lat;
  double? _lng;
  TaskPriority _selectedPriority = TaskPriority.medium;

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  Future<void> _takePhoto() async {
    final picker = ImagePicker();
    // Обратите внимание: на некоторых платформах могут потребоваться разрешения
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _imagePath = pickedFile.path;
      });
    }
  }

  Future<void> _attachLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return;
    }
    if (permission == LocationPermission.deniedForever) return;

    final position = await Geolocator.getCurrentPosition();
    setState(() {
      _lat = position.latitude;
      _lng = position.longitude;
    });
  }

  void _createTask() {
    final title = _titleController.text.trim();
    if (title.isEmpty) return; // Можно добавить показ ошибки, если нужно

    final newTask = TaskEntity(
      id: const Uuid().v4(),
      title: title,
      description: _descController.text.trim(),
      dueDate: DateTime.now(),
      priority: _selectedPriority,
      isCompleted: false,
      imageUrls: _imagePath != null ? [_imagePath!] : const [],
      latitude: _lat,
      longitude: _lng,
      userId: FirebaseAuth.instance.currentUser?.uid,
    );

    ref.read(tasksProvider.notifier).addTask(newTask);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    // Получаем высоту клавиатуры для правильного отображения
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: EdgeInsets.only(
        bottom: bottomInset + 16,
        left: 16,
        right: 16,
        top: 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Создать задачу',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              labelText: 'Название задачи',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _descController,
            decoration: const InputDecoration(
              labelText: 'Описание',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
            minLines: 1,
          ),
          const SizedBox(height: 16),
          Text(
            'Приоритет',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Row(
            children: TaskPriority.values.map((priority) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ChoiceChip(
                  label: Text(
                    priority.name.toUpperCase(),
                    style: TextStyle(
                      color: _selectedPriority == priority
                          ? _getPriorityColor(priority)
                          : Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  selected: _selectedPriority == priority,
                  onSelected: (selected) {
                    if (selected) {
                      setState(() {
                        _selectedPriority = priority;
                      });
                    }
                  },
                  selectedColor: _getPriorityColor(priority).withValues(alpha: 0.3),
                  checkmarkColor: _getPriorityColor(priority),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          if (_imagePath != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(
                  File(_imagePath!),
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          TextButton.icon(
            onPressed: _takePhoto,
            icon: const Icon(Icons.camera_alt),
            label: const Text('Прикрепить конспект'),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: _attachLocation,
            icon: Icon(_lat != null ? Icons.location_on : Icons.location_off),
            label: Text(_lat != null ? 'Локация прикреплена' : 'Прикрепить локацию'),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
          const SizedBox(height: 12),
          FilledButton(
            onPressed: _createTask,
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text('Создать задачу', style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }

  Color _getPriorityColor(TaskPriority priority) {
    switch (priority) {
      case TaskPriority.high:
        return Colors.redAccent;
      case TaskPriority.medium:
        return Colors.orangeAccent;
      case TaskPriority.low:
        return Colors.lightBlue;
    }
  }
}

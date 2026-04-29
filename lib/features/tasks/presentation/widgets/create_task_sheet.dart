import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/ocr_service.dart';
import '../../../map_spots/presentation/pages/map_page.dart';
import '../../domain/entities/task_entity.dart';
import '../../domain/entities/task_priority.dart';
import '../providers/task_provider.dart';

class CreateTaskSheet extends StatefulWidget {
  const CreateTaskSheet({super.key});

  @override
  State<CreateTaskSheet> createState() => _CreateTaskSheetState();
}

class _CreateTaskSheetState extends State<CreateTaskSheet> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  final _milestoneController = TextEditingController();
  final List<String> _milestoneTitles = [];
  String? _imagePath;
  String? _recognizedText;
  bool _isProcessingOCR = false;
  double? _lat;
  double? _lng;
  TaskPriority _selectedPriority = TaskPriority.medium;
  int _selectedDuration = 25;
  final List<int> _durations = [15, 25, 50, 90];
  final _ocrService = OCRService();

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    _milestoneController.dispose();
    _ocrService.dispose();
    super.dispose();
  }

  Future<void> _takePhoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _imagePath = pickedFile.path;
        _isProcessingOCR = true;
      });

      try {
        final text = await _ocrService.recognizeText(File(pickedFile.path));
        setState(() {
          _recognizedText = text;
          if (text.isNotEmpty && _descController.text.isEmpty) {
            _descController.text = text;
          }
        });
      } catch (e) {
        // OCR failed, but we still want to continue
      } finally {
        setState(() {
          _isProcessingOCR = false;
        });
      }
    }
  }

  Future<void> _attachLocation() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MapPage(isPicker: true),
      ),
    );
    if (result != null) {
      setState(() {
        _lat = result.latitude;
        _lng = result.longitude;
      });
    }
  }

  void _addMilestone() {
    final text = _milestoneController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _milestoneTitles.add(text);
        _milestoneController.clear();
      });
    }
  }

  void _removeMilestone(int index) {
    setState(() {
      _milestoneTitles.removeAt(index);
    });
  }

  void _createTask() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final title = _titleController.text.trim();

    final newTask = TaskEntity(
      id: const Uuid().v4(),
      title: title,
      description: _descController.text.trim(),
      dueDate: DateTime.now(),
      priority: _selectedPriority,
      isCompleted: false,
      imageUrls: _imagePath != null ? [_imagePath!] : const [],
      milestones: _milestoneTitles
          .map(
            (title) =>
                Milestone(id: const Uuid().v4(), title: title, isDone: false),
          )
          .toList(),
      recognizedText: _recognizedText,
      latitude: _lat,
      longitude: _lng,
      plannedDuration: _selectedDuration,
      userId: FirebaseAuth.instance.currentUser?.uid,
    );

    context.read<TaskProvider>().addTask(newTask);
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
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Создать задачу',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Название задачи',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Введите название задачи';
                  }
                  return null;
                },
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
              style: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
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
                    selectedColor: _getPriorityColor(
                      priority,
                    ).withValues(alpha: 0.3),
                    checkmarkColor: _getPriorityColor(priority),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            // Duration Section
            Text(
              'Время фокуса',
              style: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: _durations.map((duration) {
                return ChoiceChip(
                  label: Text(
                    '$duration мин',
                    style: TextStyle(
                      color: _selectedDuration == duration
                          ? AppTheme.primaryLight
                          : Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  selected: _selectedDuration == duration,
                  onSelected: (selected) {
                    if (selected) {
                      setState(() {
                        _selectedDuration = duration;
                      });
                    }
                  },
                  selectedColor: AppTheme.primaryLight.withValues(alpha: 0.2),
                  checkmarkColor: AppTheme.primaryLight,
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            // Milestones Section
            Text(
              'Шаги к цели',
              style: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _milestoneController,
                    decoration: const InputDecoration(
                      hintText: 'Что нужно сделать?',
                      isDense: true,
                    ),
                    onSubmitted: (_) => _addMilestone(),
                  ),
                ),
                IconButton(
                  onPressed: _addMilestone,
                  icon: const Icon(Icons.add_circle_outline),
                  color: AppTheme.primaryColor,
                ),
              ],
            ),
            if (_milestoneTitles.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  children: _milestoneTitles.asMap().entries.map((entry) {
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      visualDensity: VisualDensity.compact,
                      leading: const Icon(Icons.circle, size: 8),
                      title: Text(entry.value),
                      trailing: IconButton(
                        icon: const Icon(Icons.close, size: 16),
                        onPressed: () => _removeMilestone(entry.key),
                      ),
                    );
                  }).toList(),
                ),
              ),
            const SizedBox(height: 16),
            if (_imagePath != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        File(_imagePath!),
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    if (_isProcessingOCR)
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                  ],
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
              label: Text(
                _lat != null ? 'Локация прикреплена' : 'Прикрепить локацию',
              ),
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
      ),
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

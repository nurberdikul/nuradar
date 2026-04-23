import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/presentation/pages/main_screen.dart';
import 'core/theme/app_theme.dart';
import 'features/tasks/presentation/pages/task_list_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Инициализация Hive и открытие локальной БД
  await Hive.initFlutter();
  await Hive.openBox('offline_tasks');

  // Инициализация Firebase
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e, st) {
    log(
      'Не удалось инициализировать Firebase. '
      'Возможно, отсутствует google-services.json или GoogleService-Info.plist.',
      error: e,
      stackTrace: st,
      name: 'Main',
    );
  }


  runApp(const ProviderScope(child: FocusBuddyApp()));
}

class FocusBuddyApp extends StatelessWidget {
  const FocusBuddyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'nuradar',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const MainScreen(),
    );
  }
}

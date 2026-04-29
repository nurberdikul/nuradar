import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:provider/provider.dart';

import 'core/presentation/pages/main_screen.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'features/auth/presentation/providers/auth_provider.dart';
import 'features/tasks/presentation/providers/task_provider.dart';
import 'features/map_spots/presentation/providers/map_provider.dart';
import 'features/dashboard/presentation/providers/dashboard_providers.dart';
import 'features/tasks/data/models/task_model.dart';
import 'features/tasks/domain/entities/task_priority.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Инициализация Hive и открытие локальной БД
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  Hive.registerAdapter(MilestoneModelAdapter());
  Hive.registerAdapter(TaskPriorityAdapter());
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

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => TaskProvider()),
        ChangeNotifierProvider(create: (_) => MapProvider()),
        ChangeNotifierProvider(create: (_) => DashboardProvider()),
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
      ],
      child: const FocusBuddyApp(),
    ),
  );
}

class FocusBuddyApp extends StatelessWidget {
  const FocusBuddyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    return MaterialApp(
      title: 'nuradar',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: authProvider.isLoading
          ? const Scaffold(body: Center(child: CircularProgressIndicator()))
          : authProvider.user != null
              ? const MainScreen()
              : const LoginPage(),
    );
  }
}

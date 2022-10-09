import 'dart:io';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:restr/src/constants/constants.dart';
import 'package:restr/src/routing/routing.dart';
import 'package:restr/src/services/background_service.dart';
import 'package:restr/src/services/local/hive_helper.dart';
import 'package:restr/src/shared/helper/notification_helper.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
Future<void> main() async {
  await Hive.initFlutter();
  await HiveHelper.init();
  WidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer();
  final notificationHelper = container.read(notificationProvider);
  final BackgroundService service = BackgroundService();
  service.initializeIsolate();
  if (Platform.isAndroid) {
    await AndroidAlarmManager.initialize();
  }
  await notificationHelper.initNotifications(flutterLocalNotificationsPlugin);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routeInformationParser: goRouter.routeInformationParser,
          routeInformationProvider: goRouter.routeInformationProvider,
          routerDelegate: goRouter.routerDelegate,
          title: 'Restr',
          theme: ThemeData(
            scaffoldBackgroundColor: AppThemes.scaffoldColor,
            primarySwatch: Colors.green,
          ),
        ),
      ),
    );
  }
}

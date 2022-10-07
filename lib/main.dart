import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:restr/src/constants/constants.dart';
import 'package:restr/src/routing/app_routes.dart';
import 'package:restr/src/services/local/hive_helper.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await HiveHelper.init();
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
            scaffoldBackgroundColor: AppThemes.white,
            primarySwatch: Colors.green,
          ),
        ),
      ),
    );
  }
}

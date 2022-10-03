import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restr/src/constants/constants.dart';
import 'package:restr/src/routing/app_routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  initState() {
    _navigateOtherScreen();
    super.initState();
  }

  void _navigateOtherScreen() {
    Future.delayed(const Duration(seconds: 3)).then(
      (_) => context.goNamed(Routes.home.name),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.scaffoldColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Resources.restrIcon,
              width: 80,
              height: 80,
            ),
            Gap.h12,
            Text(
              'Restr',
              style: AppThemes.headline1,
            ),
          ],
        ),
      ),
    );
  }
}

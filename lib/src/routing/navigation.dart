import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class Navigation {
  static intentWithData(String routeName, Object arguments) {
    navigatorKey.currentContext?.goNamed(routeName, extra: arguments);
  }

  static back() => navigatorKey.currentContext?.pop();
}

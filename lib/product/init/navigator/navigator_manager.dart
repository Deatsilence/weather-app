import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class NavigatorManager {
  NavigatorManager._();

  static NavigatorManager instance = NavigatorManager._();

  void go(BuildContext context, {required String route, Object? extras}) {
    // GoRouter.of(context).goNamed(route);
    context.go(route);
  }
}

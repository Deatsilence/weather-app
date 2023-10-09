import 'package:f_weather/product/init/navigator/navigator_routes.dart';
import 'package:f_weather/product/state/theme_state_manager.dart';
import 'package:f_weather/product/views/root.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
      name: "MyApp",
      builder: (_) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: GetThemeStateManager.themeStateManager.theme,
          routerConfig: NavigatorRoutes().router,
          builder: (context, child) {
            return const Root();
          },
        );
      },
    );
  }
}

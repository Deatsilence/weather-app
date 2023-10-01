import 'package:f_weather/product/constants/enums/navigate_routes_enum.dart';
import 'package:f_weather/product/extensions/navigate_routes_extension.dart';
import 'package:f_weather/product/views/home.dart';
import 'package:f_weather/product/views/search_places.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// The code defines a class called `NavigatorRoutes` that encapsulates the navigation routes and pages
/// for a Flutter application.
final class NavigatorRoutes {
  /// The code is creating an instance of the `NavigatorRoutes` class and initializing its `_router`
  /// property with a `GoRouter` object. The `GoRouter` object is configured with the following
  /// parameters:
  NavigatorRoutes()
      : _router = GoRouter(
          routes: _items,
          errorBuilder: (context, state) => const Scaffold(
            body: Center(
              child: Text('Page not found'),
            ),
          ),
        );

  final GoRouter _router;

  /// The `static final _items` is a list of `GoRoute` objects that define the navigation routes and
  /// their corresponding builders. Each `GoRoute` object represents a specific route in the application.
  static final _items = [
    GoRoute(
      path: NavigateRoutes.home.justParaph,
      builder: (context, state) => const Home(),
    ),
    GoRoute(
      path: NavigateRoutes.search.withParaph,
      builder: (context, state) => const SearchPlaces(),
    ),
  ];
  static const List<Widget> _navPages = [
    Home(),
    SearchPlaces(),
  ];

  GoRouter get router => _router;
  List<Widget> get navPages => _navPages;
}

import 'package:flutter/material.dart';

/// In Dart, the `@immutable` annotation is used to indicate that a class and its properties are
/// immutable, meaning they cannot be changed once they are created.
@immutable
final class PaddingManager {
  static const double commonHorizontal = 16;
  static const double commonVertical = 18;
  static const double horizontalOfBottomNavigationBar = 50;
  static const double onlyBottomOfBottomNavigationBar = 20;
  static const double onlyTopOfBottomNavigationBar = 16;
  static const double onlyTopOfSearchTextField = 40;
  static const double onlyTopOfSearchPlacesText = 8;
  static const double onlyLeftOfTempOfPlace = 5;
  static const double onlyBottomOfTempOfPlace = 5;
  static const double onlyRightOfIconOfWeather = 32;
}

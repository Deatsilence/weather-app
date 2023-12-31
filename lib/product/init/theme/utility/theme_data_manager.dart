import 'package:f_weather/product/init/theme/utility/color_manager.dart';
import 'package:flutter/material.dart';

@immutable
final class ThemeDataManager {
  /// The `darkTheme` getter in the `CustomThemeData` class is returning a `ThemeData` object that defines
  /// the visual appearance of the app when using a dark theme.
  ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      dividerTheme: DividerThemeData(
        color: ColorManager.lightPrimaryColor,
      ),
      cardTheme: CardTheme(
        color: ColorManager.darkSecondaryColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        hintStyle: const TextStyle(
          fontSize: 14,
        ),
        filled: true,
        fillColor: ColorManager.darkSecondaryColor,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: ColorManager.activeColor,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: ColorManager.lightPrimaryColor,
            width: 2,
          ),
        ),
      ),
      colorScheme: const ColorScheme.dark().copyWith(
        primary: ColorManager.lightPrimaryColor,
      ),
      scaffoldBackgroundColor: ColorManager.darkPrimaryColor,
      appBarTheme: AppBarTheme(
        backgroundColor: ColorManager.transparentColor,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        unselectedItemColor: ColorManager.inactiveColor,
        selectedItemColor: ColorManager.activeColor,
        backgroundColor: ColorManager.darkSecondaryColor,
        elevation: 10,
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: ColorManager.lightPrimaryColor,
        ),
        titleMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: ColorManager.lightPrimaryColor,
        ),
        titleSmall: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: ColorManager.lightPrimaryColor,
        ),
        bodySmall: TextStyle(fontSize: 14, color: ColorManager.lightPrimaryColor, fontWeight: FontWeight.bold),
      ),
    );
  }

  /// The `lightTheme` getter in the `CustomThemeData` class is returning a `ThemeData` object that
  /// defines the visual appearance of the app when using a light theme.
  ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      dividerTheme: DividerThemeData(
        color: ColorManager.darkPrimaryColor,
      ),
      cardTheme: CardTheme(
        color: ColorManager.lightSecondaryColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        hintStyle: const TextStyle(
          fontSize: 14,
        ),
        filled: true,
        fillColor: ColorManager.lightSecondaryColor,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: ColorManager.activeColor,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: ColorManager.darkSecondaryColor,
            width: 2,
          ),
        ),
      ),
      colorScheme: const ColorScheme.light().copyWith(
        primary: ColorManager.darkPrimaryColor,
      ),
      scaffoldBackgroundColor: ColorManager.lightPrimaryColor,
      appBarTheme: AppBarTheme(
        backgroundColor: ColorManager.transparentColor,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        unselectedItemColor: ColorManager.inactiveColor,
        selectedItemColor: ColorManager.activeColor,
        backgroundColor: ColorManager.lightSecondaryColor,
        elevation: 10,
        selectedIconTheme: IconThemeData(
          color: ColorManager.darkPrimaryColor,
        ),
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: ColorManager.darkPrimaryColor,
        ),
        titleMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: ColorManager.darkPrimaryColor,
        ),
        titleSmall: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: ColorManager.darkPrimaryColor,
        ),
        bodySmall: TextStyle(
          fontSize: 14,
          color: ColorManager.darkPrimaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

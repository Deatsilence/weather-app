import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

/// The code is defining a class called `ColorManager` with four static properties: `darkPrimaryColor`,
/// `lightPrimaryColor`, `darkSecondaryColor`, and `lightSecondaryColor`. These properties are of type
/// `Color` and are assigned specific color values using the `HexColor` class.
@immutable
final class ColorManager {
  static Color darkPrimaryColor = HexColor('#0a0C1D');
  static Color lightPrimaryColor = HexColor('#FAFFFC');
  static Color darkSecondaryColor = HexColor('#17182B');
  static Color lightSecondaryColor = HexColor('#9AA8A8');
  static Color activeColor = HexColor('#0199FB');
  static Color inactiveColor = Colors.grey.shade700;
  static Color transparentColor = Colors.transparent;
}

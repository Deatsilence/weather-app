import 'package:flutter/material.dart';

/// The code is defining a class called `BorderRadiusManager` with the `@immutable` annotation, which
/// means that instances of this class cannot be changed once they are created.
@immutable
final class BorderRadiusManager {
  static const BorderRadius commonAllBorderRadius = BorderRadius.all(
    Radius.circular(20),
  );
}

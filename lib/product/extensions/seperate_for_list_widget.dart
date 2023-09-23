import 'package:flutter/material.dart';

extension ListGutterExtension on List<Widget> {
  List<Widget> seperate({double space = 5, Axis direction = Axis.vertical}) => length <= 1
      ? this
      : sublist(1).fold(
          [first],
          (r, element) =>
              [...r, direction == Axis.vertical ? SizedBox(height: space) : SizedBox(width: space), element],
        );
}

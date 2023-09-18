import 'package:flutter/material.dart';

extension CustomPadding on Widget {
  allPadding({double val = 8.0}) => Padding(
        padding: EdgeInsets.all(val),
        child: this,
      );
  symmetricpadding({double vertical = 0.0, double horizontal = 0.0}) => Padding(
        padding: EdgeInsets.symmetric(
          vertical: vertical,
          horizontal: horizontal,
        ),
        child: this,
      );
  onlyPadding({double left = 0.0, double top = 0.0, double right = 0.0, double bottom = 0.0}) => Padding(
        padding: EdgeInsets.only(
          left: left,
          top: top,
          right: right,
          bottom: bottom,
        ),
        child: this,
      );
}

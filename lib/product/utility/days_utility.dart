import 'package:flutter/material.dart';

@immutable
final class DaysUtility {
  final _days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
  List<String> get days => _days;
}

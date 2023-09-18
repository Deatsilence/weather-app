import 'package:flutter/material.dart';

class CurrentPlace extends StatefulWidget {
  const CurrentPlace({super.key});

  @override
  State<CurrentPlace> createState() => _CurrentPlaceState();
}

class _CurrentPlaceState extends State<CurrentPlace> {
  @override
  Widget build(BuildContext context) {
    debugPrint("CurrentPlace build");
    return const Scaffold();
  }
}

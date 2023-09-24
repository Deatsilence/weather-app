import 'package:flutter/material.dart';

class CurrentPlace extends StatefulWidget {
  const CurrentPlace({super.key});

  @override
  State<CurrentPlace> createState() => _CurrentPlaceState();
}

class _CurrentPlaceState extends State<CurrentPlace> {
  List<int> list = [];
  int a = 5;

  @override
  Widget build(BuildContext context) {
    debugPrint("CurrentPlace build");

    Future<void> refresh() async {
      setState(() {
        // list = [...list, ...List.generate(10, (index) => index + list.length)];
        a *= 2;
      });
    }

    return Scaffold(
      body: RefreshIndicator.adaptive(
        onRefresh: refresh,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: SizedBox(
            height: 1000,
            width: 500,
            child: Center(
              child: Text(a.toString()),
            ),
          ),
        ),
      ),
    );
  }
}

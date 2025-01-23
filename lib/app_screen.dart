import 'package:flutter/material.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({super.key, required this.screen});
  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Write Turns'),
        ),
        body: screen,
      ),
    );
  }
}

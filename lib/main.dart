import 'package:flutter/material.dart';
import 'package:write_turns/app_screen.dart';
import 'package:write_turns/screens/writing_screen.dart';
import 'package:flutter_reactive_value/flutter_reactive_value.dart';

final currentScreen = ReactiveValueNotifier(WritingScreen());

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppScreen(
        screen: currentScreen.value,
      ),
    );
  }
}

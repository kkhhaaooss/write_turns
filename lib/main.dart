import 'package:flutter/material.dart';
import 'package:write_turns/app_screen.dart';
import 'package:write_turns/screens/writing_screen.dart';

final currentScreen = WritingScreen();

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppScreen(
        screen: WritingScreen(),
      ),
    );
  }
}

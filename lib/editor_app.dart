import 'package:flutter/material.dart';
import 'package:write_turns/app_screen.dart';

class EditorApp extends StatelessWidget {
  const EditorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Editor App',
      home: AppScreen(),
    );
  }
}

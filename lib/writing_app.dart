import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:write_turns/app_screen.dart';

class WritingApp extends StatelessWidget {
  const WritingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Write Turns',
      theme: FlexThemeData.light(scheme: FlexScheme.brandBlue),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.brandBlue),
      // Use dark or light theme based on system setting.
      themeMode: ThemeMode.system,
      home: AppScreen(),
    );
  }
}

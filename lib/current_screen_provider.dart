import 'package:write_turns/start_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

final currentScreenProvider = StateProvider<Widget>((ref) {
  return StartScreen();
});

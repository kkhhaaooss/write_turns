import 'package:write_turns/screens/editor_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

final currentScreenProvider = StateProvider<Widget>((ref) {
  return EditorScreen();
});

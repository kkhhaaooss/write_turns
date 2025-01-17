import 'package:flutter/material.dart';
import 'package:write_turns/writing_app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const EditorApp()));
}

import 'package:flutter/material.dart';
import 'package:write_turns/providers/current_screen_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppScreen extends ConsumerWidget {
  const AppScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget currentScreen = ref.watch(currentScreenProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Write Turns'),
        centerTitle: true,
      ),
      body: currentScreen,
    );
  }
}

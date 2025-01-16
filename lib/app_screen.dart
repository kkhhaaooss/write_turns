import 'package:flutter/material.dart';
import 'package:write_turns/providers/current_screen_provider.dart';
import 'package:write_turns/providers/last_paragraph_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppScreen extends ConsumerWidget {
  const AppScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget currentScreen = ref.watch(currentScreenProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Editor App'),
      ),
      body: currentScreen,
      floatingActionButton: FloatingActionButton(
        // The read method is a utility to read a provider without listening to it
        onPressed: () => ref.read(lastParagraphProvider.notifier).state =
            'This is the new last paragraph. That is all.',
        child: const Icon(Icons.add),
      ),
    );
  }
}

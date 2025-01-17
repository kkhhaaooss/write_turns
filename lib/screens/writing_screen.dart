import 'package:flutter/material.dart';
import 'package:write_turns/providers/last_paragraph_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditorScreen extends ConsumerWidget {
  const EditorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late TextEditingController controller;
    controller = TextEditingController();
    late FocusNode textNode;
    textNode = FocusNode();
    String lastParagraph = ref.watch(lastParagraphProvider);
    return SizedBox(
      width: double.infinity,
      child: Center(
        child: Column(
          children: [
            Text(lastParagraph),
            TextField(
              controller: controller,
              canRequestFocus: true,
              autofocus: true,
              focusNode: textNode,
              onSubmitted: (String value) {
                ref.read(lastParagraphProvider.notifier).state = value;
                value = '';
                textNode
                    .requestFocus(); // pretty sure this needs to be a stateful widget for this to work
              },
            ),
            Text('Another widget'),
          ],
        ),
      ),
    );
  }
}

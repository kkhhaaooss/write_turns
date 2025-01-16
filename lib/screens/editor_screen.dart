import 'package:flutter/material.dart';
import 'package:write_turns/providers/last_paragraph_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StartScreen extends ConsumerWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Consumer(builder: (_, WidgetRef ref, __) {
          final lastParagraph = ref.watch(lastParagraphProvider);

          return Text(lastParagraph);
        }),
        TextField(
          // textInputAction: TextInputAction.,
          onSubmitted: (String value) {
            // print('Go button clicked.');
            ref.read(lastParagraphProvider.notifier).state = value;
          },
        ),
        Text('Another widget'),
      ],
    );
  }
}

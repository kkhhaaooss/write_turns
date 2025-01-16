import 'package:flutter/material.dart';
import 'package:write_turns/last_paragraph_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer(builder: (_, WidgetRef ref, __) {
          final lastParagraph = ref.watch(lastParagraphProvider);

          return Text(lastParagraph);
        }),
        TextField(
          // textInputAction: TextInputAction.,
          onSubmitted: (value) {
            print('Go button clicked.');
          },
        ),
        Text('Another widget'),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_reactive_value/flutter_reactive_value.dart';
import 'package:write_turns/controllers/storage.dart';
import 'package:write_turns/screens/widgets/writing_screen/current_paragraph.dart';
import 'package:write_turns/screens/widgets/writing_screen/last_paragraph.dart';
import 'package:write_turns/screens/widgets/writing_screen/oops_button.dart';
import 'package:write_turns/screens/widgets/writing_screen/pause_button.dart';
import 'package:write_turns/screens/widgets/writing_screen/progress_bar.dart';
import 'package:write_turns/screens/widgets/writing_screen/timer.dart';

final previousParagraph = ReactiveValueNotifier('');
final lastParagraph = ReactiveValueNotifier('Last Paragraph');
final writingEnabled = ReactiveValueNotifier(true);
final writeOrPause = ReactiveValueNotifier('Pause');
final oopsFlag = ReactiveValueNotifier(false);
final Storage storage = Storage();
final FocusNode textFocus = FocusNode();
final TextEditingController textController = TextEditingController();
final TextEditingController lastController = TextEditingController();

class WritingScreen extends StatelessWidget {
  const WritingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              LastParagraph(),
              Timer(),
              OopsButton(),
              CurrentParagraph(),
              PauseButton(),
              ProgressBar(),
            ],
          ),
        ),
      ),
    );
  }
}

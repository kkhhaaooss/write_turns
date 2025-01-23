import 'package:flutter/material.dart';
import 'package:write_turns/screens/writing_screen.dart';

class PauseButton extends StatelessWidget {
  const PauseButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // TODO Refocus to CurrentParagraph when going from pause to write mode.

      onPressed: () {
        writingEnabled.value = !writingEnabled.value;
        (writeOrPause.value == 'Pause')
            ? writeOrPause.value = 'Write!'
            : writeOrPause.value = 'Pause';
      },
      child: Text(writeOrPause.reactiveValue(context)),
    );
  }
}

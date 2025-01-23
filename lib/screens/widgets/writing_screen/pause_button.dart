import 'package:flutter/material.dart';
import 'package:write_turns/screens/writing_screen.dart';

class PauseButton extends StatelessWidget {
  const PauseButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        writingEnabled.value = !writingEnabled.value;
      },
      // TODO: Fix this button so it rebuilds when writingEnabled value is changed.
      child: Text(writingEnabled.value == false ? 'Write!' : 'Pause'),
    );
  }
}

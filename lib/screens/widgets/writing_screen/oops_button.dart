import 'package:flutter/material.dart';
import 'package:write_turns/screens/writing_screen.dart';

class OopsButton extends StatelessWidget {
  const OopsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      //TODO: Fix logic so that previousParagraph isn't replaced if you Oops! twice in a row.
      onPressed: () {
        // oopsFlag.reactiveValue(context) = !oopsFlag.reactiveValue(context);
        textController.text = lastParagraph.value;
        lastController.text = previousParagraph.value;
      },
      child: Text('Oops!'),
    );
  }
}

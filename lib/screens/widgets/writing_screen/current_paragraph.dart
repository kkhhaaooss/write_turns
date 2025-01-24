import 'package:flutter/material.dart';
import 'package:write_turns/screens/writing_screen.dart';

class CurrentParagraph extends StatelessWidget {
  const CurrentParagraph({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      canRequestFocus: true,
      expands: false,
      focusNode: textFocus,
      controller: textController,
      minLines: 8,
      maxLines: 8,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 8.0,
          ),
        ),
      ),
      style: const TextStyle(
        color: Colors.black,
        fontSize: 18,
      ),
      enabled: writingEnabled.reactiveValue(context),
      onChanged: (value) {
        if (value.contains('\n')) {
          storage.writeFile('$value\r\n');
          textController.clear();
          previousParagraph.value = lastParagraph.value;
          lastParagraph.value = value;
        }
      },
    );
  }
}

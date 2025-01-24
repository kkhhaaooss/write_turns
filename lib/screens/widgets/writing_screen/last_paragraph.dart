import 'package:flutter/material.dart';
import 'package:write_turns/screens/writing_screen.dart';

class LastParagraph extends StatelessWidget {
  const LastParagraph({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Uses reactiveValue to put the last paragraph entered as the text for the LastParagraph widget
    lastController.text = lastParagraph.reactiveValue(context);
    // Make the last paragraph text selectable
    lastController.selection =
        TextSelection(baseOffset: 0, extentOffset: lastController.text.length);
    return Expanded(
      child: Builder(
        builder: (subContext) {
          textFocus.requestFocus();
          return TextFormField(
            controller: lastController,
            autofocus: false,
            readOnly: true,
            minLines: 8,
            maxLines: 8,
            // initialValue: lastParagraph.reactiveValue(context),
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 5.0,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

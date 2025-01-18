import 'package:flutter/material.dart';
import 'package:write_turns/control/document_storage.dart';
import 'package:write_turns/providers/last_paragraph_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditorScreen extends ConsumerWidget {
  const EditorScreen({super.key, required this.storage});
  final DocumentStorage storage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isTextFieldEnabled = true;
    // will deal with focus later...
    late TextEditingController controller;
    controller = TextEditingController();
    late FocusNode textNode;
    textNode = FocusNode();
    String lastParagraph = ref.watch(lastParagraphProvider);
    return SizedBox(
      width: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.all(8.0),
                child: Text(
                  lastParagraph,
                  textAlign: TextAlign.left,
                  softWrap: true,
                  style: TextStyle(),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: TextField(
                enabled: isTextFieldEnabled,
                keyboardType: TextInputType.multiline,
                minLines: 10,
                maxLines: 10,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 5.0,
                    ),
                  ),
                ),
                controller: controller,
                canRequestFocus: true,
                autofocus: true,
                focusNode: textNode,
                // Put clear and file save in onChanged because onSubmitted stopped working after changing to multiline textfield.
                onChanged: (String value) {
                  if (value.contains(String.fromCharCode(13)) ||
                      value.contains(String.fromCharCode(10))) {
                    ref.read(lastParagraphProvider.notifier).state = value;
                    storage.writeFile(value);
                    controller.clear();
                  }
                },
                onSubmitted: (String value) {
                  ref.read(lastParagraphProvider.notifier).state = value;
                  storage.writeFile(value);
                  controller.clear();
                  // textNode.requestFocus(); // pretty sure this needs to be a stateful widget for this to work
                },
              ),
            ),
            Text('Timer widget goes here.'),
            // Temporary solution to test saving files until I get save on Enter working again.
          ],
        ),
      ),
    );
  }
}

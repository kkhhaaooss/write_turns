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
    // late TextEditingController controller;
    // controller = TextEditingController();
    // late FocusNode textNode;
    // textNode = FocusNode();
    String lastParagraph = ref.watch(lastParagraphProvider);
    return SizedBox(
      width: double.infinity,
      child: Center(
        child: Column(
          children: [
            Text(lastParagraph),
            TextField(
              enabled: isTextFieldEnabled,
              keyboardType: TextInputType.multiline,
              minLines: 10,
              maxLines: 10,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                color: Colors.white,
                width: 5.0,
              ))),
              // controller: controller,
              canRequestFocus: true,
              autofocus: true,
              // focusNode: textNode,
              onChanged: (String value) {
                print(value == '\n' ? 'Enter detected, submit' : 'xXx');
              },
              onSubmitted: (String value) {
                ref.read(lastParagraphProvider.notifier).state = value;
                storage.writeFile(value);
                value = '';
                // textNode.requestFocus(); // pretty sure this needs to be a stateful widget for this to work
              },
            ),
            Text('Another widget'),
          ],
        ),
      ),
    );
  }
}

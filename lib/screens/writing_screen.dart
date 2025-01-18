import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:write_turns/providers/last_paragraph_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';

class DocumentStorage {
  // temporary String, the currentDocument value will eventually be stored in shared prefs
  String currentDocument = 'testfile.txt';
  Future<String> get _localPath async {
    final directory = await getExternalStorageDirectory();
    return directory == null ? '' : directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$currentDocument');
  }

  Future<File> writeFile(String contents) async {
    final file = await _localFile;
    return file.writeAsString('$contents\n', mode: FileMode.append);
  }

  Future<String> readFile() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();
      return contents;
    } catch (e) {
      return 'The current document is empty.';
    }
  }
}

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

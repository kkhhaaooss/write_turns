import 'dart:io';

import 'package:path_provider/path_provider.dart';

class DocumentStorage {
  // temporary String, the currentDocument value will eventually be stored in shared prefs
  String currentDocument = 'testfile.txt';
  Future<String> get _localPath async {
    final Directory? directory;
    Platform.isAndroid
        ? directory = await getExternalStorageDirectory()
        : directory = await getApplicationDocumentsDirectory();
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

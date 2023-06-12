import 'dart:io';

import 'package:path_provider/path_provider.dart';

class DiskStorage {
  Future<Directory> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    // final tempDir = await getTemporaryDirectory();
    // final externalStorage = await getExternalStorageDirectory();
    // final listExternalStorage = await getExternalStorageDirectories();
    // final externalCacheStorage = await getExternalCacheDirectories();
    // final applicationSpDir = await getApplicationSupportDirectory();
    return directory;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('${path.path}/test.txt');
  }

  Future<String> readFile() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();
      return contents;
    } catch (e) {
      return "";
    }
  }

  Future<File> writeFile(String text) async {
    final file = await _localFile;
    return file.writeAsString(text);
  }
}

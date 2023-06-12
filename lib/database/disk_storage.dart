import 'dart:io';

import 'package:path_provider/path_provider.dart';

class DiskStorage {
  static int numberFile = 0;

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
    print("👉: $path");
    return File('${path.path}/test$numberFile.txt');
  }

  Future<List<File>> getAllFilesInDirectory() async {
    final pathDir = await _localPath;
    if (await pathDir.exists()) {
      final files = await pathDir.list().toList();
      final fileList = <File>[];

      for (var file in files) {
        if (file is File) {
          fileList.add(file);
        }
      }
      return fileList;
    } else {
      return [];
    }
  }

  Future<File> getSpecificFile(int index) async {
    final path = await _localPath;
    print("👉: $path");
    return File("${path.path}/test$index.txt");
  }

  Future<String> readSpecificFile(int index) async {
    try {
      final file = await getSpecificFile(index);
      final contents = await file.readAsString();
      return contents;
    } catch (e) {
      return "";
    }
  }

  Future<String> readFile(File file) async {
    try {
      final contents = await file.readAsString();
      return contents;
    } catch (e) {
      return "";
    }
  }

  Future<File> writeSpecificFile(String text, int index) async {
    final file = await getSpecificFile(index);
    return file.writeAsString(text);
  }

  Future<File> writeNewFile(String text) async {
    final file = await getSpecificFile(numberFile);
    numberFile = numberFile + 1;
    return file.writeAsString(text);
  }
}

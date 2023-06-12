import 'dart:io';

import 'package:flutter/material.dart';
import 'package:testing/database/disk_storage.dart';

class HomeProvider extends ChangeNotifier {
  List<File> _files = [];
  List<String> _contents = [];
  String _dynamicContent = "";

  List<File> get files => _files;
  List<String> get contents => _contents;
  String get dynamicContent => _dynamicContent;

  set files(List<File> value) {
    _files = value;
    notifyListeners();
  }

  set contents(List<String> value) {
    _contents = value;
    notifyListeners();
  }

  set dynamicContent(String value) {
    _dynamicContent = value;
    notifyListeners();
  }
}

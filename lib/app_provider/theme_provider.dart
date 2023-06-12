import 'package:flutter/material.dart';
import 'package:testing/configs/app_color.dart';
import 'package:testing/database/shared_preference.dart';
import 'package:testing/model/screen_theme.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDark = false;

  ThemeProvider() {
    getThemeFromSharedPreference();
    notifyListeners();
  }

  bool get isDark => _isDark;

  void getThemeFromSharedPreference() async {
    _isDark = await SharedPreference.getStateTheme();
    notifyListeners();
  }

  void changeTheme() {
    _isDark = !_isDark;
    SharedPreference.saveStateTheme(_isDark);
    notifyListeners();
  }
}

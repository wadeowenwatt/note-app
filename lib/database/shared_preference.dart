import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static void saveStateTheme(bool isDark) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setBool("isDarkTheme", isDark);
    } catch (e) {
      print("🥵: $e");
    }
  }

  static Future<bool> getStateTheme() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      return pref.getBool("isDarkTheme") ?? false;
    } catch (e) {
      print("🥵: $e");
      return false;
    }
  }
}
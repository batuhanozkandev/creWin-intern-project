import 'package:shared_preferences/shared_preferences.dart';

class CwSharedPreferences {
  static Future<void> init() async {
    await SharedPreferences.getInstance();
  }

  static setInt({required String key, required int value}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt(key, value);
  }

  static setBool({required String key, required bool value}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(key, value);
  }

  static setDouble({required String key, required double value}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setDouble(key, value);
  }

  static setString({required String key, required String value}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(key, value);
  }

  static get({required String key}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.containsKey(key)) {
      preferences.get(key);
    }
  }
}

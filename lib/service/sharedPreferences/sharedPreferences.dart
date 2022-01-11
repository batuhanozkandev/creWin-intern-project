import 'package:shared_preferences/shared_preferences.dart';

class CwSharedPreferences {
  static late SharedPreferences preferences;

  static Future init() async =>
      preferences = await SharedPreferences.getInstance();

  static setInt({required String key, required int value}) async {
    preferences.setInt(key, value);
  }

  static setBool({required String key, required bool value}) async {
    preferences.setBool(key, value);
  }

  static setDouble({required String key, required double value}) async {
    preferences.setDouble(key, value);
  }

  static setString({required String key, required String value}) async {
    preferences.setString(key, value);
  }

  static int? getInt({required String key})  {
    if (preferences.containsKey(key)) {
      return preferences.getInt(key);
    }
  }

  static String? getString({required String key}) {
    if (preferences.containsKey(key)) {
      return preferences.getString(key);
    }
  }

  // static setDouble({required String key, required double value}) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   preferences.setDouble(key, value);
  // }

  // static setString({required String key, required String value}) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   preferences.setString(key, value);
  // }

  // static get({required String key}) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   if (preferences.containsKey(key)) {
  //     preferences.get(key);
  //   }
  // }
}

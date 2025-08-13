import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static Future<void> saveData({required key, required  value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static Future<String?> getData(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? saved = prefs.getString(key);
    // print('${saved ?? 'No TOKEN'} have been cached');
    return saved;
  }

  static Future<void> clearData(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  // Uncomment if you want to save a list
  // static Future<void> saveList(String storageKey, List<dynamic> storageValue) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setStringList(storageKey, storageValue.map((item) => item.toString()).toList());
  // }
}
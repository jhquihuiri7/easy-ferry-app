import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences? _prefs;

  // Initialize SharedPreferences
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Ensure initialization before accessing
  static SharedPreferences get _instance {
    if (_prefs == null) {
      throw Exception('SharedPrefs must be initialized before use. Call SharedPrefs.init() first.');
    }
    return _prefs!;
  }

  // Save methods
  static Future<bool> setString(String key, String value) async {
    return await _instance.setString(key, value);
  }

  static Future<bool> setInt(String key, int value) async {
    return await _instance.setInt(key, value);
  }

  static Future<bool> setBool(String key, bool value) async {
    return await _instance.setBool(key, value);
  }

  static Future<bool> setStringList(String key, List<String> value) async {
    return await _instance.setStringList(key, value);
  }

  // Get methods
  static String? getString(String key) {
    return _instance.getString(key);
  }

  static int? getInt(String key) {
    return _instance.getInt(key);
  }

  static bool? getBool(String key) {
    return _instance.getBool(key);
  }

  static List<String>? getStringList(String key) {
    return _instance.getStringList(key);
  }

  // Remove and clear methods
  static Future<bool> remove(String key) async {
    return await _instance.remove(key);
  }

  static Future<bool> clear() async {
    return await _instance.clear();
  }

  // Check if key exists
  static bool containsKey(String key) {
    return _instance.containsKey(key);
  }
}
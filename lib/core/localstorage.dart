import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  // check exists
  static Future<bool> checkIfKeyExists(String key) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var exists = _prefs.containsKey(key);
    return exists;
  }

  // get string
  static Future getString(String key, {String defValue = ''}) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.getString(key) ?? defValue;
  }
  
  // put string
  static Future putString(String key, String value) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.setString(key, value);
  }

  // delete key
  static Future deleteValue(String key) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.remove(key);
  }
}

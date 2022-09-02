import 'package:shared_preferences/shared_preferences.dart';

class SpUtil {
  static SharedPreferences? prefs;
  static Future<bool> getInstance() async {
     prefs = await SharedPreferences.getInstance();
     return true;
  }

}
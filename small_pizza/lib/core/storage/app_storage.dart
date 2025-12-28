import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
  static const _introSeen = 'intro_seen';

  static Future<void> setIntroSeen() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_introSeen, true);
  }

   static Future<bool> isIntroSeen() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_introSeen) ?? false;
  }
}

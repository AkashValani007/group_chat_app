import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AppPreference {
  static final Future<SharedPreferences> appPref =
      SharedPreferences.getInstance();

  static var accessToken = 'accessToken';
  static var attemptCount = 'attemptCount';

  static Future<int?> getAttemptCount() async {
    return getIntFromSF(attemptCount);
  }

  Future<void> addStringToSF(String mKey, String mValue) async {
    final mPref = await appPref;
    final base64String = base64Encode(utf8.encode(mValue));
    await mPref.setString(mKey, base64String);
  }

  Future<String?> getStringFromSF(String mKey) async {
    final mPref = await appPref;
    final base64String = mPref.getString(mKey);
    if (base64String != null) {
      return utf8.decode(base64Decode(base64String));
    }
    return null;
  }

  static Future<void> addIntToSF(String mKey, int mValue) async {
    final mPref = await appPref;
    final base64String = base64Encode(utf8.encode(mValue.toString()));
    await mPref.setString(mKey, base64String);
  }

  static Future<int?> getIntFromSF(String mKey) async {
    final mPref = await appPref;
    final base64String = mPref.getString(mKey);
    if (base64String != null) {
      return int.tryParse(utf8.decode(base64Decode(base64String)));
    }
    return null;
  }

  static Future<void> removeToSF(String mKey) async {
    final mPref = await appPref;
    await mPref.remove(mKey);
  }

  static Future<void> clearSharedPreferences() async {
    final mPref = await appPref;
    await mPref.clear();
  }
}

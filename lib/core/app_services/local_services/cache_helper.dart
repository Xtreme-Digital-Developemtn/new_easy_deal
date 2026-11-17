
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    // قيمة null كانت بتوصل لـ setStringList وترمي TypeError جوه Future
    // محدش شايفه، والنتيجة إن المفتاح يفضل بقيمته القديمة (مثلاً brokerId
    // بتاع وسيط سابق لما يدخل عميل). بنمسح المفتاح بدل كده.
    if (value == null) return await sharedPreferences.remove(key);
    if (value is String) return await sharedPreferences.setString(key, value);
    if (value is int) return await sharedPreferences.setInt(key, value);
    if (value is bool) return await sharedPreferences.setBool(key, value);
    if (value is double) return await sharedPreferences.setDouble(key, value);
    if (value is List<String>) {
      return await sharedPreferences.setStringList(key, value);
    }
    if (value is List) {
      return await sharedPreferences.setStringList(
        key,
        value.map((e) => e.toString()).toList(),
      );
    }
    // أي نوع تاني بنخزنه كنص بدل استثناء مكتوم.
    return await sharedPreferences.setString(key, value.toString());
  }

  static dynamic getData({
    required String key,
  }) {
    return sharedPreferences.get(key);
  }

  static dynamic getListOFData({
    required String key,
  }) {
    return sharedPreferences.getStringList(key);
  }

  static Future<bool> removeData({
    required String key,
  }) async {
    return await sharedPreferences.remove(key);
  }

  static Future<void> clearData() async {
    await sharedPreferences.clear();
  }
}
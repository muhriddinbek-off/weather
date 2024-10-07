import 'package:shared_preferences/shared_preferences.dart';

class StorageRepository {
  static final StorageRepository instance = StorageRepository._();
  static SharedPreferences? _preferences;

  StorageRepository._() {
    _init();
  }

  factory StorageRepository() => instance;

  Future<void> _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> setString({
    required String key,
    required String value,
  }) async {
    if (_preferences != null) {
      _preferences!.setString(key, value);
    }
  }

  static String getString({
    required String key,
  }) {
    if (_preferences != null) {
      return _preferences!.getString(key) ?? '';
    }
    return '';
  }
}

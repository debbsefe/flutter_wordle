import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AppCache {
  ///save string to storage
  Future<void> saveString(String key, String value);

  ///retrieve string from storage
  String? retrieveString(String key);

  ///save boolean to storage
  Future<void> saveBool(String key, bool value);

  ///retrieve boolean from storage
  bool? retrieveBool(String key);
}

@LazySingleton(as: AppCache)
class AppCacheImpl implements AppCache {
  AppCacheImpl(this.pref);

  final SharedPreferences pref;

  @override
  Future<void> saveString(String key, String value) async {
    await pref.setString(key, value);
  }

  @override
  String? retrieveString(String key) {
    return pref.getString(key);
  }

  @override
  Future<void> saveBool(String key, bool value) async {
    await pref.setBool(key, value);
  }

  @override
  bool? retrieveBool(String key) {
    return pref.getBool(key);
  }
}

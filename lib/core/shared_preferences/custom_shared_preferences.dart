import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_all_topics/core/errors/exceptions.dart';

/// An abstraction for interacting with SharedPreferences
/// allowing custom implementations.
abstract class CustomSharedPreferences {
  // Setters
  Future<void> setInt({required String key, required int value});
  Future<void> setBool({required String key, required bool value});
  Future<void> setDouble({required String key, required double value});
  Future<void> setString({required String key, required String value});
  Future<void> setStringList(
      {required String key, required List<String> value});

  // Getters
  int getInt({required String key});
  bool getBool({required String key});
  double getDouble({required String key});
  String getString({required String key});
  List<String> getStringList({required String key});

  // Removal
  Future<bool> remove({required String key});
}

/// A custom implementation of SharedPreferences
/// utilizing the SharedPreferences package.
class CustomSharedPreferencesImpl extends CustomSharedPreferences {
  final SharedPreferences sharedPreferences;

  /// Creates an instance of [CustomSharedPreferencesImpl] with
  /// a provided [sharedPreferences] instance.
  CustomSharedPreferencesImpl({required this.sharedPreferences});

  @override
  bool getBool({required String key}) {
    return _handleGetError(sharedPreferences.getBool(key));
  }

  @override
  double getDouble({required String key}) {
    return _handleGetError(sharedPreferences.getDouble(key));
  }

  @override
  int getInt({required String key}) {
    return _handleGetError(sharedPreferences.getInt(key));
  }

  @override
  String getString({required String key}) {
    return _handleGetError(sharedPreferences.getString(key));
  }

  @override
  List<String> getStringList({required String key}) {
    return _handleGetError(sharedPreferences.getStringList(key));
  }

  @override
  Future<void> setBool({required String key, required bool value}) async {
    return await _handleSetError(sharedPreferences.setBool(key, value));
  }

  @override
  Future<void> setDouble({required String key, required double value}) async {
    return await _handleSetError(sharedPreferences.setDouble(key, value));
  }

  @override
  Future<void> setInt({required String key, required int value}) async {
    return await _handleSetError(sharedPreferences.setInt(key, value));
  }

  @override
  Future<void> setString({required String key, required String value}) async {
    return await _handleSetError(sharedPreferences.setString(key, value));
  }

  @override
  Future<void> setStringList(
      {required String key, required List<String> value}) async {
    return await _handleSetError(sharedPreferences.setStringList(key, value));
  }

  @override
  Future<bool> remove({required String key}) async {
    try {
      return await sharedPreferences.remove(key);
    } catch (e) {
      throw CacheException();
    }
  }

  /// Handles errors for get methods,
  /// throwing a [CacheException] if the value is null.
  dynamic _handleGetError(value) {
    if (value != null) {
      return value;
    } else {
      throw CacheException();
    }
  }

  /// Handles errors for set methods, throwing a [CacheException] on error.
  Future<void> _handleSetError(Future<dynamic> function) async {
    try {
      await function;
    } catch (e) {
      throw CacheException();
    }
  }
}

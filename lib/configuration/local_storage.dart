import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nur_mobile/configuration/app_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class StorageStrategy {
  Future<bool> save(String key, dynamic value);

  Future<dynamic> read(String key);

  Future<bool> remove(String key);

  Future<void> clear();
}

class AppLocalStorageCached {
  static final _log = AppLogger.getLogger("AppLocalStorageCached");
  static late String? jwtToken;
  static late List<String>? roles;
  static late String? language;
  static late String? username;
  static late String? theme;

  static Future<void> loadCache() async {
    _log.trace("Loading cache");
    jwtToken = await AppLocalStorage().read(StorageKeys.jwtToken.name);
    roles = await AppLocalStorage().read(StorageKeys.roles.name);
    language = await AppLocalStorage().read(StorageKeys.language.name) ?? "en";
    username = await AppLocalStorage().read(StorageKeys.username.name);
    theme = await AppLocalStorage().read(StorageKeys.theme.name) ??
        AdaptiveThemeMode.light.name;
    _log.trace(
        "Loaded cache with username:{}, roles:{}, language:{}, jwtToken:{}, theme:{}",
        [username, roles, language, jwtToken, theme]);
  }
}

enum StorageKeys { jwtToken, roles, language, username, theme }

class SharedPreferencesStrategy implements StorageStrategy {
  static final _log = AppLogger.getLogger("AppLocalStorage");

  static final SharedPreferencesStrategy _instance =
      SharedPreferencesStrategy._internal();

  SharedPreferencesStrategy._internal();

  factory SharedPreferencesStrategy() {
    _log.trace("Creating AppLocalStorage instance");
    return _instance;
  }

  SharedPreferences? _prefsInstance;

  @visibleForTesting
  void setPreferencesInstance(SharedPreferences prefs) {
    _prefsInstance = prefs;
  }

  Future<SharedPreferences> get _prefs async =>
      _prefsInstance ??= await SharedPreferences.getInstance();

  @override
  Future<bool> save(String key, dynamic value) async {
    _log.trace("Saving data to local storage {} {}", [key, value]);
    final prefs = await _prefs;
    try {
      if (value is String) {
        prefs.setString(key, value);
      } else if (value is int) {
        prefs.setInt(key, value);
      } else if (value is double) {
        prefs.setDouble(key, value);
      } else if (value is bool) {
        prefs.setBool(key, value);
      } else if (value is List<String>) {
        prefs.setStringList(key, value);
      } else {
        throw Exception("Unsupported value type");
      }

      await AppLocalStorageCached.loadCache();
      _log.trace("Saved data to local storage {} {}", [key, value]);
      return true;
    } catch (e) {
      _log.error("Error saving data to local storage: {}, {}", [key, e]);
      return false;
    }
  }

  @override
  Future<dynamic> read(String key) async {
    _log.trace("Reading data from local storage");
    final prefs = await _prefs;
    final result = prefs.get(key);
    return result;
  }

  @override
  Future<bool> remove(String key) async {
    _log.trace("Removing data from local storage");
    try {
      final prefs = await _prefs;
      prefs.remove(key);
      await AppLocalStorageCached.loadCache();
      _log.trace("Removed data from local storage {}", [key]);
      return true;
    } catch (e) {
      _log.error("Error removing data from local storage: {}, {}", [key, e]);
      return false;
    }
  }

  @override
  Future<void> clear() async {
    _log.info("Clearing all data from local storage");
    final prefs = await _prefs;
    prefs.clear();
    await AppLocalStorageCached.loadCache();
    _log.info("Cleared all data from local storage");
  }
}

enum StorageType { sharedPreferences }

class AppLocalStorage {
  static final _log = AppLogger.getLogger("AppLocalStorage");
  static final AppLocalStorage _instance = AppLocalStorage._internal();

  late StorageStrategy _strategy;

  AppLocalStorage._internal() {
    _log.trace("Creating AppLocalStorage instance");
    _strategy = SharedPreferencesStrategy();
  }

  factory AppLocalStorage() => _instance;

  void setStorage(StorageType type) {
    _log.trace("Setting storage strategy to {}", [type]);
    switch (type) {
      case StorageType.sharedPreferences:
        _strategy = SharedPreferencesStrategy();
        break;
    }
  }

  Future<bool> save(String key, dynamic value) async {
    final result = await _strategy.save(key, value);
    await AppLocalStorageCached.loadCache();
    return result;
  }

  Future<dynamic> read(String key) async {
    return await _strategy.read(key);
  }

  Future<bool> remove(String key) async {
    final result = await _strategy.remove(key);
    await AppLocalStorageCached.loadCache();
    return result;
  }

  Future<void> clear() async {
    await _strategy.clear();
    await AppLocalStorageCached.loadCache();
  }
}

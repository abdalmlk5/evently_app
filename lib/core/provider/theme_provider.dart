import 'package:evently_app/core/cache/cache_helper.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.values[CacheHelper.getThemeMode() ?? 0];

  static ThemeProvider? instance;

  ThemeProvider() {
    instance = this;
  }

  bool isDark() {
    if (themeMode == ThemeMode.system) {
      return WidgetsBinding.instance.platformDispatcher.platformBrightness ==
          Brightness.dark;
    }
    return themeMode == ThemeMode.dark;
  }

  void changeThemeMode(ThemeMode mode) {
    if (themeMode == mode) {
      return;
    }
    themeMode = mode;
    notifyListeners();
    CacheHelper.saveThemeMode(value: mode.index);
  }
}

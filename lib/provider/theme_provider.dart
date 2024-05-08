import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;
  Color _primaryColor = lightTheme.primaryColor;

  bool get isDarkMode => _isDarkMode;
  Color get primaryColor => _primaryColor;

  ThemeProvider() {
    loadThemeSettings();
  }

  Future<void> loadThemeSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    int primaryColorValue =
        prefs.getInt('primaryColor') ?? lightTheme.primaryColor.value;
    _primaryColor = Color(primaryColorValue);
    notifyListeners();
  }

  void setDarkMode(bool value) async {
    _isDarkMode = value;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', value);

    if (!value) {
      _primaryColor = lightTheme.primaryColor;
      await prefs.setInt('primaryColor', lightTheme.primaryColor.value);
    }

    notifyListeners();
  }

  void setPrimaryColor(Color color) async {
    _primaryColor = color;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('primaryColor', color.value);
    notifyListeners();
  }

  ThemeData get themeData => _isDarkMode
      ? darkTheme.copyWith(
          appBarTheme: const AppBarTheme(
            color: Colors.black,
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.black,
          ),
        )
      : lightTheme.copyWith(
          appBarTheme: AppBarTheme(
            color: _primaryColor,
            iconTheme: const IconThemeData(color: Colors.white),
          ),
        );
}

final lightTheme = ThemeData(
  brightness: Brightness.light,
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
);

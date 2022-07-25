import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class ThemeManager with ChangeNotifier{

  ThemeManager._privateConstructor();
  static final ThemeManager _instance = ThemeManager._privateConstructor();
  factory ThemeManager() => _instance;

  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;
  toggleTheme(bool isDark){
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
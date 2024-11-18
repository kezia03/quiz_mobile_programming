import 'package:flutter/material.dart';
import '../models/theme_model.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _currentTheme = themes[0].themeData;
  String _currentFont = themes[0].font;

  ThemeData get currentTheme => _currentTheme;
  String get currentFont => _currentFont;

  void changeTheme(int index) {
    _currentTheme = themes[index].themeData;
    notifyListeners();
  }

  void changeFont(String font) {
    _currentFont = font;
    notifyListeners();
  }

  static final List<ThemeModel> themes = [
    ThemeModel(
      themeData: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.blue[100],
      ),
      font: 'Roboto',
    ),
    ThemeModel(
      themeData: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.green[100],
      ),
      font: 'Open Sans', // Ganti Lobster menjadi Open Sans
    ),
    ThemeModel(
      themeData: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.purple[100],
      ),
      font: 'Poppins',
    ),
  ];
}

import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF6F35A5);

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.yellow,
  Colors.purple,
  Colors.orange,
  Colors.pink,
  Colors.teal,
];

class AppTheme {
  final int selectedColor;
  final bool isDark;

  AppTheme({required this.selectedColor, required this.isDark})
      : assert(selectedColor >= 0 && selectedColor < _colorThemes.length, 
            'Invalid color index');

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
      brightness: isDark ? Brightness.dark : Brightness.light,
    );
  }
}

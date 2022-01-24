import 'package:flutter/material.dart';

class Strings {
  static const String theme = 'theme';
  static const String darkTheme = 'darkTheme';
  static const String lightTheme = 'lightTheme';
  static const String fontDmSans = 'lightTheme';
}

extension TextThemeExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}

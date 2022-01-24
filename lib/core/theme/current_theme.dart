import 'package:flutter/material.dart';
import 'package:wordle/core/theme/custom_theme.dart';
import 'package:wordle/core/utils/strings.dart';

class CurrentTheme {
  final String name;
  final ThemeData theme;

  CurrentTheme({required this.name, required this.theme});
}

CurrentTheme getCurrentTheme(bool value) {
  switch (value) {
    case true:
      return CurrentTheme(
          name: Strings.darkTheme, theme: CustomTheme.darkThemeData);
    default:
      return CurrentTheme(
          name: Strings.lightTheme, theme: CustomTheme.lightThemeData);
  }
}

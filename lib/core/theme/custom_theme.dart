import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:wordle/dependency_injection.dart';

import '../cache/app_cache.dart';
import 'package:wordle/core/utils/strings.dart';

final themeProvider = StateNotifierProvider<CustomTheme, ThemeData>((ref) {
  return di<CustomTheme>();
});

@LazySingleton()
class CustomTheme extends StateNotifier<ThemeData> {
  CustomTheme(this.appCache)
      : super(

            ///check current theme at app start
            /// and pass to the super-constructor
            appCache.retrieveString(Strings.theme) == Strings.darkTheme
                ? CustomTheme.darkThemeData
                : CustomTheme.lightThemeData);
  final AppCache appCache;

  ///change the theme by passing selected themeData and name of the theme
  void changeTheme(ThemeData themeData, String name) {
    if (state != themeData) {
      state = themeData;
      appCache.saveString(Strings.theme, name);
    }
  }

  static const Color scaffoldLight = Color(0xFFFFF9FA);
  static const Color scaffoldDark = Color(0xFF0D0D0D);

  ///colors
  static const Color primaryColor = Color(0xFF8C1B2F);

  ///theme data

  static ThemeData lightThemeData = ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: Strings.fontDmSans,
      scaffoldBackgroundColor: scaffoldLight,
      brightness: Brightness.light,
      primaryColor: primaryColor,
      textTheme: lightTextTheme);

  static ThemeData darkThemeData = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: Strings.fontDmSans,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: scaffoldDark,
    brightness: Brightness.dark,
    primaryColor: scaffoldLight,
    textTheme: darkTextTheme,
  );

  static TextTheme darkTextTheme = const TextTheme(
    headline1: headline1Dark,
    headline2: headline2Dark,
  );

  static TextTheme lightTextTheme = const TextTheme(
    headline1: headline1Light,
    headline2: headline2Light,
  );

  static const TextStyle headline1Light = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 32,
    color: Colors.black,
  );

  static const TextStyle headline1Dark = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 32,
    color: Colors.grey,
  );

  static const TextStyle headline2Light = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 24,
    color: Colors.black,
  );

  static const TextStyle headline2Dark = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 24,
    color: Colors.grey,
  );
}

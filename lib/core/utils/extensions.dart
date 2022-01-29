import 'dart:math';

import 'package:flutter/material.dart';

extension TextThemeExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension RandomListItem<T> on List<T> {
  T randomItem() {
    final random = Random();

    return this[random.nextInt(length)];
  }
}

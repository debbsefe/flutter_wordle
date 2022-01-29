import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wordle/core/theme/current_theme.dart';
import 'package:wordle/core/theme/custom_theme.dart';
import 'package:wordle/core/utils/extensions.dart';

class DarkModeTileWidget extends ConsumerWidget {
  const DarkModeTileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    return SwitchListTile(
      contentPadding: EdgeInsets.zero,
      value: theme.brightness == Brightness.dark ? true : false,
      title: Text(
        'Dark Mode',
        style: context.textTheme.headline6,
      ),
      onChanged: (value) {
        handleSwitch(ref: ref, value: getCurrentTheme(value));
      },
    );
  }
}

void handleSwitch({
  required WidgetRef ref,
  required CurrentTheme value,
}) async {
  ref.read(themeProvider.notifier).changeTheme(value.theme, value.name);
}

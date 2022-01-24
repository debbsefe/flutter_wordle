import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:wordle/core/theme/custom_theme.dart';
import 'package:wordle/core/utils/strings.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Settings',
                style: context.textTheme.headline1,
              ),
              IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: const Icon(
                    Icons.cancel,
                    color: Colors.grey,
                  )),
            ],
          ),
          const DarkModeTile(),
        ],
      ),
    );
  }
}

class DarkModeTile extends ConsumerWidget {
  const DarkModeTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    return SwitchListTile(
      value: theme.brightness == Brightness.dark ? true : false,
      title: const Text(
        'Dark Mode',
      ),
      onChanged: (value) {
        handleSwitch(ref: ref, value: getCurrentTheme(value));
      },
    );
  }
}

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

void handleSwitch({
  required WidgetRef ref,
  required CurrentTheme value,
}) async {
  ref.read(themeProvider.notifier).changeTheme(value.theme, value.name);
}

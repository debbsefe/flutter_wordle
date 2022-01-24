import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:wordle/core/theme/current_theme.dart';
import 'package:wordle/core/theme/custom_theme.dart';
import 'package:wordle/core/utils/strings.dart';
import 'package:wordle/my_flutter_app_icons.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 30.0),
        child: Center(
          child: SizedBox(
            width: 500,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Settings'.toUpperCase(),
                      style: context.textTheme.headline2,
                    ),
                    const SizedBox(width: 200),
                    IconButton(
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () {
                          context.pop();
                        },
                        icon: const Icon(
                          MyFlutterApp.close,
                          size: 14,
                          color: Colors.grey,
                        )),
                  ],
                ),
                const SizedBox(height: 50),
                const DarkModeTile(),
                const Divider(),
              ],
            ),
          ),
        ),
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
      hoverColor: Colors.transparent,
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

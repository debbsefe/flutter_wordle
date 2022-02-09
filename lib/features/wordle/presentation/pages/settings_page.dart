import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wordle/core/utils/extensions.dart';
import 'package:wordle/features/wordle/presentation/widgets/dark_mode_tile_widget.dart';
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
                        onPressed: () async {
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
                const DarkModeTileWidget(),
                const Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

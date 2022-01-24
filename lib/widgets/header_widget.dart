import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wordle/core/utils/strings.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Wordle'.toUpperCase(),
              style: context.textTheme.headline1,
            ),
            const SizedBox(width: 200),
            IconButton(
                onPressed: () async {
                  context.push('/settings');
                },
                icon: const Icon(
                  Icons.settings,
                  color: Colors.grey,
                ))
          ],
        ),
        const Divider(),
      ],
    );
  }
}

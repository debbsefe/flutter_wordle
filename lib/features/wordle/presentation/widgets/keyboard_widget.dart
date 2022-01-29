import 'package:flutter/material.dart';
import 'package:wordle/features/wordle/data/models/keyboard_model.dart';
import 'package:wordle/core/utils/extensions.dart';

class KeyboardWidget extends StatefulWidget {
  const KeyboardWidget({Key? key}) : super(key: key);

  @override
  State<KeyboardWidget> createState() => _KeyboardWidgetState();
}

class _KeyboardWidgetState extends State<KeyboardWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        child: Column(
          children: [
            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: keyBoardCharacters
                    .getRange(0, 10)
                    .map((e) => _buildKeyboardItem(e))
                    .toList(),
              ),
            ),
            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: keyBoardCharacters
                    .getRange(10, 19)
                    .map((e) => _buildKeyboardItem(e))
                    .toList(),
              ),
            ),
            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: keyBoardCharacters
                    .getRange(19, 28)
                    .map((e) => _buildKeyboardItem(e))
                    .toList(),
              ),
            )
          ],
        ));
  }

  Widget _buildKeyboardItem(KeyBoardModel index) {
    return index.key == 'ENTER'
        ? Container(
            decoration: BoxDecoration(
                color: index.color, borderRadius: BorderRadius.circular(5)),
            margin: const EdgeInsets.all(3),
            height: 60,
            width: 65,
            child: Center(
                child: Text(
              index.key,
              style: context.textTheme.headline6?.copyWith(color: Colors.white),
            )),
          )
        : index.key == 'CLOSE'
            ? Container(
                decoration: BoxDecoration(
                    color: index.color, borderRadius: BorderRadius.circular(5)),
                margin: const EdgeInsets.all(3),
                height: 60,
                width: 65,
                child: Center(
                    child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.cancel_presentation,
                    color: Colors.white,
                  ),
                )),
              )
            : Container(
                decoration: BoxDecoration(
                    color: index.color, borderRadius: BorderRadius.circular(5)),
                margin: const EdgeInsets.all(3),
                height: 60,
                width: 50,
                child: Center(
                    child: Text(
                  index.key,
                  style: context.textTheme.headline6
                      ?.copyWith(color: Colors.white),
                )),
              );
  }
}

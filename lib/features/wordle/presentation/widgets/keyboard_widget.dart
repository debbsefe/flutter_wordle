import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wordle/core/utils/extensions.dart';
import 'package:wordle/features/wordle/data/models/keyboard_model.dart';
import 'package:wordle/features/wordle/presentation/view_models/selected_letters_view_model.dart';
import 'package:wordle/features/wordle/presentation/view_models/valid_word_view_model.dart';

class KeyboardWidget extends ConsumerWidget {
  const KeyboardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
        height: context.height(0.25),
        child: Column(
          children: [
            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: keyBoardCharacters.getRange(0, 10).map((e) {
                  return GestureDetector(
                      onTap: () {
                        onKeyTapped(ref, e);
                      },
                      child: _buildKeyboardItem(e, context));
                }).toList(),
              ),
            ),
            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: keyBoardCharacters.getRange(10, 19).map((e) {
                  return GestureDetector(
                      onTap: () {
                        onKeyTapped(ref, e);
                      },
                      child: _buildKeyboardItem(e, context));
                }).toList(),
              ),
            ),
            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: keyBoardCharacters.getRange(19, 28).map((e) {
                  return GestureDetector(
                      onTap: () {
                        onKeyTapped(ref, e);
                      },
                      child: _buildKeyboardItem(e, context));
                }).toList(),
              ),
            )
          ],
        ));
  }

  void onKeyTapped(WidgetRef ref, KeyBoardModel model) async {
    if (model.key == 'ENTER') {
      var fiveWords = ref.read(selectLettersProvider).firstFiveLetters;

      var isValidWord = await ref
          .read(validWordProvider.notifier)
          .isValidWord(fiveWords.join());
      if (isValidWord!) {
        var allLetters = ref.read(selectLettersProvider).allLetters;

        var end = allLetters.length - 1;
        var start = end - 4;

        ref.read(selectLettersProvider.notifier).modify(start, end, fiveWords);
      } else {
        // print('not a valid word');
      }
    } else if (model.key == 'DELETE') {
      ref.read(selectLettersProvider.notifier).remove();
    } else {
      ref.read(selectLettersProvider.notifier).set(model.key);
    }
  }

  Widget _buildKeyboardItem(KeyBoardModel index, BuildContext context) {
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
        : index.key == 'DELETE'
            ? Container(
                decoration: BoxDecoration(
                    color: index.color, borderRadius: BorderRadius.circular(5)),
                margin: const EdgeInsets.all(3),
                height: 60,
                width: 65,
                child: const Center(
                    child: Icon(
                  Icons.cancel_presentation,
                  color: Colors.white,
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

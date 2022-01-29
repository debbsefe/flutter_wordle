import 'package:flutter/material.dart';
import 'package:wordle/core/utils/extensions.dart';
import 'package:wordle/features/wordle/data/models/keyboard_model.dart';

class KeyBoardLetterWidget extends StatelessWidget {
  const KeyBoardLetterWidget({Key? key, required this.index}) : super(key: key);
  final KeyBoardModel index;
  @override
  Widget build(BuildContext context) {
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

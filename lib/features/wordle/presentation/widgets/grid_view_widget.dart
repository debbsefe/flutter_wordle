import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wordle/core/utils/extensions.dart';
import 'package:wordle/features/wordle/presentation/view_models/selected_letters_view_model.dart';

final gridList = List.generate(30, (index) => index);

class GridViewWidget extends ConsumerWidget {
  const GridViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: context.height(0.4),
      width: context.width(0.6),
      child: GridView.count(
        crossAxisSpacing: 7,
        mainAxisSpacing: 7,
        crossAxisCount: 5,
        children: gridList.map((e) {
          var provider = ref.watch(selectLettersProvider);
          var letters = provider.allLetters;
          return Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                  color: letters.length > e
                      ? letters[e].color
                      : Colors.transparent,
                  border: Border.all(color: Colors.grey.shade800)),
              child: Center(
                  child: Text(letters.length > e ? letters[e].value! : '')));
        }).toList(),
      ),
    );
  }
}

Color getBackGroundColor(String letter, int index) {
  var actualIndex = index > 5
      ? index - 5
      : index > 10
          ? index - 10
          : index > 15
              ? index - 15
              : index;

  var word = 'rooms'.split('');

  if (word.contains(letter) && word[actualIndex] == letter) {
    return Colors.green;
  } else if (word.contains(letter)) {
    return Colors.yellow;
  } else {
    return Colors.grey;
  }
  // switch (index) {
  //   case 1:
  //     break;
  //   case 2:
  //     break;
  //   case 3:
  //     break;
  //   case 4:
  //     break;
  //   case 5:
  //     break;
  //   case 6:
  //     break;
  //   case 7:
  //     break;
  //   default:
  // }
}

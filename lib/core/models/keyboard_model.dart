import 'package:flutter/material.dart';

class KeyBoardModel {
  final String key;
  bool? isSelected;
  Color? color;

  KeyBoardModel(
      {this.color = Colors.grey, required this.key, this.isSelected = false});
}

const characters = [
  'Q',
  'W',
  'E',
  'R',
  'T',
  'Y',
  'U',
  'I',
  'O',
  'P',
  'A',
  'S',
  'D',
  'F',
  'G',
  'H',
  'J',
  'K',
  'L',
  'ENTER',
  'Z',
  'X',
  'C',
  'V',
  'B',
  'N',
  'M',
  'CLOSE'
];

final keyBoardCharacters = characters.map((character) {
  return KeyBoardModel(key: character);
}).toList();

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:wordle/dependency_injection.dart';

@LazySingleton()
class SelectedLettersViewModel extends ChangeNotifier {
  final _firstFiveLetters = <String>[];
  final _allLetters = <AllLettersModel>[];
  List<String> get firstFiveLetters => _firstFiveLetters;
  List<AllLettersModel> get allLetters => _allLetters;

  void set(String value) async {
    if (_firstFiveLetters.length < 5) {
      _firstFiveLetters.add(value);
      _allLetters.add(AllLettersModel(value: value));
      notifyListeners();
    }
  }

  void modify(int start, int end, List<String> letters) {
    letters.mapIndexed((index, value) {
      var letter = value.toLowerCase();
      var word = 'rooms'.split('');
      Color color;
      if (word.contains(letter) && word[index] == letter) {
        color = Colors.green;
        _allLetters[index + start].color = Colors.green;
      } else if (word.contains(letter)) {
        color = Colors.yellow;
        _allLetters[index + start].color = color;
      } else {
        color = Colors.grey;
        _allLetters[index + start].color = color;
      }
    }).toList();
    clearFirstFive();

    notifyListeners();
  }

  void remove() async {
    if (_firstFiveLetters.isNotEmpty) {
      _firstFiveLetters.removeLast();
      _allLetters.removeLast();
      notifyListeners();
    }
  }

  void clearFirstFive() async {
    _firstFiveLetters.clear();
    notifyListeners();
  }
}

final selectLettersProvider = ChangeNotifierProvider((ref) {
  return di<SelectedLettersViewModel>();
});

class AllLettersModel {
  String? value;
  Color? color;

  AllLettersModel({this.value, this.color});
}

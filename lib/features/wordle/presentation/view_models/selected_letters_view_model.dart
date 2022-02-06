import 'package:collection/collection.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:wordle/core/theme/custom_theme.dart';
import 'package:wordle/dependency_injection.dart';
import 'package:wordle/features/wordle/data/models/keyboard_model.dart';

@LazySingleton()
class SelectedLettersViewModel extends ChangeNotifier {
  final _firstFiveLetters = <String>[];
  final _allLetters = <AllLettersModel>[];
  final List<KeyBoardModel> _keyBoardCharacters = keyBoardModel;
  final _controllers = List.generate(30, (index) => FlipCardController());
  final _speed = List.generate(30, (index) {
    var remainder = index % 5;
    var speed = remainder == 0 ? 1000 : (500 + (remainder * 500));
    return speed;
  });

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  List<String> get firstFiveLetters => _firstFiveLetters;
  List<AllLettersModel> get allLetters => _allLetters;
  List<KeyBoardModel> get keyBoardCharacters => _keyBoardCharacters;
  List<FlipCardController> get controllers => _controllers;
  List<int> get speed => _speed;

  void setErrorMessage(String errorMessage) {
    _errorMessage = errorMessage;
    notifyListeners();

    Future.delayed(const Duration(milliseconds: 2000), () {
      _errorMessage = null;
      notifyListeners();
    });
  }

  void set(String value) async {
    if (_firstFiveLetters.length < 5) {
      _firstFiveLetters.add(value);
      _allLetters.add(AllLettersModel(value: value));
      notifyListeners();
    }
  }

  void modify(int start, List<String> letters, String wordForToday) {
    letters.mapIndexed((index, value) {
      var letter = value.toLowerCase();
      var word = wordForToday.split('');
      Color color;
      if (word.contains(letter) && word[index] == letter) {
        color = CustomTheme.isInWord;
        _controllers[index + start].toggleCard();

        _allLetters[index + start].color = color;
        setKeyBoardColor(color, letter);
      } else if (word.contains(letter)) {
        color = CustomTheme.mayBeInWord;
        _controllers[index + start].toggleCard();

        _allLetters[index + start].color = color;
        setKeyBoardColor(color, letter);
      } else {
        color = CustomTheme.notInWord;
        _controllers[index + start].toggleCard();

        _allLetters[index + start].color = color;
        setKeyBoardColor(color, letter);
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

  setKeyBoardColor(Color color, String letter) {
    var keyBoardIndex = _keyBoardCharacters.indexWhere((element) {
      return element.key.toLowerCase() == letter.toLowerCase();
    });

    if (_keyBoardCharacters[keyBoardIndex].color == Colors.grey) {
      _keyBoardCharacters[keyBoardIndex].color = color;
    }
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

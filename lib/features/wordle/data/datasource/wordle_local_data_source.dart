import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:wordle/core/utils/extensions.dart';
import 'package:wordle/core/utils/strings.dart';

List<String> wordsModelFromJson(String str) =>
    List<String>.from(json.decode(str).map((x) => x));

String wordsModelToJson(List<String> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x)));

abstract class WordleLocalDataSource {
  Future<String> fetchWordForToday();
  Future<String> fetchAllWords();
}

@LazySingleton(as: WordleLocalDataSource)
class WordleLocalDataSourceImpl implements WordleLocalDataSource {
  @override
  Future<String> fetchWordForToday() async {
    final allWords = await fetchAllWords();

    var allWordsList = wordsModelFromJson(allWords);

    var word = allWordsList.randomItem();
    return word;
  }

  @override
  Future<String> fetchAllWords() async {
    final String response =
        await rootBundle.loadString(Strings.fiveLetterWordsJsonPath);

    return response;
  }
}

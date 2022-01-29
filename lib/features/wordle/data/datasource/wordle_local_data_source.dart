import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:wordle/core/cache/app_cache.dart';
import 'package:wordle/core/utils/extensions.dart';
import 'package:wordle/core/utils/strings.dart';

List<String> wordsModelFromJson(String str) =>
    List<String>.from(json.decode(str).map((x) => x));

String wordsModelToJson(List<String> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x)));

abstract class WordleLocalDataSource {
  Future<String> fetchWordForToday();
  Future<List<String>> fetchAllWords();
  Future<bool> isWordInDatabase(String word);
}

@LazySingleton(as: WordleLocalDataSource)
class WordleLocalDataSourceImpl implements WordleLocalDataSource {
  final AppCache appCache;

  WordleLocalDataSourceImpl(this.appCache);
  @override
  Future<String> fetchWordForToday() async {
    final cachedWord = appCache.retrieveString(Strings.wordForTheDay);
    if (cachedWord != null) {
      return cachedWord;
    } else {
      final allWords = await fetchAllWords();

      var word = allWords.randomItem();
      appCache.saveString(Strings.wordForTheDay, word);
      return word;
    }
  }

  @override
  Future<List<String>> fetchAllWords() async {
    final String response =
        await rootBundle.loadString(Strings.fiveLetterWordsJsonPath);

    return wordsModelFromJson(response);
  }

  @override
  Future<bool> isWordInDatabase(String word) async {
    final allWords = await fetchAllWords();
    return allWords.contains(word.toLowerCase());
  }
}

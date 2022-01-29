import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:wordle/dependency_injection.dart';
import 'package:wordle/features/wordle/domain/repositories/wordle_repository.dart';

@LazySingleton()
class ValidWordViewModel extends StateNotifier<bool?> {
  final WordleRepository repository;

  ValidWordViewModel(this.repository) : super(null);

  void isValidWord(String value) async {
    state = await repository.isWordInDatabase(value);
  }
}

final validWordProvider =
    StateNotifierProvider((ref) => di<ValidWordViewModel>());

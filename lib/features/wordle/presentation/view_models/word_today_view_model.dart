import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:wordle/dependency_injection.dart';
import 'package:wordle/features/wordle/domain/repositories/wordle_repository.dart';

@LazySingleton()
class WordTodayViewModel extends StateNotifier<String> {
  final WordleRepository repository;

  WordTodayViewModel(this.repository) : super('');

  void fetchWordForToday() async {
    state = await repository.fetchWordForToday();
  }
}

final wordForTodayProvider =
    StateNotifierProvider((ref) => di<WordTodayViewModel>());

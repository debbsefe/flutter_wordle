import 'package:injectable/injectable.dart';
import 'package:wordle/features/wordle/domain/repositories/wordle_repository.dart';

@LazySingleton()
class WordViewModel {
  final WordleRepository repository;

  WordViewModel(this.repository);
  Future<String> fetchWordForToday() async {
    return await repository.fetchWordForToday();
  }
}

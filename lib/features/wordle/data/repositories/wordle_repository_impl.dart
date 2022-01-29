import 'package:injectable/injectable.dart';
import 'package:wordle/features/wordle/data/datasource/wordle_local_data_source.dart';
import 'package:wordle/features/wordle/domain/repositories/wordle_repository.dart';

@LazySingleton(as: WordleRepository)
class WordleRepositoryImpl implements WordleRepository {
  final WordleLocalDataSourceImpl localDataSource;

  WordleRepositoryImpl(this.localDataSource);
  @override
  Future<String> fetchWordForToday() async {
    return await localDataSource.fetchWordForToday();
  }
}

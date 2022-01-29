abstract class WordleRepository {
  Future<String> fetchWordForToday();
  Future<bool> isWordInDatabase(String word);
}

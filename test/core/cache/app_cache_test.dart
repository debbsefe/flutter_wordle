import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:wordle/core/cache/app_cache.dart';
import 'package:wordle/mock_objects.mocks.dart';

void main() {
  late AppCacheImpl cache;
  late MockSharedPreferences mockPref;

  const String tKey = 'tKey';
  const String tString = 'tValue';
  const bool tBool = true;

  setUp(() {
    mockPref = MockSharedPreferences();

    cache = AppCacheImpl(mockPref);
  });

  group('Save String', () {
    test('should save string when saveString called', () {
      cache.saveString(tKey, tString);

      verify(mockPref.setString(tKey, tString));
    });
  });
  group('Retrieve String', () {
    test('should return string when retrieveString is called', () {
      when(cache.retrieveString(tKey)).thenReturn(tString);

      expect(cache.retrieveString(tKey), tString);
    });

    test('should return null when no string is saved', () {
      when(cache.retrieveString(tKey)).thenReturn(null);
      expect(cache.retrieveString(tKey), null);
    });
  });

  group('Save Bool', () {
    test('should save bool when saveBool called', () {
      cache.saveBool(tKey, tBool);

      verify(mockPref.setBool(tKey, tBool));
    });
  });
  group('Retrieve Bool', () {
    test('should return bool when retrieveBool is called', () {
      when(cache.retrieveBool(tKey)).thenReturn(tBool);

      expect(cache.retrieveBool(tKey), tBool);
    });

    test('should return null when no boolean is saved', () {
      when(cache.retrieveBool(tKey)).thenReturn(null);
      expect(cache.retrieveBool(tKey), null);
    });
  });
}

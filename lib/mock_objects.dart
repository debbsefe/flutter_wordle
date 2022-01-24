import 'package:shared_preferences/shared_preferences.dart';

import 'package:mockito/annotations.dart';

@GenerateMocks([], customMocks: [
  MockSpec<SharedPreferences>(
    as: #MockSharedPreferences,
    returnNullOnMissingStub: true,
  ),
])
void main() {}

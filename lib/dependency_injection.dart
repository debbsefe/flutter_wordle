import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wordle/dependency_injection.config.dart';

final di = GetIt.instance;

@injectableInit
Future<void> init(String environment) async =>
    $initGetIt(di, environment: environment);

//register third party services
@Injectable()
@module
abstract class ThirdPartyServicesModule {
  @LazySingleton()
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}

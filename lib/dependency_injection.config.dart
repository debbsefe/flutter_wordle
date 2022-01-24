// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

import 'core/cache/app_cache.dart' as _i4;
import 'core/theme/custom_theme.dart' as _i5;
import 'dependency_injection.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  await gh.lazySingletonAsync<_i3.SharedPreferences>(
      () => thirdPartyServicesModule.prefs,
      preResolve: true);
  gh.lazySingleton<_i4.AppCache>(
      () => _i4.AppCacheImpl(get<_i3.SharedPreferences>()));
  gh.lazySingleton<_i5.CustomTheme>(() => _i5.CustomTheme(get<_i4.AppCache>()));
  return get;
}

class _$ThirdPartyServicesModule extends _i6.ThirdPartyServicesModule {}

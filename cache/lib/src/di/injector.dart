import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injector.config.dart';

@InjectableInit(initializerName: r'$initCacheGetIt')
Future<void> configureCacheDependencies(GetIt getIt) async {
  $initCacheGetIt(getIt);
}

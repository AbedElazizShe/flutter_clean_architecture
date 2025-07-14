import 'package:cache/cache.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:remote/remote.dart';

import 'injector.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(initializerName: r'$initGetIt')
Future<void> configureDependencies() async {
  await configureCacheDependencies(getIt);
  await configureRemoteDependencies(getIt);
  await configureDataDependencies(getIt);
  await configureDomainDependencies(getIt);
  getIt.$initGetIt();
}

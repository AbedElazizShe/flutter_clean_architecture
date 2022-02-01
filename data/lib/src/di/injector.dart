import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injector.config.dart';

@InjectableInit(initializerName: r'$initDataGetIt')
Future<void> configureDataDependencies(GetIt getIt) async {
  $initDataGetIt(getIt);
}

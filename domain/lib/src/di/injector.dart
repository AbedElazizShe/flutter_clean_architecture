import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injector.config.dart';

@InjectableInit(initializerName: r'$initDomainGetIt')
Future<void> configureDomainDependencies(GetIt getIt) async {
  $initDomainGetIt(getIt);
}

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injector.config.dart';

@InjectableInit(initializerName: r'$initRemoteGetIt')
Future<void> configureRemoteDependencies(GetIt getIt) async {
  getIt.$initRemoteGetIt();
}

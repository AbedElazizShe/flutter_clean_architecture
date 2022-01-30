import 'package:domain/domain.dart';
import 'package:flutter_clean_architecture/di/app_modules.dart';
import 'package:get_it/get_it.dart';

void initArticlesModules() {
  final GetIt injector = AppModules().injector;
  injector.registerFactory<GetArticlesUseCase>(
      () => GetArticlesUseCase(injector()));
}

import 'package:config/config.dart';
import 'package:core/config/app_config_provider.dart';
import 'package:core/config/default_configuration.dart';
import 'package:core/di/injector.dart';
import 'package:core/features/articles/states/articles_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:get_localization/get_localization.dart';

import 'app.dart';
import 'core/bloc/bloc_observer.dart';

Future<void> main({AppConfiguration? configuration}) async {
  WidgetsFlutterBinding.ensureInitialized();

  final AppConfiguration config = configuration ?? DefaultConfiguration();

  GetIt.instance.registerSingleton(config.endpoint(), instanceName: 'endpoint');

  Localization.init();

  await configureDependencies();

  run(config);
}

Future<void> run(AppConfiguration configuration) async {
  BlocOverrides.runZoned(
    () => runApp(MultiBlocProvider(providers: [
      BlocProvider(create: (_) => ArticlesCubit()),
      if (configuration.blocs().isNotEmpty) ...configuration.blocs()
    ], child: AppConfigProvider(appConfig: configuration, child: const App()))),
    blocObserver: CubitObserver(),
  );
}

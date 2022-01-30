import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/di/app_modules.dart';
import 'package:flutter_clean_architecture/features/articles/states/articles_cubit.dart';

import 'app.dart';
import 'core/bloc/bloc_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  AppModules().init();

  BlocOverrides.runZoned(
    () => runApp(MultiBlocProvider(
        providers: [BlocProvider(create: (_) => ArticlesCubit())],
        child: const App())),
    blocObserver: CubitObserver(),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/di/injector.dart';
import 'package:flutter_clean_architecture/features/articles/states/articles_cubit.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();
  runApp(MultiBlocProvider(
      providers: [BlocProvider(create: (_) => ArticlesCubit())],
      child: const App()));
}

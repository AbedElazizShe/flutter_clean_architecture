import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/features/articles/presentation/articles_screen.dart';

const String articlesScreen = 'articles_screen';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case articlesScreen:
      return MaterialPageRoute<ArticlesScreen>(
          builder: (BuildContext context) => const ArticlesScreen());

    default:
      throw Exception('This route name does not exit');
  }
}

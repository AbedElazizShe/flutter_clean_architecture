import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/features/articles/states/articles_cubit.dart';
import 'package:flutter_clean_architecture/features/articles/states/articles_state.dart';

class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({Key? key}) : super(key: key);

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  late ArticlesCubit _articlesCubit;

  @override
  void initState() {
    super.initState();

    _articlesCubit = BlocProvider.of<ArticlesCubit>(context);
    _articlesCubit.getMostEmailedArticles();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _articlesCubit.stream.listen((ArticlesState state) {
      if (state is ArticlesLoadedState) {
        print(state.articles.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Demo'),
        ),
        body: const Center(
          child: Text('LANDING SCREEN'),
        ),
      );
}

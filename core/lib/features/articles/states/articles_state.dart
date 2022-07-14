import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

abstract class ArticlesState extends Equatable {
  const ArticlesState();

  @override
  List<Object?> get props => <Object?>[];
}

class ArticlesInitialState extends ArticlesState {
  const ArticlesInitialState();
}

class ArticlesLoadingState extends ArticlesState {
  const ArticlesLoadingState();
}

class ArticlesLoadedState extends ArticlesState {
  const ArticlesLoadedState(this.articles);

  final List<ArticleModel> articles;

  @override
  String toString() => 'ArticlesLoadedState{articles: ${articles.toString()}';
}

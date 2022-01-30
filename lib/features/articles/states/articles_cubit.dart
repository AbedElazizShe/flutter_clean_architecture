import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:flutter_clean_architecture/di/app_modules.dart';

import 'articles_state.dart';

class ArticlesCubit extends Cubit<ArticlesState> {
  ArticlesCubit() : super(const ArticlesInitialState());

  void getMostEmailedArticles() {
    emit(const ArticlesLoadingState());
    AppModules().injector<GetArticlesUseCase>().call(
        onSuccess: (List<ArticleModel> articles) {
          emit(ArticlesLoadedState(articles));
        },
        onFailure: () {});
  }
}

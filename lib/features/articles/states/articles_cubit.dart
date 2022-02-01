import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:flutter_clean_architecture/core/enums.dart';
import 'package:get_it/get_it.dart';

import 'articles_state.dart';

class ArticlesCubit extends Cubit<ArticlesState> {
  ArticlesCubit() : super(const ArticlesInitialState());

  void getArticles({required ContentType type, bool forceUpdate = false}) {
    emit(const ArticlesLoadingState());
    GetIt.instance<GetArticlesUseCase>().call(
        requestType: _getRequestType(type),
        forceUpdate: forceUpdate,
        onSuccess: (List<ArticleModel> articles) {
          emit(ArticlesLoadedState(articles));
        },
        onFailure: () {});
  }

  RequestType _getRequestType(ContentType type) {
    switch (type) {
      case ContentType.mostEmailed:
        return RequestType.mostEmailed;
      case ContentType.mostViewed:
        return RequestType.mostViewed;
      case ContentType.mostShared:
        return RequestType.mostShared;
    }
  }
}

import 'dart:convert';

import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@singleton
class GetArticlesUseCase {
  GetArticlesUseCase(this.articlesRepository);

  final ArticlesRepository articlesRepository;

  Future<void> call({
    required RequestType requestType,
    bool forceUpdate = false,
    required Function(List<ArticleModel>) onSuccess,
    required Function onFailure,
  }) async {
    late List<ArticleModel> articles;

    final String requestTypeValue = _generateRequestTypeValue(requestType);

    if (forceUpdate) {
      articles = await _fetchArticlesAndSave(requestType, requestTypeValue);
    } else {
      articles = await articlesRepository.getCachedArticles(requestTypeValue);
      if (articles.isEmpty) {
        articles = await _fetchArticlesAndSave(requestType, requestTypeValue);
      }
    }

    articles.isNotEmpty ? onSuccess.call(articles) : onFailure.call();
  }

  Future<List<ArticleModel>> _fetchArticlesAndSave(
      RequestType requestType, String requestTypeValue) async {
    List<ArticleModel> articles = await _getArticles(requestType);
    await articlesRepository.saveArticles(
        json.encode(articles), requestTypeValue);
    return articles;
  }

  Future<List<ArticleModel>> _getArticles(RequestType requestType) async {
    switch (requestType) {
      case RequestType.mostEmailed:
        return await articlesRepository.getMostEmailedArticles();
      case RequestType.mostViewed:
        return await articlesRepository.getMostViewedArticles();
      case RequestType.mostShared:
        return await articlesRepository.getMostSharedArticles();
    }
  }

  String _generateRequestTypeValue(RequestType requestTyp) {
    switch (requestTyp) {
      case RequestType.mostEmailed:
        return 'most-emailed';
      case RequestType.mostViewed:
        return 'most-viewed';
      case RequestType.mostShared:
        return 'most-shared';
    }
  }
}

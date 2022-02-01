import 'package:domain/src/models/article/article_model.dart';

abstract class ArticlesRepository {
  Future<List<ArticleModel>> getMostEmailedArticles();

  Future<List<ArticleModel>> getMostViewedArticles();

  Future<List<ArticleModel>> getMostSharedArticles();

  Future<int> saveArticles(String articles, String type);

  Future<List<ArticleModel>> getCachedArticles(String type);
}

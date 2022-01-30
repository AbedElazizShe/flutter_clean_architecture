import 'package:domain/src/models/article/article_model.dart';

abstract class ArticlesRepository {
  Future<List<ArticleModel>> getMostEmailedArticles();
}

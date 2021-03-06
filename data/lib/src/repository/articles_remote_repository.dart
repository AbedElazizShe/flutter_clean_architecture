import 'package:data/src/entities/articles/articles_entity.dart';

abstract class ArticlesRemoteRepository {
  Future<List<ArticlesEntity>> getMostEmailedArticles();

  Future<List<ArticlesEntity>> getMostSharedArticles();

  Future<List<ArticlesEntity>> getMostViewedArticles();
}

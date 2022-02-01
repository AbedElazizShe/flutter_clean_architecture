import 'package:data/src/entities/articles/articles_entity.dart';

abstract class CacheStorageRepository {
  Future<int> saveArticles(String contents, String type);

  Future<List<ArticlesEntity>> getArticles(String type);
}

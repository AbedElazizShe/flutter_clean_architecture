import 'package:data/src/entities/articles/articles_entity.dart';

abstract class ArticlesRemoteRepository {
  Future<List<ArticlesEntity>> getMostEmailedArticles();
}

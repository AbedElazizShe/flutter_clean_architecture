import 'package:cache/src/db/demo_db.dart';
import 'package:injectable/injectable.dart';

@singleton
class DBProvider {
  DBProvider(this.db);

  final DemoDB db;

  Future<int> saveArticles(String articles, String type) async {
    return await db.articlesDao.insertArticles(ArticlesEntityCompanion.insert(
      content: articles,
      type: type,
      updated: DateTime.now(),
    ));
  }

  Future<String> fetchArticles(String type) async {
    final Articles? articles = await db.articlesDao.fetchArticles(type);
    return articles?.content ?? '';

  }
}

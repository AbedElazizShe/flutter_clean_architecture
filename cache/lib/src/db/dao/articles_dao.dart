import 'package:cache/src/db/demo_db.dart';
import 'package:cache/src/db/entities/articles_entity.dart';
import 'package:drift/drift.dart';

part 'articles_dao.g.dart';

@DriftAccessor(tables: [ArticlesEntity])
class ArticlesDao extends DatabaseAccessor<DemoDB> with _$ArticlesDaoMixin {
  ArticlesDao(DemoDB db) : super(db);

  Future<int> insertArticles(ArticlesEntityCompanion entity) async {
    return into(articlesEntity).insertOnConflictUpdate(entity);
  }

  Future<Articles?> fetchArticles(String type) async {
    return (select(articlesEntity)..where((tbl) => tbl.type.equals(type)))
        .getSingleOrNull();
  }
}

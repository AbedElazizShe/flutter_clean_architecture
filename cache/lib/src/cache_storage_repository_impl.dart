import 'dart:convert';

import 'package:cache/src/db_provider.dart';
import 'package:cache/src/mapper/articles_entity_mapper.dart';
import 'package:cache/src/models/article_model.dart';
import 'package:data/data.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CacheStorageRepository)
class CacheStorageRepositoryImpl implements CacheStorageRepository {
  CacheStorageRepositoryImpl(
      {required this.dbProvider, required this.articlesEntityMapper});

  final DBProvider dbProvider;
  final ArticlesEntityMapper articlesEntityMapper;

  @override
  Future<List<ArticlesEntity>> getArticles(String type) async {
    final String? contents = await dbProvider.fetchArticles(type);

    if (contents == null || contents.isEmpty) return <ArticlesEntity>[];

    return (json.decode(contents) as List)
        .map((i) => articlesEntityMapper.mapFromModel(ArticleModel.fromJson(i)))
        .toList();
  }

  @override
  Future<int> saveArticles(String contents, String type) async =>
      dbProvider.saveArticles(contents, type);
}

import 'package:data/src/entities/articles/articles_entity.dart';
import 'package:data/src/mapper/articles/articles_mapper.dart';
import 'package:data/src/source/data_source_factory.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ArticlesRepository)
class ArticlesRepositoryImpl implements ArticlesRepository {
  ArticlesRepositoryImpl(
      {required this.dataSourceFactory, required this.articlesMapper});

  final DataSourceFactory dataSourceFactory;
  final ArticlesMapper articlesMapper;

  @override
  Future<List<ArticleModel>> getMostEmailedArticles() async {
    final List<ArticlesEntity> articlesEntity =
        await dataSourceFactory.remoteDataSource.getMostEmailedArticles();
    return _getMappedArticles(articlesEntity);
  }

  @override
  Future<List<ArticleModel>> getMostSharedArticles() async {
    final List<ArticlesEntity> articlesEntity =
        await dataSourceFactory.remoteDataSource.getMostSharedArticles();
    return _getMappedArticles(articlesEntity);
  }

  @override
  Future<List<ArticleModel>> getMostViewedArticles() async {
    final List<ArticlesEntity> articlesEntity =
        await dataSourceFactory.remoteDataSource.getMostViewedArticles();
    return _getMappedArticles(articlesEntity);
  }

  @override
  Future<List<ArticleModel>> getCachedArticles(String type) async {
    final List<ArticlesEntity> articlesEntity =
        await dataSourceFactory.localDataSource.getArticles(type);
    return _getMappedArticles(articlesEntity);
  }

  @override
  Future<int> saveArticles(String articles, String type) async =>
      await dataSourceFactory.localDataSource.saveArticles(articles, type);

  List<ArticleModel> _getMappedArticles(List<ArticlesEntity> articlesEntity) =>
      articlesEntity
          .map((ArticlesEntity entity) => articlesMapper.mapFromEntity(entity))
          .toList();
}

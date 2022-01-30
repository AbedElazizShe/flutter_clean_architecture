import 'package:data/src/entities/articles/articles_entity.dart';
import 'package:data/src/mapper/articles/articles_mapper.dart';
import 'package:data/src/source/data_source_factory.dart';
import 'package:domain/domain.dart';

class ArticlesRepositoryImpl implements ArticlesRepository {
  ArticlesRepositoryImpl(
      {required this.dataSourceFactory, required this.articlesMapper});

  final DataSourceFactory dataSourceFactory;
  final ArticlesMapper articlesMapper;

  @override
  Future<List<ArticleModel>> getMostEmailedArticles() async {
    final List<ArticlesEntity> articlesEntity =
        await dataSourceFactory.remoteDataSource.getMostEmailedArticles();
    return articlesEntity
        .map((ArticlesEntity entity) => articlesMapper.mapFromEntity(entity))
        .toList();
  }
}

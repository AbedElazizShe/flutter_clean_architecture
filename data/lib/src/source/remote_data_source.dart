import 'package:data/src/entities/articles/articles_entity.dart';
import 'package:data/src/repository/articles_remote_repository.dart';
import 'package:injectable/injectable.dart';

import 'data_source.dart';

@singleton
class RemoteDataSource extends DataSource {
  RemoteDataSource({required this.articlesRemoteRepository});

  final ArticlesRemoteRepository articlesRemoteRepository;

  Future<List<ArticlesEntity>> getMostEmailedArticles() =>
      articlesRemoteRepository.getMostEmailedArticles();

  Future<List<ArticlesEntity>> getMostViewedArticles() =>
      articlesRemoteRepository.getMostViewedArticles();

  Future<List<ArticlesEntity>> getMostSharedArticles() =>
      articlesRemoteRepository.getMostSharedArticles();
}

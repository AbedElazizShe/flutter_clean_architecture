import 'package:data/src/entities/articles/articles_entity.dart';
import 'package:data/src/repository/cache_storage_repository.dart';
import 'package:data/src/source/data_source.dart';
import 'package:injectable/injectable.dart';

@singleton
class CacheDataSource extends DataSource {
  CacheDataSource(this.cacheStorageRepository);

  final CacheStorageRepository cacheStorageRepository;

  Future<int> saveArticles(String contents, String type) =>
      cacheStorageRepository.saveArticles(contents, type);

  Future<List<ArticlesEntity>> getArticles(String type) =>
      cacheStorageRepository.getArticles(type);
}

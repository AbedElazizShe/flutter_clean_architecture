import 'package:cache/cache.dart';
import 'package:cache/src/db_provider.dart';
import 'package:cache/src/mapper/articles_entity_mapper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'cache_storage_repository_impl_test.mocks.dart';
import 'mock/mock_article_entity.dart';

@GenerateMocks([DBProvider, ArticlesEntityMapper])
void main() {
  late DBProvider dbProvider;
  late ArticlesEntityMapper articlesEntityMapper;
  late CacheStorageRepositoryImpl cacheStorageRepositoryImpl;

  setUp(() {
    dbProvider = MockDBProvider();
    articlesEntityMapper = MockArticlesEntityMapper();

    cacheStorageRepositoryImpl = CacheStorageRepositoryImpl(
        dbProvider: dbProvider, articlesEntityMapper: articlesEntityMapper);
  });

  test('should get int result when saving articles to db.', () async {
    final String randomType = randomString();
    final String randomContents = randomString(len: 100);
    when(dbProvider.saveArticles(randomContents, randomType))
        .thenAnswer((_) async => 1);

    final int result = await cacheStorageRepositoryImpl.saveArticles(
        randomContents, randomType);
    expect(result, same(1));

    verify(dbProvider.saveArticles(randomContents, randomType)).called(1);
  });
}

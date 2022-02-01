import 'package:data/data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../mock/mock_article_entity.dart';
import 'cache_data_source_test.mocks.dart';

@GenerateMocks([
  CacheStorageRepository,
])
void main() {
  late CacheStorageRepository cacheStorageRepository;
  late CacheDataSource cacheDataSource;

  setUp(() {
    cacheStorageRepository = MockCacheStorageRepository();

    cacheDataSource = CacheDataSource(cacheStorageRepository);
  });

  test('should get int result when saving articles to db.', () async {
    final String randomType = randomString();
    final String randomContents = randomString(len: 100);
    when(cacheStorageRepository.saveArticles(randomContents, randomType))
        .thenAnswer((_) async => 1);

    final int result =
        await cacheDataSource.saveArticles(randomContents, randomType);
    expect(result, same(1));

    verify(cacheStorageRepository.saveArticles(randomContents, randomType))
        .called(1);
  });

  test('should get list of articles from db.', () async {
    final String randomType = randomString();

    when(cacheStorageRepository.getArticles(randomType))
        .thenAnswer((_) async => mockArticles);

    final List<ArticlesEntity> articles =
        await cacheDataSource.getArticles(randomType);
    expect(articles, isNotNull);
    expect(articles.length, same(1));

    verify(cacheStorageRepository.getArticles(randomType)).called(1);
  });
}

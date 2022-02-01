import 'package:data/data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../mock/mock_article_entity.dart';
import 'remote_data_source_test.mocks.dart';

@GenerateMocks([
  ArticlesRemoteRepository,
])
void main() {
  late ArticlesRemoteRepository articlesRemoteRepository;
  late RemoteDataSource remoteDataSource;

  setUp(() {
    articlesRemoteRepository = MockArticlesRemoteRepository();

    remoteDataSource =
        RemoteDataSource(articlesRemoteRepository: articlesRemoteRepository);
  });

  test('should get most emailed list of articles upon retrieval from remote',
      () async {
    when(articlesRemoteRepository.getMostEmailedArticles())
        .thenAnswer((_) async => mockArticles);

    final List<ArticlesEntity> articles =
        await remoteDataSource.getMostEmailedArticles();
    expect(articles, isNotNull);
    expect(articles.length, same(1));

    verify(articlesRemoteRepository.getMostEmailedArticles()).called(1);
  });

  test('should get most viewed list of articles upon retrieval from remote',
      () async {
    when(articlesRemoteRepository.getMostViewedArticles())
        .thenAnswer((_) async => mockArticles);

    final List<ArticlesEntity> articles =
        await remoteDataSource.getMostViewedArticles();
    expect(articles, isNotNull);
    expect(articles.length, same(1));

    verify(articlesRemoteRepository.getMostViewedArticles()).called(1);
  });

  test('should get most shared list of articles upon retrieval from remote',
      () async {
    when(articlesRemoteRepository.getMostSharedArticles())
        .thenAnswer((_) async => mockArticles);

    final List<ArticlesEntity> articles =
        await remoteDataSource.getMostSharedArticles();
    expect(articles, isNotNull);
    expect(articles.length, same(1));

    verify(articlesRemoteRepository.getMostSharedArticles()).called(1);
  });
}

import 'package:data/data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:remote/src/api/articles_service.dart';
import 'package:remote/src/articles_remote_repository_impl.dart';
import 'package:remote/src/mapper/articles_entity_mapper.dart';
import 'package:remote/src/models/article/articles_response_model.dart';

import '../mock/mock_articles_model.dart';
import 'articles_remote_repository_impl_test.mocks.dart';

@GenerateMocks([ArticlesService, ArticlesEntityMapper])
void main() {
  late ArticlesService articlesService;
  late ArticlesEntityMapper articlesEntityMapper;
  late ArticlesRemoteRepositoryImpl articlesRemoteRepositoryImpl;

  setUp(() {
    articlesService = MockArticlesService();
    articlesEntityMapper = MockArticlesEntityMapper();

    articlesRemoteRepositoryImpl = ArticlesRemoteRepositoryImpl(
        articlesService: articlesService,
        articlesEntityMapper: articlesEntityMapper);
  });

  test('should get list of ArticlesEntity when fetching most emailed articles',
      () async {
    final ArticlesResponseModel articlesResponseModel =
        mockArticlesResponseModel;
    when(articlesService.getMostEmailedArticles())
        .thenAnswer((_) async => articlesResponseModel);
    when(articlesEntityMapper.mapFromModel(articlesResponseModel.results[0]))
        .thenReturn(mockArticlesEntity);

    final List<ArticlesEntity> articlesEntity =
        await articlesRemoteRepositoryImpl.getMostEmailedArticles();
    expect(articlesEntity, isNotNull);
    expect(articlesEntity.length, same(1));

    verify(articlesService.getMostEmailedArticles()).called(1);
  });

  test('should get list of ArticlesEntity when fetching most viewed articles',
      () async {
    final ArticlesResponseModel articlesResponseModel =
        mockArticlesResponseModel;
    when(articlesService.getMostViewedArticles())
        .thenAnswer((_) async => articlesResponseModel);
    when(articlesEntityMapper.mapFromModel(articlesResponseModel.results[0]))
        .thenReturn(mockArticlesEntity);

    final List<ArticlesEntity> articlesEntity =
        await articlesRemoteRepositoryImpl.getMostViewedArticles();
    expect(articlesEntity, isNotNull);
    expect(articlesEntity.length, same(1));

    verify(articlesService.getMostViewedArticles()).called(1);
  });

  test('should get list of ArticlesEntity when fetching most shared articles',
      () async {
    final ArticlesResponseModel articlesResponseModel =
        mockArticlesResponseModel;
    when(articlesService.getMostSharedArticles())
        .thenAnswer((_) async => articlesResponseModel);
    when(articlesEntityMapper.mapFromModel(articlesResponseModel.results[0]))
        .thenReturn(mockArticlesEntity);

    final List<ArticlesEntity> articlesEntity =
        await articlesRemoteRepositoryImpl.getMostSharedArticles();
    expect(articlesEntity, isNotNull);
    expect(articlesEntity.length, same(1));

    verify(articlesService.getMostSharedArticles()).called(1);
  });
}

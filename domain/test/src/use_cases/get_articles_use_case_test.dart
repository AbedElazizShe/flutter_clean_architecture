import 'dart:convert';

import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../mock/mock_article_model.dart';
import 'get_articles_use_case_test.mocks.dart';

@GenerateMocks([
  ArticlesRepository,
])
void main() {
  late ArticlesRepository articlesRepository;
  late GetArticlesUseCase getArticlesUseCase;

  setUp(() {
    articlesRepository = MockArticlesRepository();

    getArticlesUseCase = GetArticlesUseCase(articlesRepository);
  });

  test(
      'should retrieve articles from MOST_EMAILED remote when there is no cached data and RequestType is RequestType.mostEmailed',
      () {
    final List<ArticleModel> results = mockArticles;
    const String requestTypeValue = 'most-emailed';
    // Get from cache while empty
    when(articlesRepository.getCachedArticles(requestTypeValue))
        .thenAnswer((_) async => <ArticleModel>[]);
    when(articlesRepository.saveArticles(
            json.encode(results), requestTypeValue))
        .thenAnswer((_) async => 1);

    when(articlesRepository.getMostEmailedArticles())
        .thenAnswer((_) async => results);

    getArticlesUseCase.call(
        requestType: RequestType.mostEmailed,
        onSuccess: (List<ArticleModel> articles) {
          verify(articlesRepository.getMostEmailedArticles()).called(1);

          expect(articles, isNotNull);
          expect(articles, results);
        },
        onFailure: () {});
  });

  test(
      'should retrieve articles from MOST_VIEWED remote when there is no cached data and RequestType is RequestType.mostViewed',
      () {
    final List<ArticleModel> results = mockArticles;
    const String requestTypeValue = 'most-viewed';
    // Get from cache while empty
    when(articlesRepository.getCachedArticles(requestTypeValue))
        .thenAnswer((_) async => <ArticleModel>[]);
    when(articlesRepository.saveArticles(
            json.encode(results), requestTypeValue))
        .thenAnswer((_) async => 1);

    when(articlesRepository.getMostViewedArticles())
        .thenAnswer((_) async => results);

    getArticlesUseCase.call(
        requestType: RequestType.mostViewed,
        onSuccess: (List<ArticleModel> articles) {
          verify(articlesRepository.getMostViewedArticles()).called(1);

          expect(articles, isNotNull);
          expect(articles, results);
        },
        onFailure: () {});
  });

  test(
      'should retrieve articles from MOST_SHARED remote when there is no cached data and RequestType is RequestType.mostShared',
      () {
    final List<ArticleModel> results = mockArticles;
    const String requestTypeValue = 'most-shared';
    // Get from cache while empty
    when(articlesRepository.getCachedArticles(requestTypeValue))
        .thenAnswer((_) async => <ArticleModel>[]);
    when(articlesRepository.saveArticles(
            json.encode(results), requestTypeValue))
        .thenAnswer((_) async => 1);

    when(articlesRepository.getMostSharedArticles())
        .thenAnswer((_) async => results);

    getArticlesUseCase.call(
        requestType: RequestType.mostShared,
        onSuccess: (List<ArticleModel> articles) {
          verify(articlesRepository.getMostSharedArticles()).called(1);

          expect(articles, isNotNull);
          expect(articles, results);
        },
        onFailure: () {});
  });

  test(
      'should retrieve articles from cache when there is cached data',
          () {
        final List<ArticleModel> results = mockArticles;
        const String requestTypeValue = 'most-emailed';
        // Get from cache while empty
        when(articlesRepository.getCachedArticles(requestTypeValue))
            .thenAnswer((_) async => results);

        getArticlesUseCase.call(
            requestType: RequestType.mostEmailed,
            onSuccess: (List<ArticleModel> articles) {
              verify(articlesRepository.getCachedArticles(requestTypeValue)).called(1);

              expect(articles, isNotNull);
              expect(articles, results);
            },
            onFailure: () {});
      });

  test(
      'should retrieve articles from remote when forceUpdate is true',
          () {
        final List<ArticleModel> results = mockArticles;
        const String requestTypeValue = 'most-emailed';

        when(articlesRepository.saveArticles(
            json.encode(results), requestTypeValue))
            .thenAnswer((_) async => 1);

        when(articlesRepository.getMostEmailedArticles())
            .thenAnswer((_) async => results);

        getArticlesUseCase.call(
            requestType: RequestType.mostEmailed,
            forceUpdate: true,
            onSuccess: (List<ArticleModel> articles) {
              verifyNever(articlesRepository.getCachedArticles(requestTypeValue));
              verify(articlesRepository.getMostEmailedArticles()).called(1);

              expect(articles, isNotNull);
              expect(articles, results);
            },
            onFailure: () {});
      });

  // TODO: Test all scenarios
}

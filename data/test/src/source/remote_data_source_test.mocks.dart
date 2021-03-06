// Mocks generated by Mockito 5.0.17 from annotations
// in data/test/src/source/remote_data_source_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:data/src/entities/articles/articles_entity.dart' as _i4;
import 'package:data/src/repository/articles_remote_repository.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [ArticlesRemoteRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockArticlesRemoteRepository extends _i1.Mock
    implements _i2.ArticlesRemoteRepository {
  MockArticlesRemoteRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.ArticlesEntity>> getMostEmailedArticles() =>
      (super.noSuchMethod(Invocation.method(#getMostEmailedArticles, []),
          returnValue: Future<List<_i4.ArticlesEntity>>.value(
              <_i4.ArticlesEntity>[])) as _i3.Future<List<_i4.ArticlesEntity>>);
  @override
  _i3.Future<List<_i4.ArticlesEntity>> getMostSharedArticles() =>
      (super.noSuchMethod(Invocation.method(#getMostSharedArticles, []),
          returnValue: Future<List<_i4.ArticlesEntity>>.value(
              <_i4.ArticlesEntity>[])) as _i3.Future<List<_i4.ArticlesEntity>>);
  @override
  _i3.Future<List<_i4.ArticlesEntity>> getMostViewedArticles() =>
      (super.noSuchMethod(Invocation.method(#getMostViewedArticles, []),
          returnValue: Future<List<_i4.ArticlesEntity>>.value(
              <_i4.ArticlesEntity>[])) as _i3.Future<List<_i4.ArticlesEntity>>);
}

// Mocks generated by Mockito 5.0.17 from annotations
// in cache/test/cache_storage_repository_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:cache/src/db/demo_db.dart' as _i2;
import 'package:cache/src/db_provider.dart' as _i4;
import 'package:cache/src/mapper/articles_entity_mapper.dart' as _i6;
import 'package:cache/src/models/article_model.dart' as _i7;
import 'package:data/data.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeDemoDB_0 extends _i1.Fake implements _i2.DemoDB {}

class _FakeArticlesEntity_1 extends _i1.Fake implements _i3.ArticlesEntity {}

/// A class which mocks [DBProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockDBProvider extends _i1.Mock implements _i4.DBProvider {
  MockDBProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.DemoDB get db =>
      (super.noSuchMethod(Invocation.getter(#db), returnValue: _FakeDemoDB_0())
          as _i2.DemoDB);
  @override
  _i5.Future<int> saveArticles(String? articles, String? type) =>
      (super.noSuchMethod(Invocation.method(#saveArticles, [articles, type]),
          returnValue: Future<int>.value(0)) as _i5.Future<int>);
  @override
  _i5.Future<String> fetchArticles(String? type) =>
      (super.noSuchMethod(Invocation.method(#fetchArticles, [type]),
          returnValue: Future<String>.value('')) as _i5.Future<String>);
}

/// A class which mocks [ArticlesEntityMapper].
///
/// See the documentation for Mockito's code generation for more information.
class MockArticlesEntityMapper extends _i1.Mock
    implements _i6.ArticlesEntityMapper {
  MockArticlesEntityMapper() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.ArticlesEntity mapFromModel(_i7.ArticleModel? articleModel) =>
      (super.noSuchMethod(Invocation.method(#mapFromModel, [articleModel]),
          returnValue: _FakeArticlesEntity_1()) as _i3.ArticlesEntity);
}
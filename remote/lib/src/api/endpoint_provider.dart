import 'dart:convert';
import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:remote/src/models/article/articles_response_model.dart';

@singleton
class EndpointProvider {
  EndpointProvider(this._dio);

  final Dio _dio;

  Future<ArticlesResponseModel> getMostEmailedArticles() async {
    try {
      final response = await _dio.get('mostpopular/v2/emailed/7.json',
          queryParameters: <String, String>{'api-key': 'ADD-YOUR-KEY'});

      return ArticlesResponseModel.fromJson(json.decode(response.toString()));
    } on DioException catch (ex) {
      developer.log(ex.message ?? "", stackTrace: ex.stackTrace);
      throw Exception(ex.message);
    }
  }

  Future<ArticlesResponseModel> getMostViewedArticles() async {
    try {
      final response = await _dio.get('mostpopular/v2/viewed/7.json',
          queryParameters: <String, String>{'api-key': 'ADD-YOUR-KEY'});

      return ArticlesResponseModel.fromJson(json.decode(response.toString()));
    } on DioException catch (ex) {
      developer.log(ex.message ?? "", stackTrace: ex.stackTrace);
      throw Exception(ex.message);
    }
  }

  Future<ArticlesResponseModel> getMostSharedArticles() async {
    try {
      final response = await _dio.get('mostpopular/v2/shared/7.json',
          queryParameters: <String, String>{'api-key': 'ADD-YOUR-KEY'});

      return ArticlesResponseModel.fromJson(json.decode(response.toString()));
    } on DioException catch (ex) {
      developer.log(ex.message ?? "", stackTrace: ex.stackTrace);
      throw Exception(ex.message);
    }
  }
}

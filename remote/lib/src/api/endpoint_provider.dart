import 'dart:convert';
import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:remote/src/models/article/articles_response_model.dart';

class EndpointProvider {
  EndpointProvider(this._dio);

  final Dio _dio;

  Future<ArticlesResponseModel> getMostEmailedArticles() async {
    try {
      final response = await _dio.get('mostpopular/v2/emailed/7.json',
          queryParameters: <String, String>{
            'api-key': 'Cp9J3I2hbLV4SqXtKXwPXAPEkA9arZFt'
          });

      return ArticlesResponseModel.fromJson(json.decode(response.toString()));
    } on DioError catch (ex) {
      developer.log(ex.message, stackTrace: ex.stackTrace);
      throw Exception(ex.message);
    }
  }
}

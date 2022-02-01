import 'package:injectable/injectable.dart';
import 'package:remote/src/api/endpoint_provider.dart';
import 'package:remote/src/models/article/articles_response_model.dart';

@singleton
class ArticlesService {
  ArticlesService(this.endpointProvider);

  final EndpointProvider endpointProvider;

  Future<ArticlesResponseModel> getMostEmailedArticles() async =>
      endpointProvider.getMostEmailedArticles();

  Future<ArticlesResponseModel> getMostSharedArticles() async =>
      endpointProvider.getMostSharedArticles();

  Future<ArticlesResponseModel> getMostViewedArticles() async =>
      endpointProvider.getMostViewedArticles();
}

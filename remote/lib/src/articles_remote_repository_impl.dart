import 'package:data/data.dart';
import 'package:remote/src/api/articles_service.dart';
import 'package:remote/src/mapper/articles_entity_mapper.dart';
import 'package:remote/src/models/article/article_model.dart';
import 'package:remote/src/models/article/articles_response_model.dart';

class ArticlesRemoteRepositoryImpl extends ArticlesRemoteRepository {
  ArticlesRemoteRepositoryImpl({
    required this.articlesService,
    required this.articlesEntityMapper,
  });

  final ArticlesService articlesService;
  final ArticlesEntityMapper articlesEntityMapper;

  @override
  Future<List<ArticlesEntity>> getMostEmailedArticles() async {
    final ArticlesResponseModel articlesResponseModel =
        await articlesService.getMostEmailedArticles();
    return articlesResponseModel.results
        .map((ArticleModel model) => articlesEntityMapper.mapFromModel(model))
        .toList();
  }
}

import 'package:data/data.dart';
import 'package:injectable/injectable.dart';
import 'package:remote/src/api/articles_service.dart';
import 'package:remote/src/mapper/articles_entity_mapper.dart';
import 'package:remote/src/models/article/article_model.dart';
import 'package:remote/src/models/article/articles_response_model.dart';

@Injectable(as: ArticlesRemoteRepository)
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
    return _getMappedArticles(articlesResponseModel);
  }

  @override
  Future<List<ArticlesEntity>> getMostSharedArticles() async {
    final ArticlesResponseModel articlesResponseModel =
        await articlesService.getMostSharedArticles();
    return _getMappedArticles(articlesResponseModel);
  }

  @override
  Future<List<ArticlesEntity>> getMostViewedArticles() async {
    final ArticlesResponseModel articlesResponseModel =
        await articlesService.getMostViewedArticles();
    return _getMappedArticles(articlesResponseModel);
  }

  List<ArticlesEntity> _getMappedArticles(
          ArticlesResponseModel articlesResponseModel) =>
      articlesResponseModel.results
          .map((ArticleModel model) => articlesEntityMapper.mapFromModel(model))
          .toList();
}

import 'package:domain/src/models/article/article_model.dart';
import 'package:domain/src/repository/articles_repository.dart';

class GetArticlesUseCase {
  GetArticlesUseCase(this.articlesRepository);

  final ArticlesRepository articlesRepository;

  Future<void> call({
    required Function(List<ArticleModel>) onSuccess,
    required Function onFailure,
  }) async {
    final List<ArticleModel> articles =
        await articlesRepository.getMostEmailedArticles();

    articles.isNotEmpty ? onSuccess.call(articles) : onFailure;
  }
}

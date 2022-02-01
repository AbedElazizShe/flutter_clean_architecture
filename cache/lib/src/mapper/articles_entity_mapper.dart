import 'package:cache/src/mapper/entity_mapper.dart';
import 'package:cache/src/models/article_model.dart';
import 'package:data/data.dart';
import 'package:injectable/injectable.dart';

@injectable
class ArticlesEntityMapper
    implements EntityMapper<ArticleModel, ArticlesEntity> {
  @override
  ArticlesEntity mapFromModel(ArticleModel articleModel) {
    return ArticlesEntity(
        id: articleModel.id,
        url: articleModel.url,
        title: articleModel.title,
        source: articleModel.source,
        publishedDate: articleModel.publishedDate,
        summary: articleModel.summary,
        image: articleModel.image);
  }
}

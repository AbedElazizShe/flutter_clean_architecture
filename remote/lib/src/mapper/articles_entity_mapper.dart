import 'package:data/data.dart';
import 'package:remote/src/mapper/entity_mapper.dart';
import 'package:remote/src/models/article/article_model.dart';

class ArticlesEntityMapper
    implements EntityMapper<ArticleModel, ArticlesEntity> {
  @override
  ArticlesEntity mapFromModel(ArticleModel articleModel) {
    return ArticlesEntity(
        id: articleModel.id,
        title: articleModel.title,
        source: articleModel.source,
        publishedDate: articleModel.publishedDate,
        summary: articleModel.summary,
        image: articleModel.media[0].mediaMetaData[0].url);
  }
}

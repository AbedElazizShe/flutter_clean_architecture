import 'package:data/data.dart';
import 'package:injectable/injectable.dart';
import 'package:remote/src/mapper/entity_mapper.dart';
import 'package:remote/src/models/article/article_model.dart';

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
        image: articleModel.media.isNotEmpty
            ? articleModel.media[0].mediaMetaData[0].url
            : null);
  }
}

import 'package:data/src/entities/articles/articles_entity.dart';
import 'package:data/src/mapper/mapper.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@injectable
class ArticlesMapper implements Mapper<ArticlesEntity, ArticleModel> {
  @override
  ArticleModel mapFromEntity(ArticlesEntity type) => ArticleModel(
      id: type.id,
      url: type.url,
      title: type.title,
      source: type.source,
      publishedDate: type.publishedDate,
      summary: type.summary,
      image: type.image);

  @override
  ArticlesEntity mapToEntity(ArticleModel type) => ArticlesEntity(
      id: type.id,
      url: type.url,
      title: type.title,
      source: type.source,
      publishedDate: type.publishedDate,
      summary: type.summary,
      image: type.image);
}

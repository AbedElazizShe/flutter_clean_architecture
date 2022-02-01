import 'article_media_model.dart';

class ArticleModel {
  const ArticleModel({
    required this.id,
    required this.url,
    required this.title,
    required this.source,
    required this.publishedDate,
    required this.summary,
    required this.media,
  });

  final int id;
  final String url;
  final String title;
  final String source;
  final String publishedDate;
  final String summary;
  final List<ArticleMediaModel> media;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ArticleModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          url == other.url &&
          title == other.title &&
          source == other.source &&
          publishedDate == other.publishedDate &&
          summary == other.summary &&
          media == other.media);

  @override
  int get hashCode =>
      id.hashCode ^
      url.hashCode ^
      title.hashCode ^
      source.hashCode ^
      publishedDate.hashCode ^
      summary.hashCode ^
      media.hashCode;

  @override
  String toString() {
    return '''ArticleModel{ 
     id: $id,
     url: $url,
     title: $title,
     source: $source,
     publishedDate: $publishedDate,
     summary: $summary,
     media: $media,
     };''';
  }

  ArticleModel copyWith({
    int? id,
    String? url,
    String? title,
    String? source,
    String? publishedDate,
    String? summary,
    List<ArticleMediaModel>? media,
  }) {
    return ArticleModel(
      id: id ?? this.id,
      url: url ?? this.url,
      title: title ?? this.title,
      source: source ?? this.source,
      publishedDate: publishedDate ?? this.publishedDate,
      summary: summary ?? this.summary,
      media: media ?? this.media,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
      'title': title,
      'source': source,
      'published_date': publishedDate,
      'abstract': summary,
      'media': media,
    };
  }

  factory ArticleModel.fromJson(Map<String, dynamic> map) {
    return ArticleModel(
      id: map['id'] as int,
      url: map['url'] as String,
      title: map['title'] as String,
      source: map['source'] as String,
      publishedDate: map['published_date'] as String,
      summary: map['abstract'] as String,
      media: List.from(map['media'])
          .map((item) => ArticleMediaModel.fromJson(item))
          .toList(),
    );
  }
}

class ArticleModel {
  const ArticleModel({
    required this.id,
    required this.url,
    required this.title,
    required this.source,
    required this.publishedDate,
    required this.summary,
    required this.image,
  });

  final int id;
  final String url;
  final String title;
  final String source;
  final String publishedDate;
  final String summary;
  final String? image;

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
          image == other.image);

  @override
  int get hashCode =>
      id.hashCode ^
      url.hashCode ^
      title.hashCode ^
      source.hashCode ^
      publishedDate.hashCode ^
      summary.hashCode ^
      image.hashCode;

  @override
  String toString() {
    return 'ArticleModel{'
        ' id: $id,'
        ' url: $url,'
        ' title: $title,'
        ' source: $source,'
        ' publishedDate: $publishedDate,'
        ' summary: $summary,'
        ' image: $image,'
        '}';
  }

  ArticleModel copyWith({
    int? id,
    String? url,
    String? title,
    String? source,
    String? publishedDate,
    String? summary,
    String? image,
  }) {
    return ArticleModel(
      id: id ?? this.id,
      url: url ?? this.url,
      title: title ?? this.title,
      source: source ?? this.source,
      publishedDate: publishedDate ?? this.publishedDate,
      summary: summary ?? this.summary,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
      'title': title,
      'source': source,
      'publishedDate': publishedDate,
      'summary': summary,
      'image': image,
    };
  }

  factory ArticleModel.fromJson(Map<String, dynamic> map) {
    return ArticleModel(
      id: map['id'] as int,
      url: map['url'] as String,
      title: map['title'] as String,
      source: map['source'] as String,
      publishedDate: map['publishedDate'] as String,
      summary: map['summary'] as String,
      image: map['image'] as String?,
    );
  }
}

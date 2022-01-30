class ArticleMediaMetaDataModel {
  const ArticleMediaMetaDataModel({
    required this.url,
  });

  final String url;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ArticleMediaMetaDataModel &&
          runtimeType == other.runtimeType &&
          url == other.url);

  @override
  int get hashCode => url.hashCode;

  @override
  String toString() {
    return 'ArticleMediaMetaData{' ' url: $url,' '}';
  }

  ArticleMediaMetaDataModel copyWith({
    String? url,
  }) {
    return ArticleMediaMetaDataModel(
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
    };
  }

  factory ArticleMediaMetaDataModel.fromJson(Map<String, dynamic> map) {
    return ArticleMediaMetaDataModel(
      url: map['url'] as String,
    );
  }
}

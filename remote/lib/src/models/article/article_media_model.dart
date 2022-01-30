import 'package:remote/src/models/article/article_media_metadata_model.dart';

class ArticleMediaModel {
  const ArticleMediaModel({
    required this.mediaMetaData,
  });

  final List<ArticleMediaMetaDataModel> mediaMetaData;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ArticleMediaModel &&
          runtimeType == other.runtimeType &&
          mediaMetaData == other.mediaMetaData);

  @override
  int get hashCode => mediaMetaData.hashCode;

  @override
  String toString() {
    return 'ArticleMediaModel{' ' mediaMetaData: $mediaMetaData,' '}';
  }

  ArticleMediaModel copyWith({
    List<ArticleMediaMetaDataModel>? mediaMetaData,
  }) {
    return ArticleMediaModel(
      mediaMetaData: mediaMetaData ?? this.mediaMetaData,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'media-metadata': mediaMetaData,
    };
  }

  factory ArticleMediaModel.fromJson(Map<String, dynamic> map) {
    return ArticleMediaModel(
      mediaMetaData: List.from(map['media-metadata'])
          .map((item) => ArticleMediaMetaDataModel.fromJson(item))
          .toList(),
    );
  }
}

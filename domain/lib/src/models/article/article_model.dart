class ArticleModel {
  const ArticleModel({
    required this.id,
    required this.title,
    required this.source,
    required this.publishedDate,
    required this.summary,
    required this.image,
  });

  final int id;
  final String title;
  final String source;
  final String publishedDate;
  final String summary;
  final String image;
}

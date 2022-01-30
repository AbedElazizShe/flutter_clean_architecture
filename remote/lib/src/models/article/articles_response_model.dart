import 'package:remote/src/models/article/article_model.dart';

class ArticlesResponseModel {
  const ArticlesResponseModel({
    required this.status,
    required this.results,
  });

  final String status;
  final List<ArticleModel> results;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ArticlesResponseModel &&
          runtimeType == other.runtimeType &&
          status == other.status &&
          results == other.results);

  @override
  int get hashCode => status.hashCode ^ results.hashCode;

  @override
  String toString() {
    return '''ArticlesResponseModel{
        status: $status,
        results: $results,
        };''';
  }

  ArticlesResponseModel copyWith({
    String? status,
    List<ArticleModel>? results,
  }) {
    return ArticlesResponseModel(
      status: status ?? this.status,
      results: results ?? this.results,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'results': results,
    };
  }

  factory ArticlesResponseModel.fromJson(Map<String, dynamic> map) {
    return ArticlesResponseModel(
      status: map['status'] as String,
      results: List.from(map['results'])
          .map((item) => ArticleModel.fromJson(item))
          .toList(),
    );
  }
}

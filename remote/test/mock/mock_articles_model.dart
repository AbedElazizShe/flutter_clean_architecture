import 'dart:math';

import 'package:data/data.dart';
import 'package:remote/src/models/article/article_media_metadata_model.dart';
import 'package:remote/src/models/article/article_media_model.dart';
import 'package:remote/src/models/article/article_model.dart';
import 'package:remote/src/models/article/articles_response_model.dart';

ArticlesResponseModel get mockArticlesResponseModel =>
    ArticlesResponseModel(status: randomString(), results: mockArticleModel);

List<ArticleModel> get mockArticleModel => <ArticleModel>[
      ArticleModel(
        id: 100000008172772,
        url:
            'https://www.nytimes.com/2022/01/24/business/sarah-palin-covid.html',
        title:
            'Sarah Palin Tests Positive, Delaying Libel Case Against The Times',
        source: 'New York Times',
        publishedDate: '2022-01-24',
        summary:
            'Jed S. Rakoff, the judge in the trial, said it would now begin on Feb. 3, after three positive test results for Ms. Palin.',
        media: mockArticleMediaModel,
      )
    ];

ArticlesEntity get mockArticlesEntity => ArticlesEntity(
    id: 100000008172772,
    url: 'https://www.nytimes.com/2022/01/24/business/sarah-palin-covid.html',
    title: 'Sarah Palin Tests Positive, Delaying Libel Case Against The Times',
    source: 'New York Times',
    publishedDate: '2022-01-24',
    summary:
        'Jed S. Rakoff, the judge in the trial, said it would now begin on Feb. 3, after three positive test results for Ms. Palin.',
    image:
        'https://static01.nyt.com/images/2022/01/24/business/24economy-briefing-palin-trial/24economy-briefing-palin-trial-thumbStandard.jpg');

List<ArticleMediaModel> get mockArticleMediaModel => <ArticleMediaModel>[
      ArticleMediaModel(mediaMetaData: mockArticleMediaMetaDataModel)
    ];

List<ArticleMediaMetaDataModel> get mockArticleMediaMetaDataModel =>
    <ArticleMediaMetaDataModel>[
      const ArticleMediaMetaDataModel(
          url:
              'https://static01.nyt.com/images/2022/01/24/business/24economy-briefing-palin-trial/24economy-briefing-palin-trial-thumbStandard.jpg')
    ];

String randomString({int len = 10}) {
  var r = Random();
  return String.fromCharCodes(
      List.generate(len, (index) => r.nextInt(33) + 89));
}

import 'dart:math';

import 'package:data/data.dart';

List<ArticlesEntity> get mockArticles => <ArticlesEntity>[
      ArticlesEntity(
          id: 100000008172772,
          url:
              'https://www.nytimes.com/2022/01/24/business/sarah-palin-covid.html',
          title:
              'Sarah Palin Tests Positive, Delaying Libel Case Against The Times',
          source: 'New York Times',
          publishedDate: '2022-01-24',
          summary:
              'Jed S. Rakoff, the judge in the trial, said it would now begin on Feb. 3, after three positive test results for Ms. Palin.',
          image:
              'https://static01.nyt.com/images/2022/01/24/business/24economy-briefing-palin-trial/24economy-briefing-palin-trial-thumbStandard.jpg'),
    ];

String randomString({int len = 10}) {
  var r = Random();
  return String.fromCharCodes(
      List.generate(len, (index) => r.nextInt(33) + 89));
}

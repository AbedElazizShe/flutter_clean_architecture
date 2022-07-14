import 'package:config/base_localisation.dart';

class ArabicLocalization extends BaseLocalisation {
  ArabicLocalization() : super(code: 'ar', name: 'Arabic', country: '');

  @override
  String get labelAppName => 'تطبيق تجريبي';

  @override
  String get labelMostEmailedArticles => 'الاكثر مراسلة';

  @override
  String get labelMostSharedArticles => 'الاكثر مشاركة';

  @override
  String get labelMostViewedArticles => 'الاكثر مشاهدة';

  @override
  String get infoFABMessage => 'هذا المشروع رقم 1';

  @override
  String get labelFAB => 'اضغط هنا';
}

class EnglishLocalization extends BaseLocalisation {
  EnglishLocalization() : super(code: 'en', name: 'English', country: '');

  @override
  String get labelAppName => "Custom App";

  @override
  String get labelMostEmailedArticles => 'Most Emailed Articles';

  @override
  String get labelMostSharedArticles => 'Most Shared Articles';

  @override
  String get labelMostViewedArticles => 'Most Viewed Articles';

  @override
  String get infoFABMessage => 'This is a custom app';

  @override
  String get labelFAB => 'Click Here';
}


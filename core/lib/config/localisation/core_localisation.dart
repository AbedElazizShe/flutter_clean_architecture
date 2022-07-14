import 'package:config/base_localisation.dart';

/// Localisation language specific to the core project. Other Languages can be
/// added the same way this class is added as long as it inherits from
/// [BaseLocalisation] class.
class EnglishLocalization extends BaseLocalisation {
  EnglishLocalization() : super(code: 'en', name: 'English', country: '');

  @override
  String get labelAppName => "Core App";

  @override
  String get labelMostEmailedArticles => 'Most Emailed Articles';

  @override
  String get labelMostSharedArticles => 'Most Shared Articles';

  @override
  String get labelMostViewedArticles => 'Most Viewed Articles';

  @override
  String get infoFABMessage => 'This is core app';

  @override
  String get labelFAB => '';
}


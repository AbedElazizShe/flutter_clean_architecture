import 'package:get_localization/get_localization.dart';

abstract class BaseLocalisation extends Localization {
  BaseLocalisation({
    required super.code,
    required super.name,
    super.country,
  });

  String get labelAppName;

  String get labelMostEmailedArticles;

  String get labelMostSharedArticles;

  String get labelMostViewedArticles;
  
  String get infoFABMessage;
  
  String get labelFAB;
}

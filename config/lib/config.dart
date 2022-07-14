import 'package:flutter/material.dart';
import 'package:get_localization/get_localization.dart';
import 'base_localisation.dart';

abstract class AppConfiguration {

  String endpoint();

  ThemeData theme();

  Route<dynamic> routeFactory(RouteSettings settings,
      BaseLocalisation localisation);

  Widget widgetProvider(String identifier, BaseLocalisation localisation,
      {BuildContext? context, Function? onEvent, Map<String,
          dynamic>? arguments,});

  List<Localization> supportedLocalizations();

  List<Locale> supportedLanguages();

  List<dynamic> blocs();
}

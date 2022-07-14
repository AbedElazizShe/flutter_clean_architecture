import 'package:config/base_localisation.dart';
import 'package:flutter/material.dart';

import 'core_localisation.dart';

/// App Locale that can be injected at top widget so it can be passed to all
/// widgets in the widgets tree.
class AppLocaleProvider extends InheritedWidget {
  const AppLocaleProvider({
    required this.baseLocalisation,
    required super.child,
    super.key,
  });

  final BaseLocalisation baseLocalisation;

  static BaseLocalisation of(BuildContext context) =>
      context
          .findAncestorWidgetOfExactType<AppLocaleProvider>()
          ?.baseLocalisation ??
      EnglishLocalization();

  @override
  bool updateShouldNotify(AppLocaleProvider oldWidget) => false;
}

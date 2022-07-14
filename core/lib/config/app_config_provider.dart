import 'package:config/config.dart';
import 'package:flutter/material.dart';

import 'default_configuration.dart';

class AppConfigProvider extends InheritedWidget {
  const AppConfigProvider({
    required this.appConfig,
    required super.child,
    super.key,
  });

  final AppConfiguration appConfig;

  static AppConfiguration of(BuildContext context) =>
      context.findAncestorWidgetOfExactType<AppConfigProvider>()?.appConfig ??
      DefaultConfiguration();

  @override
  bool updateShouldNotify(AppConfigProvider oldWidget) => false;
}

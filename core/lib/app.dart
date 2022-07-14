import 'package:config/base_localisation.dart';
import 'package:core/config/app_config_provider.dart';
import 'package:core/config/localisation/app_locale_provider.dart';
import 'package:core/config/localisation/fallback_localizations_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_localization/get_localization.dart';

import 'config/route.dart' as route;

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();

    Localization.localizations
      ..addAll(AppConfigProvider.of(context).supportedLocalizations());
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
    ]);

    return Builder(builder: (context) {
      return AppLocaleProvider(
        baseLocalisation: Localization.currentLocalization as BaseLocalisation,
        child: MaterialApp(
          title: AppLocaleProvider.of(context).labelAppName,
          theme: AppConfigProvider.of(context).theme(),
          supportedLocales: AppConfigProvider.of(context).supportedLanguages(),
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            FallbackLocalizationDelegate()
          ],
          onGenerateRoute: (RouteSettings settings) =>
              AppConfigProvider.of(context).routeFactory(settings,
                  Localization.currentLocalization as BaseLocalisation),
          initialRoute: route.landingScreen,
        ),
      );
    });
  }
}

import 'package:config/base_localisation.dart';
import 'package:config/config.dart';
import 'package:core/config/localisation/core_localisation.dart';
import 'package:core/config/route.dart';
import 'package:core/config/widgets.dart';
import 'package:core/features/articles/presentation/articles_screen.dart';
import 'package:core/features/landing_screen/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_localization/get_localization.dart';

class DefaultConfiguration extends AppConfiguration {

  @override
  String endpoint() => 'https://api.nytimes.com/svc/';

  @override
  ThemeData theme() {
    const ColorScheme colorScheme = ColorScheme.light(
      primary: Colors.white,
      primaryContainer: Color(0xffcccccc),
      onPrimary: Colors.black54,
      secondary: Color(0xffffeb3b),
      secondaryContainer: Color(0xffc8b900),
      onSecondary: Color(0x8C000000),
    );

    return ThemeData.from(colorScheme: colorScheme).copyWith(
      buttonTheme: const ButtonThemeData(colorScheme: colorScheme),
    );
  }

  @override
  Route routeFactory(RouteSettings settings, BaseLocalisation baseLocalisation) {
    switch (settings.name) {
      case landingScreen:
        return MaterialPageRoute<LandingScreen>(
            builder: (BuildContext context) => const LandingScreen());
      case articlesScreen:
        return MaterialPageRoute<ArticlesScreen>(
            settings: settings,
            builder: (BuildContext context) => const ArticlesScreen());

      default:
        throw Exception('This route name does not exit');
    }
  }

  @override
  Widget widgetProvider(String identifier,
      BaseLocalisation localisation,
      {BuildContext? context,
      Function? onEvent,
      Map<String, dynamic>? arguments}) {
    if (identifier == floatingButtonIdentifier) {
      return FloatingActionButton(
        onPressed: () => onEvent?.call(),
        child: const Icon(Icons.sort),
      );
    }

    return const SizedBox.shrink();
  }

  @override
  List<Locale> supportedLanguages() => <Locale>[
        const Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
      ];

  @override
  List<Localization> supportedLocalizations() => <Localization>[
        EnglishLocalization(),
      ];

  @override
  List<dynamic> blocs() => [];
}

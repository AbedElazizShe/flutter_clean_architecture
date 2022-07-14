import 'package:config/base_localisation.dart';
import 'package:config/config.dart';
import 'package:core/features/landing_screen/landing_screen.dart';
import 'package:custom_1/config/localisation/custom_localisation.dart';
import 'package:custom_1/config/route.dart';
import 'package:custom_1/config/widgets.dart';
import 'package:custom_1/custom_screen.dart';
import 'package:custom_1/states/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_localization/get_localization.dart';

class CustomConfiguration extends AppConfiguration {
  @override
  String endpoint() => 'https://api.nytimes.com/svc/';

  @override
  ThemeData theme() {
    const colorScheme = ColorScheme.light(
      primary: Colors.cyan,
      primaryContainer: Color(0xffcccccc),
      onPrimary: Colors.black54,
      secondary: Color(0xffef9a9a),
      secondaryContainer: Color(0xffba6b6c),
      onSecondary: Color(0x9E000000),
    );

    return ThemeData.from(colorScheme: colorScheme).copyWith(
      buttonTheme: const ButtonThemeData(colorScheme: colorScheme),
    );
  }

  @override
  Route routeFactory(RouteSettings settings, BaseLocalisation localisation) {
    switch (settings.name) {
      case landingScreen:
        return MaterialPageRoute<LandingScreen>(
            builder: (BuildContext context) => const LandingScreen());
      case articlesScreen:
        return MaterialPageRoute<CustomScreen>(
            settings: settings,
            builder: (BuildContext context) => CustomScreen(
                  localisation: localisation,
                ));

      default:
        throw Exception('This route name does not exit');
    }
  }

  @override
  Widget widgetProvider(
    String identifier,
    BaseLocalisation localisation, {
    BuildContext? context,
    Function? onEvent,
    Map<String, dynamic>? arguments,
  }) {
    if (identifier == floatingButtonIdentifier) {
      return FloatingActionButton.extended(
        onPressed: () {
          if (context != null) {
            showDialog(
                context: context,
                builder: (_) => AlertDialog(
                      title: Text(localisation.labelAppName),
                      content: Text(localisation.infoFABMessage),
                    ));
          }
        },
        label: Text(localisation.labelFAB),
        icon: const Icon(Icons.sort),
      );
    }

    return const SizedBox.shrink();
  }

  @override
  List<Locale> supportedLanguages() => <Locale>[
        const Locale.fromSubtags(languageCode: 'ar', countryCode: 'MA'),
        const Locale.fromSubtags(languageCode: 'en', countryCode: 'US')
      ];

  @override
  List<Localization> supportedLocalizations() =>
      <Localization>[ArabicLocalization(), EnglishLocalization()];

  @override
  List blocs() {
    return [
      BlocProvider(create: (_) => CounterCubit()),
    ];
  }
}

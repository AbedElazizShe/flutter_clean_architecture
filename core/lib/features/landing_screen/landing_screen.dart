import 'package:core/config/app_config_provider.dart';
import 'package:core/config/localisation/app_locale_provider.dart';
import 'package:core/config/route.dart';
import 'package:core/config/widgets.dart';
import 'package:core/core/enums.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocaleProvider.of(context).labelAppName),
      ),
      floatingActionButton: _floatingActionButton(context),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () => navigate(context, ContentType.mostEmailed),
                child: Text(
                    AppLocaleProvider.of(context).labelMostEmailedArticles)),
            ElevatedButton(
                onPressed: () => navigate(context, ContentType.mostViewed),
                child: Text(
                    AppLocaleProvider.of(context).labelMostViewedArticles)),
            ElevatedButton(
                onPressed: () => navigate(context, ContentType.mostShared),
                child: Text(
                    AppLocaleProvider.of(context).labelMostSharedArticles)),
          ],
        ),
      ),
    );
  }

  Widget _floatingActionButton(BuildContext context) {
    return AppConfigProvider.of(context).widgetProvider(
        floatingButtonIdentifier, AppLocaleProvider.of(context),
        context: context, onEvent: () {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      final SnackBar snackBar = SnackBar(
        content: Text(AppLocaleProvider.of(context).infoFABMessage),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  void navigate(BuildContext context, ContentType type) {
    Navigator.pushNamed(context, articlesScreen, arguments: type);
  }
}

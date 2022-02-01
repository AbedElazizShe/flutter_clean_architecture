import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/enums.dart';
import 'package:flutter_clean_architecture/route.dart' as route;

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Demo App'),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  onPressed: () => navigate(context, ContentType.mostEmailed),
                  child: const Text('Most Emailed Articles')),
              ElevatedButton(
                  onPressed: () => navigate(context, ContentType.mostViewed),
                  child: const Text('Most Viewed Articles')),
              ElevatedButton(
                  onPressed: () => navigate(context, ContentType.mostShared),
                  child: const Text('Most Shared Articles')),
            ],
          ),
        ),
      );

  void navigate(BuildContext context, ContentType type) {
    Navigator.pushNamed(context, route.articlesScreen, arguments: type);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'route.dart' as route;

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
    ]);

    return const MaterialApp(
      title: 'Demo',
      onGenerateRoute: route.controller,
      initialRoute: route.articlesScreen,
    );
  }
}

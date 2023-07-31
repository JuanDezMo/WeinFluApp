import 'package:flutter/material.dart';
import 'package:my_first_app/design/themes.dart';
import 'package:my_first_app/pages/home_page.dart';

class WeinFluApp extends StatelessWidget {
  const WeinFluApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: WeinFluThemes.defaultTheme,
        home: const HomePage(key: Key('Home Page'))
        );
  }
}

import 'package:flutter/material.dart';
import 'package:my_first_app/design/themes.dart';
import 'package:my_first_app/pages/home_page.dart';
import 'package:my_first_app/pages/new_page.dart';
import 'package:my_first_app/pages/other_page.dart';

import '../config/app_routes.dart';
import '../models/user.dart';

class WeinFluApp extends StatelessWidget {
  const WeinFluApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: WeinFluThemes.defaultTheme,
//        home: const HomePage(key: Key('Home Page')),
        /*routes: {
          AppRoutes.newPage: (context) => const NewPage(),
          AppRoutes.otherPage: (context) => const OtherPage(),
          AppRoutes.home: (context) => const HomePage()
        },*/
        onGenerateRoute: (settings) {
          switch ( settings.name ) {
            case AppRoutes.newPage:
              return MaterialPageRoute(builder: (context) => const NewPage());
            case AppRoutes.otherPage:
              return MaterialPageRoute(
                builder: (context) =>  OtherPage(userData: settings.arguments as User));

            default:
              return MaterialPageRoute(builder: (context) => const HomePage());
          }
        },
        
        );
  }
}

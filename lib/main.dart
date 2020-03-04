import 'package:ebay_search_flutter/util/AppConfig.dart';
import 'package:ebay_search_flutter/util/HexColor.dart';
import 'package:ebay_search_flutter/views/splash.dart';
import 'package:flutter/material.dart';

import 'util/AppConfig.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    Map<int, Color> ebayBlueColorCodes = {
      50: Color.fromRGBO(0, 100, 210, .1),
      100: Color.fromRGBO(0, 100, 210, .2),
      200: Color.fromRGBO(0, 100, 210, .3),
      300: Color.fromRGBO(0, 100, 210, .4),
      400: Color.fromRGBO(0, 100, 210, .5),
      500: Color.fromRGBO(0, 100, 210, .6),
      600: Color.fromRGBO(0, 100, 210, .7),
      700: Color.fromRGBO(0, 100, 210, .8),
      800: Color.fromRGBO(0, 100, 210, .9),
      900: Color.fromRGBO(0, 100, 210, 1),
    };

    MaterialColor materialBlue =
        new MaterialColor(0xFF0064D2, ebayBlueColorCodes);
    return MaterialApp(
      title: AppConfig.appName,
      theme: ThemeData(
        primarySwatch: materialBlue,
        hintColor: Colors.white,
        accentColor: Colors.white,
        textSelectionColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),

        indicatorColor: HexColor(AppConfig.ebayColorGreen),
      ),
      home: Splash(),
    );
  }
}

import 'package:ebay_search_flutter/util/AppConfig.dart';
import 'package:ebay_search_flutter/views/splash.dart';
import 'package:flutter/material.dart';

import 'util/AppConfig.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConfig.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash(),
    );
  }
}
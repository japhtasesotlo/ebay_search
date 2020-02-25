import 'dart:async';

import 'package:awesome_loader/awesome_loader.dart';
import 'package:ebay_search_flutter/util/AppConfig.dart';
import 'package:ebay_search_flutter/util/HexColor.dart';
import 'package:ebay_search_flutter/views/home.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _delayScreen(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/logo_trans.png',
                height: 187,
                width: 187,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: AwesomeLoader(
                  loaderType: AwesomeLoader.AwesomeLoader3,
                  color: HexColor(AppConfig.hexColorGreen),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

Future<void> _delayScreen(BuildContext context) async {
  await Future.delayed(Duration(milliseconds: 5000), () {
    _navigateToHome(context);
  });
}

void _navigateToHome(BuildContext context) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (BuildContext context) => Home(
            title: AppConfig.appName,
          )));
}

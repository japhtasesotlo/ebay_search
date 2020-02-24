import 'dart:async';

import 'package:ebay_search_flutter/home.dart';
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
          alignment: Alignment.center,
          children: <Widget>[
            Image.asset(
              'assets/logo_trans.png',
              height: 250,
              width: 250,
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
            title: "ebay Search",
          )));
}

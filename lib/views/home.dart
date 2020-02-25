import 'package:ebay_search_flutter/util/AppConfig.dart';
import 'package:ebay_search_flutter/util/HexColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor(AppConfig.hexColorGreen),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/logo_trans_white.png',
              fit: BoxFit.cover,
              height: 79.0,
            ),
          ],
        ),
      ),
      body: Container(
//        child: Text(
//        ),

        decoration: BoxDecoration(color: Colors.white70),
      ),
    );
  }
}

import 'package:ebay_search_flutter/util/AppConfig.dart';
import 'package:ebay_search_flutter/util/HexColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../util/AppConfig.dart';
import '../util/HexColor.dart';

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
        backgroundColor: HexColor(AppConfig.hexColorYellow),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/logo_trans_white.png',
              fit: BoxFit.contain,
              height: 79.0,
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  'This is a text view',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 16.0,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    color: HexColor(AppConfig.hexColorGrey),
                  ),
                  maxLines: 1,
                ),
              )
            ],
          ), //***Text View ***
          Row(), //*** Search ***
          Row(), //*** Search result List ***
        ],
      ),
    );
  }
}

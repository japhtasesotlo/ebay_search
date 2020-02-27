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
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              AppConfig.assetLogoTransWhite,
              fit: BoxFit.contain,
              height: AppConfig.imageAppBarSize,
            ),
          ],
        ),

        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
        body:
        Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                AppConfig.assetLogoTransGrey,
                height: AppConfig.imageHomeSize,
                width: AppConfig.imageHomeSize,
              ),
              Text(
                AppConfig.homeTitle,
                style: TextStyle(
                  fontFamily: AppConfig.fontFamily,
                  fontSize: AppConfig.fontSizeHeader,
                  fontStyle: FontStyle.normal,
                  color: HexColor(AppConfig.hexColorGrey),
                ),
                maxLines: 1,
              ),
              Text(
                AppConfig.homeSubtitle,
                style: TextStyle(
                  fontFamily: AppConfig.fontFamily,
                  fontSize: AppConfig.fontSizeNormal,
                  fontStyle: FontStyle.normal,
                  color: HexColor(AppConfig.hexColorGrey),
                ),
                maxLines: 1,
              ),

            ],
          ),
        )
    );
  }
}

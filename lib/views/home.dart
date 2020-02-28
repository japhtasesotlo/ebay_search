import 'package:ebay_search_flutter/util/AppConfig.dart';
import 'package:ebay_search_flutter/util/EbaySearchDelegate.dart';
import 'package:ebay_search_flutter/util/HexColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
          backgroundColor: HexColor(AppConfig.ebayColorBlue),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                AppConfig.pathLogoTransWhite,
                fit: BoxFit.contain,
                height: AppConfig.imageAppBarSize,
              ),
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: EbaySearchDelegate(),
                );
              },
            ),
          ],
        ),
        body: Align(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(
                    AppConfig.marginZero,
                    AppConfig.marginTopImage,
                    AppConfig.marginZero,
                    AppConfig.marginZero),
                child: Image.asset(
                  AppConfig.pathLogoTransGrey,
                  height: AppConfig.imageHomeSize,
                  width: AppConfig.imageHomeSize,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    AppConfig.marginEdge, 7.0, AppConfig.marginEdge, 1.0),
                child: Text(
                  AppConfig.homeTitle,
                  style: TextStyle(
                    fontFamily: AppConfig.ebayFontFamily,
                    fontSize: AppConfig.fontSizeLarge,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    color: HexColor(AppConfig.hexColorGrey),
                  ),
                  maxLines: 1,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      AppConfig.marginEdge,
                      AppConfig.marginTopSubtext,
                      AppConfig.marginEdge,
                      AppConfig.marginZero),
                  child: Text(
                    AppConfig.homeSubtitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: AppConfig.ebayFontFamily,
                      fontSize: AppConfig.fontSizeMedium,
                      fontStyle: FontStyle.normal,
                      color: HexColor(AppConfig.hexColorGrey),
                    ),
                    maxLines: 2,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

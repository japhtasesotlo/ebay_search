import 'package:ebay_search_flutter/views/ItemsListView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AppConfig.dart';

class EbaySearchDelegate extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    ThemeData theme;
    if (context != null) {
      theme = Theme.of(context);
      theme.copyWith(
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(
              title: TextStyle(
            color: Colors.white,
            fontFamily: AppConfig.openSansFontFamily,
            fontStyle: FontStyle.normal,
            fontSize: AppConfig.fontSizeMedium,
          )),
        ),
      );
    }
    return theme;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = AppConfig.blank;
          ItemsListView(query);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    int queryLength = query.length;
    if (queryLength != 0 && queryLength < 3) {
      return CupertinoAlertDialog(
        title: Align(
          alignment: Alignment.center,
          child: Text(AppConfig.error, style: popUpStyle),
        ),
        content: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.all(AppConfig.marginNormal),
              child: Text(AppConfig.textFewChars, style: popUpStyle),
            )),
        actions: <Widget>[
          Align(
            alignment: Alignment.center,
            child: FlatButton(
              onPressed: () => Navigator.pop(context),
              child: Text(AppConfig.ok, style: popUpStyle),
            ),
          ),
        ],
      );
    } else {
      return ItemsListView(query);
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column();
  }

  final TextStyle popUpStyle = TextStyle(
      fontFamily: AppConfig.openSansFontFamily,
      fontSize: AppConfig.fontSizeLarge,
      fontStyle: FontStyle.normal,
      color: Colors.black);
}

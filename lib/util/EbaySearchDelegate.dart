import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AppConfig.dart';
import 'HexColor.dart';

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
              textColor: HexColor(AppConfig.ebayColorRed),
              onPressed: () => Navigator.pop(context),
              child: Text(AppConfig.ok, style: popUpStyle),
            ),
          ),
        ],
      );
    }
    print("Searching for: $query");
    // TODO: implement API Call
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    print("buildSuggestions");
    // TODO: implement buildSuggestions
    return Column();
  }

  final TextStyle popUpStyle = TextStyle(
      fontFamily: AppConfig.openSansFontFamily,
      fontSize: AppConfig.fontSizeLarge,
      fontStyle: FontStyle.normal,
      color: Colors.black);
}

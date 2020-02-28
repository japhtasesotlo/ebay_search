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
    if (query.length < 3) {
      //TODO Add Popup for this
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Search term must be longer than two letters.",
            ),
          )
        ],
      );
    } else {
      print("Will continue searching");
    }
    // TODO: implement buildResults
    return Column();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Column();
  }
}

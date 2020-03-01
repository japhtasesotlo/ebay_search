import 'dart:async';
import 'dart:convert';

import 'package:ebay_search_flutter/models/Item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'AppConfig.dart';

class EbaySearchDelegate extends SearchDelegate {
  String endpoint = "";
  Item item;

  Future<Item> searchItems(String query) async {
    endpoint = AppConfig.endpointSearch + query;
    print("Endpoint: $endpoint");

    final response = await http.get(AppConfig.mockEndpoint);
    if (response.statusCode == 200) {
      item = Item.fromJson(json.decode(response.body));
      return item;
    }

    else {
      throw Exception('Failed to load album');
    }
  }

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
              onPressed: () => Navigator.pop(context),
              child: Text(AppConfig.ok, style: popUpStyle),
            ),
          ),
        ],
      );
    } else {
      searchItems(query);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[],
    );
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

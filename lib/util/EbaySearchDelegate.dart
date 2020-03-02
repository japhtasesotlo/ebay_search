import 'package:ebay_search_flutter/interfaces/DialogClickListener.dart';
import 'package:ebay_search_flutter/util/DialogHelper.dart';
import 'package:ebay_search_flutter/views/ItemsListView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AppConfig.dart';

class EbaySearchDelegate extends SearchDelegate implements DialogClickListener {

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
          inputDecorationTheme: InputDecorationTheme(hintStyle: Theme
              .of(context)
              .textTheme
              .title
              .copyWith(color: Colors.white),)
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
      return DialogHelper(this).getDialog(
          context, AppConfig.error, AppConfig.textFewChars);
    } else {
      return ItemsListView(query);
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column();
  }

  @override
  void onButtonClick(BuildContext context) {
    Navigator.pop(context);
  }
}

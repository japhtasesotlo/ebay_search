import 'dart:async';
import 'dart:convert';

import 'package:ebay_search_flutter/models/Item.dart';
import 'package:ebay_search_flutter/models/ItemSummary.dart';
import 'package:ebay_search_flutter/util/AppConfig.dart';
import 'package:ebay_search_flutter/util/HexColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class ItemsListView extends StatelessWidget {
  String query;
  String endpoint = "";
  Item item;
  List<ItemSummary> searchedItems;

  ItemsListView(this.query);

  @override
  Widget build(BuildContext context) {
    if (this.query != AppConfig.blank) {
      return FutureBuilder<Item>(
        future: searchItems(this.query),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Item data = snapshot.data;
            searchedItems = data.itemSummaries;
            return _ItemsListView(searchedItems);
          } else if (snapshot.hasError) {
            return CupertinoAlertDialog(
              title: Align(
                alignment: Alignment.center,
                child: Text(AppConfig.error, style: popUpStyle),
              ),
              content: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.all(AppConfig.marginNormal),
                    child: Text("${snapshot.error}", style: popUpStyle),
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
          }
          return Loader();
        },
      );
    } else {
      return Scaffold();
    }
  }

  Future<Item> searchItems(String query) async {
    endpoint = AppConfig.endpointSearch + query;
    print("Endpoint: $endpoint");

    final response = await http.get(AppConfig.mockEndpoint);
    if (response.statusCode == 200) {
      item = Item.fromJson(json.decode(response.body));
      return item;
    } else {
      throw Exception('Failed to fetch items');
    }
  }

  ListView _ItemsListView(List<ItemSummary> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 16.0, bottom: 16.0, left: 16.0, right: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  searchedItems[index].title,
                  style: TextStyle(
                      fontSize: AppConfig.fontSizeMedium,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      AppConfig.marginZero,
                      AppConfig.marginSmall,
                      AppConfig.marginZero,
                      AppConfig.marginZero),
                  child: Text(
                    searchedItems[index].price.currency,
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  final TextStyle popUpStyle = TextStyle(
      fontFamily: AppConfig.openSansFontFamily,
      fontSize: AppConfig.fontSizeLarge,
      fontStyle: FontStyle.normal,
      color: Colors.black);
}

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: CircularProgressIndicator(
          backgroundColor: HexColor(AppConfig.ebayColorBlue),
          strokeWidth: AppConfig.loaderStokeWidth,
        ));
  }
}

import 'dart:async';
import 'dart:convert';

import 'package:ebay_search_flutter/interfaces/CardListener.dart';
import 'package:ebay_search_flutter/models/Item.dart';
import 'package:ebay_search_flutter/models/ItemSummary.dart';
import 'package:ebay_search_flutter/util/AppConfig.dart';
import 'package:ebay_search_flutter/util/HexColor.dart';
import 'package:ebay_search_flutter/views/CardListTile.dart';
import 'package:ebay_search_flutter/views/detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class ItemsListView extends StatelessWidget implements CardListener {
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
          elevation: 1.0,
          child: CardListTile(
            title: data[index].title,
            subtitle: data[index].price.value,
            cardListener: this,
            item: data[index],
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

  @override
  void isCardClicked(BuildContext context, ItemSummary itemSummary) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => Detail(item: itemSummary)));
  }
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

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:ebay_search_flutter/interfaces/CardListener.dart';
import 'package:ebay_search_flutter/interfaces/DialogClickListener.dart';
import 'package:ebay_search_flutter/models/Item.dart';
import 'package:ebay_search_flutter/models/ItemSummary.dart';
import 'package:ebay_search_flutter/util/AppConfig.dart';
import 'package:ebay_search_flutter/util/DialogHelper.dart';
import 'package:ebay_search_flutter/util/HexColor.dart';
import 'package:ebay_search_flutter/views/CardListTile.dart';
import 'package:ebay_search_flutter/views/detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


// ignore: must_be_immutable
class ItemsListView extends StatelessWidget
    implements CardListener, DialogClickListener {
  String query;
  String endpoint = "";
  Item item;
  List<ItemSummary> searchedItems;
  ItemsListView(this.query);

  @override
  void isCardClicked(BuildContext context, ItemSummary itemSummary) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => Detail(item: itemSummary)));
  }

  @override
  void onButtonClick(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    if (this.query != AppConfig.blank) {
      return FutureBuilder<Item>(
        future: searchItems(context, this.query).timeout(Duration(seconds: 60)),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null && snapshot.data.total > 0) {
              Item data = snapshot.data;
              searchedItems = data.itemSummaries;
              return _ItemsListView(searchedItems);
            } else {
              return DialogHelper(this).getDialog(
                  context, AppConfig.error, AppConfig.noResult);
            }
          } else if (snapshot.hasError) {
            return DialogHelper(this).getDialog(
                context, AppConfig.error, "${snapshot.error}");
          }
          return Loader();
        },
      );
    } else {
      return Scaffold();
    }
  }

  Future<Item> searchItems(BuildContext context, String query) async {
    endpoint = AppConfig.endpointSearch + query;

    Map<String, String> headers = {
      HttpHeaders.authorizationHeader: "Bearer " + AppConfig.authToken,
      AppConfig.keyMarket: AppConfig.authMarketValue,
      AppConfig.keyContentType: AppConfig.authContentTypeValue,
      AppConfig.keyEndUserContext: AppConfig.authEndUserContextValue,
    };

    print("Endpoint: $endpoint");
    final response = await http.get(endpoint, headers: headers);
    if (response.statusCode == 200) {
      item = Item.fromJson(json.decode(response.body));
      if (item.total < 0) {
        DialogHelper(this).getDialog(
            context, AppConfig.error,
            "We do not have any records that match $query");
      }
      else {
        return item;
      }
    }
    if (response.statusCode == 401) {
      //TODO Auth refresh must happen here
      DialogHelper(this).getDialog(
          context, AppConfig.error, response.reasonPhrase);
    }
    else {
      throw new Exception(response.reasonPhrase);
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

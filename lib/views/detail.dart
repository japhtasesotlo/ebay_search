import 'package:ebay_search_flutter/models/ItemSummary.dart';
import 'package:ebay_search_flutter/util/AppConfig.dart';
import 'package:ebay_search_flutter/util/HexColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final ItemSummary item;

  Detail({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
          title: Text(item.title),
          backgroundColor: HexColor(AppConfig.ebayColorBlue),
          actions: <Widget>[],
        ),
        body: Align(
            child: Container(
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Image.network(
                  item.itemWebUrl
                ),
              ),
            ],
          ),
        )));
  }
}

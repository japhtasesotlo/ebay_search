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
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.fromLTRB(
                    AppConfig.marginSmall,
                    AppConfig.marginNormal,
                    AppConfig.marginSmall,
                    AppConfig.marginNormal),
                child: Center(
                  child: Image.network(item.image.imageUrl),
                )),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Text(
                        item.title,
                        style: TextStyle(
                          fontFamily: AppConfig.openSansFontFamily,
                          fontSize: AppConfig.fontSizeHeader,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          color: HexColor(AppConfig.ebayColorGreen),
                        ),
                        maxLines: 2,
                      ),
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    child: Container(
                        child: Text(
                          item.price.value,
                          style: TextStyle(
                            fontFamily: AppConfig.openSansFontFamily,
                            fontSize: AppConfig.fontSizeLarge,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            color: HexColor(AppConfig.ebayColorRed),
                          ),
                          maxLines: 1,
                        ),
                        alignment: Alignment.centerRight),
                    flex: 2,
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                      child: styleMetaText(AppConfig.condition, item.condition),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                      child: styleMetaText(AppConfig.currentBidPrice,
                          item.currentBidPrice.value),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                      child: styleMetaText(AppConfig.itemLocation,
                          item.itemLocation.country),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                      child: styleMetaText(AppConfig.shippingCost,
                          item.shippingOptions.first.shippingCost.value),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                      child: styleMetaText(AppConfig.discountAmount,
                          item.marketingPrice.discountAmount.value),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                      child: styleMetaText(AppConfig.sellerName,
                          item.seller.username),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  RichText styleMetaText(String k, String v) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(text: k, style: metaStyle),
        TextSpan(
            text: v,
            style: TextStyle(
                fontFamily: AppConfig.openSansFontFamily,
                fontSize: AppConfig.fontSizeLarge,
                fontStyle: FontStyle.normal,
                color: HexColor(AppConfig.hexColorGrey),
                fontWeight: FontWeight.bold)),
      ]),
      maxLines: 1,
    );
  }

  final TextStyle metaStyle = TextStyle(
      fontFamily: AppConfig.openSansFontFamily,
      fontSize: AppConfig.fontSizeLarge,
      fontStyle: FontStyle.normal,
      color: HexColor(AppConfig.hexColorGrey));
}

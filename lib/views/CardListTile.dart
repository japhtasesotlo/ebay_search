import 'package:ebay_search_flutter/interfaces/CardListener.dart';
import 'package:ebay_search_flutter/models/ItemSummary.dart';
import 'package:ebay_search_flutter/util/AppConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final CardListener cardListener;
  final ItemSummary item;

  const CardListTile(
      {Key key, this.title, this.subtitle, this.cardListener, this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            leading: SizedBox(
              height: AppConfig.imagePopupSize,
              width: AppConfig.imagePopupSize,
              child: Image.network(item.image.imageUrl),
            ),
            title: Text(
              title,
              style: TextStyle(
                  fontSize: AppConfig.fontSizeMedium,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Padding(
              padding: EdgeInsets.fromLTRB(
                  AppConfig.marginZero,
                  AppConfig.marginNormal,
                  AppConfig.marginZero,
                  AppConfig.marginZero),
              child: Text(
                "R" + subtitle,
                style: TextStyle(color: Colors.grey.shade600),
              ),
            ),
            onTap: () {
              cardListener.isCardClicked(context, item);
            },
          ),
        ],
      ),
    );
  }
}

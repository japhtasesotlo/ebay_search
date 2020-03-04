import 'package:ebay_search_flutter/interfaces/DialogClickListener.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AppConfig.dart';

class DialogHelper {
  DialogClickListener listener;

  DialogHelper(this.listener);

  CupertinoAlertDialog getDialog(
      BuildContext context, String title, String content) {
    return CupertinoAlertDialog(
      title: Align(
        alignment: Alignment.center,
        child: Text(title, style: popUpStyle),
      ),
      content: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.all(AppConfig.marginNormal),
            child: Text(content, style: popUpStyle),
          )),
      actions: <Widget>[
        Align(
          alignment: Alignment.center,
          child: FlatButton(
            onPressed: () => this.listener.onButtonClick(context),
            child: Text(AppConfig.ok, style: popUpStyle),
          ),
        ),
      ],
    );
  }

  final TextStyle popUpStyle = TextStyle(
      fontFamily: AppConfig.openSansFontFamily,
      fontSize: AppConfig.fontSizeLarge,
      fontStyle: FontStyle.normal,
      color: Colors.black);
}

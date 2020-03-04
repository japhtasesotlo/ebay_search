import 'dart:ui';

import '../util/AppConfig.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll(
        AppConfig.patternDelimiter, AppConfig.blank);
    if (hexColor.length == AppConfig.hexMaxLength) {
      hexColor = AppConfig.hexWhiteValue + hexColor;
    }
    return int.parse(hexColor, radix: AppConfig.hexRadix);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

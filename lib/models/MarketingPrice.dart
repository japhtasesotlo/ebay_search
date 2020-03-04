import 'package:ebay_search_flutter/models/Price.dart';

class MarketingPrice {
  Price originalPrice;
  String discountPercentage;
  Price discountAmount;

  MarketingPrice(
      this.originalPrice, this.discountPercentage, this.discountAmount);

  MarketingPrice.fromJson(Map<String, dynamic> json) {
    originalPrice = json['originalPrice'] != null
        ? new Price.fromJson(json['originalPrice'])
        : null;
    discountPercentage = json['discountPercentage'];
    discountAmount = json['discountAmount'] != null
        ? new Price.fromJson(json['discountAmount'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.originalPrice != null) {
      data['originalPrice'] = this.originalPrice.toJson();
    }
    data['discountPercentage'] = this.discountPercentage;
    if (this.discountAmount != null) {
      data['discountAmount'] = this.discountAmount.toJson();
    }
    return data;
  }
}

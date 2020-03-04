import 'package:ebay_search_flutter/models/Price.dart';

class ShippingOption {
  String shippingCostType;
  Price shippingCost;

  ShippingOption(this.shippingCostType, this.shippingCost);

  ShippingOption.fromJson(Map<String, dynamic> json) {
    shippingCostType = json['shippingCostType'];
    shippingCost = json['shippingCost'] != null
        ? new Price.fromJson(json['shippingCost'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shippingCostType'] = this.shippingCostType;
    if (this.shippingCost != null) {
      data['shippingCost'] = this.shippingCost.toJson();
    }
    return data;
  }
}

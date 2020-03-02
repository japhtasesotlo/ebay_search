import 'package:ebay_search_flutter/views/Image.dart';

import 'ItemLocation.dart';
import 'MarketingPrice.dart';
import 'Price.dart';
import 'Seller.dart';
import 'ShippingOption.dart';

class ItemSummary {
  String itemId;
  String title;
  Image image;
  Price price;
  String itemHref;
  Seller seller;
  String condition;
  String conditionId;
  List<ThumbnailImage> thumbnailImages;
  List<ShippingOption> shippingOptions;
  List<String> buyingOptions;
  String itemWebUrl;
  ItemLocation itemLocation;
  List<Category> categories;
  bool adultOnly;

  ItemSummary(
      this.itemId,
      this.title,
      this.image,
      this.price,
      this.itemHref,
      this.seller,
      this.condition,
      this.conditionId,
      this.thumbnailImages,
      this.shippingOptions,
      this.buyingOptions,
      this.itemWebUrl,
      this.itemLocation,
      this.categories,
      this.adultOnly);

  ItemSummary.fromJson(Map<String, dynamic> json) {
    itemId = json['itemId'];
    title = json['title'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    price = json['price'] != null ? new Price.fromJson(json['price']) : null;
    itemHref = json['itemHref'];
    seller =
        json['seller'] != null ? new Seller.fromJson(json['seller']) : null;
    condition = json['condition'];
    conditionId = json['conditionId'];
    if (json['shippingOptions'] != null) {
      shippingOptions = new List<ShippingOption>();
      json['shippingOptions'].forEach((v) {
        shippingOptions.add(new ShippingOption.fromJson(v));
      });
    }
    buyingOptions = json['buyingOptions'].cast<String>();
    itemWebUrl = json['itemWebUrl'];
    itemLocation = json['itemLocation'] != null
        ? new ItemLocation.fromJson(json['itemLocation'])
        : null;
    if (json['categories'] != null) {
      categories = new List<Category>();
      json['categories'].forEach((v) {
        categories.add(new Category.fromJson(v));
      });
    }
//   x
    adultOnly = json['adultOnly'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemId'] = this.itemId;
    data['title'] = this.title;
    if (this.image != null) {
      data['image'] = this.image.toJson();
    }
    if (this.price != null) {
      data['price'] = this.price.toJson();
    }
    data['itemHref'] = this.itemHref;
    if (this.seller != null) {
      data['seller'] = this.seller.toJson();
    }
    data['condition'] = this.condition;
    data['conditionId'] = this.conditionId;
    if (this.thumbnailImages != null) {
      data['thumbnailImages'] =
          this.thumbnailImages.map((v) => v.toJson()).toList();
    }
    if (this.shippingOptions != null) {
      data['shippingOptions'] =
          this.shippingOptions.map((v) => v.toJson()).toList();
    }
    data['buyingOptions'] = this.buyingOptions;
    data['itemWebUrl'] = this.itemWebUrl;
    if (this.itemLocation != null) {
      data['itemLocation'] = this.itemLocation.toJson();
    }
    if (this.categories != null) {
      data['categories'] = this.categories.map((v) => v.toJson()).toList();
    }
    data['adultOnly'] = this.adultOnly;
    return data;
  }
}

class Category {
  String categoryId;

  Category(this.categoryId);

  Category.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryId'] = this.categoryId;
    return data;
  }
}

class ThumbnailImage {
  String imageUrl;

  ThumbnailImage(this.imageUrl);

  ThumbnailImage.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}
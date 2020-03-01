import 'ItemSummary.dart';

class Item {
  String href;
  int total;
  String next;
  int limit;
  int offset;
  List<ItemSummary> itemSummaries;

  Item(this.href, this.total, this.next, this.limit, this.offset,
      this.itemSummaries);

  Item.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    total = json['total'];
    next = json['next'];
    limit = json['limit'];
    offset = json['offset'];
    if (json['itemSummaries'] != null) {
      itemSummaries = new List<ItemSummary>();
      json['itemSummaries'].forEach((v) {
        itemSummaries.add(new ItemSummary.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    data['total'] = this.total;
    data['next'] = this.next;
    data['limit'] = this.limit;
    data['offset'] = this.offset;
    if (this.itemSummaries != null) {
      data['itemSummaries'] =
          this.itemSummaries.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

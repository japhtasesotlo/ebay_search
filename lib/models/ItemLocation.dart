class ItemLocation {
  String postalCode;
  String country;

  ItemLocation(this.postalCode, this.country);

  ItemLocation.fromJson(Map<String, dynamic> json) {
    postalCode = json['postalCode'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['postalCode'] = this.postalCode;
    data['country'] = this.country;
    return data;
  }
}

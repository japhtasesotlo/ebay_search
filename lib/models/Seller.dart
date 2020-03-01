class Seller {
  String username;
  String feedbackPercentage;
  int feedbackScore;

  Seller(this.username, this.feedbackPercentage, this.feedbackScore);

  Seller.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    feedbackPercentage = json['feedbackPercentage'];
    feedbackScore = json['feedbackScore'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['feedbackPercentage'] = this.feedbackPercentage;
    data['feedbackScore'] = this.feedbackScore;
    return data;
  }
}

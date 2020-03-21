class Seafood {
  String id;
  String seafoodUrl;
  String seafoodName;
  String seafoodDescription;
  String color;

  Seafood(
      {this.id,
      this.seafoodUrl,
      this.seafoodName,
      this.seafoodDescription,
      this.color});

  Seafood.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    seafoodUrl = json['seafood_url'];
    seafoodName = json['seafood_name'];
    seafoodDescription = json['seafood_description'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['seafood_url'] = this.seafoodUrl;
    data['seafood_name'] = this.seafoodName;
    data['seafood_description'] = this.seafoodDescription;
    data['color'] = this.color;
    return data;
  }
}
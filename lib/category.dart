
class Category {
  String id;
  String iconUrl;
  String catergoryName;
  String detail;
  String color;

  Category({this.id, this.iconUrl, this.catergoryName, this.detail, this.color});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    iconUrl = json['icon_url'];
    catergoryName = json['catergory_name'];
    detail = json['detail'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['icon_url'] = this.iconUrl;
    data['catergory_name'] = this.catergoryName;
    data['detail'] = this.detail;
    data['color'] = this.color;
    return data;
  }
}
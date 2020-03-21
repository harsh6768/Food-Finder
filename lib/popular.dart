class PopularEat {
  String id;
  String url;
  String name;
  String description;
  String category;

  PopularEat({this.id, this.url, this.name, this.description, this.category});

  PopularEat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    name = json['name'];
    description = json['description'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['name'] = this.name;
    data['description'] = this.description;
    data['category'] = this.category;
    return data;
  }
}
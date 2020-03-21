class Collection {
  String id;
  String imageUrl;
  String name;
  String description;
  String ratings;
  String reviews;
  String color;

  Collection(
      {this.id,
      this.imageUrl,
      this.name,
      this.description,
      this.ratings,
      this.reviews,
      this.color});

  Collection.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['image_url'];
    name = json['name'];
    description = json['description'];
    ratings = json['ratings'];
    reviews = json['reviews'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image_url'] = this.imageUrl;
    data['name'] = this.name;
    data['description'] = this.description;
    data['ratings'] = this.ratings;
    data['reviews'] = this.reviews;
    data['color'] = this.color;
    return data;
  }
}
class TrendingBrands {
  String brandUrl;
  String brandName;
  String brandDescription;

  TrendingBrands({this.brandUrl, this.brandName, this.brandDescription});

  TrendingBrands.fromJson(Map<String, dynamic> json) {
    brandUrl = json['brand_url'];
    brandName = json['brand_name'];
    brandDescription = json['brand_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['brand_url'] = this.brandUrl;
    data['brand_name'] = this.brandName;
    data['brand_description'] = this.brandDescription;
    return data;
  }
}

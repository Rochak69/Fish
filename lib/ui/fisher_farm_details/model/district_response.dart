class DistrictResponse {
  String? id;
  String? englishName;
  String? nepaliName;
  String? provinceId;

  DistrictResponse(
      {this.id, this.englishName, this.nepaliName, this.provinceId});

  DistrictResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    englishName = json['englishName'];
    nepaliName = json['nepaliName'];
    provinceId = json['provinceId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['englishName'] = this.englishName;
    data['nepaliName'] = this.nepaliName;
    data['provinceId'] = this.provinceId;
    return data;
  }
}

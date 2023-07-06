class MunicipalityResponse {
  String? id;
  String? englishName;
  String? nepaliName;
  String? districtId;

  MunicipalityResponse(
      {this.id, this.englishName, this.nepaliName, this.districtId});

  MunicipalityResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    englishName = json['englishName'];
    nepaliName = json['nepaliName'];
    districtId = json['districtId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['englishName'] = this.englishName;
    data['nepaliName'] = this.nepaliName;
    data['districtId'] = this.districtId;
    return data;
  }
}

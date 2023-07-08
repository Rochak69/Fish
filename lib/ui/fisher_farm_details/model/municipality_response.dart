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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['englishName'] = englishName;
    data['nepaliName'] = nepaliName;
    data['districtId'] = districtId;
    return data;
  }
}

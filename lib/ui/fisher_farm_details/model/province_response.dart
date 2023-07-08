class ProvincesResponse {
  String? englishName;
  String? nepaliName;
  String? id;

  ProvincesResponse({this.englishName, this.nepaliName, this.id});

  ProvincesResponse.fromJson(Map<String, dynamic> json) {
    englishName = json['englishName'];
    nepaliName = json['nepaliName'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['englishName'] = englishName;
    data['nepaliName'] = nepaliName;
    data['id'] = id;
    return data;
  }
}

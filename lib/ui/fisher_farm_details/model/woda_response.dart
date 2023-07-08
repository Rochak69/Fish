class WodaResponse {
  String? englishNumber;
  String? nepaliNumber;
  String? id;
  String? municipalityId;

  WodaResponse(
      {this.englishNumber, this.nepaliNumber, this.id, this.municipalityId});

  WodaResponse.fromJson(Map<String, dynamic> json) {
    englishNumber = json['englishNumber'];
    nepaliNumber = json['nepaliNumber'];
    id = json['id'];
    municipalityId = json['municipalityId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['englishNumber'] = englishNumber;
    data['nepaliNumber'] = nepaliNumber;
    data['id'] = id;
    data['municipalityId'] = municipalityId;
    return data;
  }
}

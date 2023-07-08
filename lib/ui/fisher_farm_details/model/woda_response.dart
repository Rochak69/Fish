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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['englishNumber'] = this.englishNumber;
    data['nepaliNumber'] = this.nepaliNumber;
    data['id'] = this.id;
    data['municipalityId'] = this.municipalityId;
    return data;
  }
}

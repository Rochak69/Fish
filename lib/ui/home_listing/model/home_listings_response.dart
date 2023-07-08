class HomeListingsResponse {
  String? id;
  String? farmerId;
  String? fishType;
  int? avgFishWeight;
  int? totalWeight;
  String? yieldDate;
  int? fishTypeId;

  HomeListingsResponse(
      {this.id,
      this.farmerId,
      this.fishType,
      this.avgFishWeight,
      this.totalWeight,
      this.yieldDate,
      this.fishTypeId});

  HomeListingsResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    farmerId = json['farmerId'];
    fishType = json['fishType'];
    avgFishWeight = json['avgFishWeight'];
    totalWeight = json['totalWeight'];
    yieldDate = json['yieldDate'];
    fishTypeId = json['fishTypeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['farmerId'] = this.farmerId;
    data['fishType'] = this.fishType;
    data['avgFishWeight'] = this.avgFishWeight;
    data['totalWeight'] = this.totalWeight;
    data['yieldDate'] = this.yieldDate;
    data['fishTypeId'] = this.fishTypeId;
    return data;
  }
}

class HomeListingsResponse {
  String? id;
  String? buyerId;
  String? fishType;
  int? avgFishWeight;
  int? totalWeight;
  String? deadline;
  String? yieldDate;

  HomeListingsResponse(
      {this.id,
      this.buyerId,
      this.fishType,
      this.avgFishWeight,
      this.totalWeight,
      this.deadline,
      this.yieldDate});

  HomeListingsResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    buyerId = json['buyerId'];
    fishType = json['fishType'];
    avgFishWeight = json['avgFishWeight'];
    totalWeight = json['totalWeight'];
    deadline = json['deadline'];
    yieldDate = json['yieldDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['buyerId'] = buyerId;
    data['fishType'] = fishType;
    data['avgFishWeight'] = avgFishWeight;
    data['totalWeight'] = totalWeight;
    data['deadline'] = deadline;
    data['yieldDate'] = yieldDate;
    return data;
  }
}

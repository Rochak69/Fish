class YourListingsResponse {
  String? id;
  String? buyerId;
  String? fishType;
  int? avgFishWeight;
  int? totalWeight;
  String? deadline;
  String? yieldDate;
  int? fishTypeId;
  List<FarmerRequest>? farmerRequest;

  YourListingsResponse(
      {this.id,
      this.buyerId,
      this.fishType,
      this.avgFishWeight,
      this.totalWeight,
      this.deadline,
      this.yieldDate,
      this.fishTypeId,
      this.farmerRequest});

  YourListingsResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    buyerId = json['buyerId'];
    fishType = json['fishType'];
    avgFishWeight = json['avgFishWeight'];
    totalWeight = json['totalWeight'];
    deadline = json['deadline'];
    yieldDate = json['yieldDate'];
    fishTypeId = json['fishTypeId'];
    if (json['FarmerRequest'] != null) {
      farmerRequest = <FarmerRequest>[];
      json['FarmerRequest'].forEach((v) {
        farmerRequest!.add(new FarmerRequest.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['buyerId'] = this.buyerId;
    data['fishType'] = this.fishType;
    data['avgFishWeight'] = this.avgFishWeight;
    data['totalWeight'] = this.totalWeight;
    data['deadline'] = this.deadline;
    data['yieldDate'] = this.yieldDate;
    data['fishTypeId'] = this.fishTypeId;
    if (this.farmerRequest != null) {
      data['FarmerRequest'] =
          this.farmerRequest!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FarmerRequest {
  String? id;

  FarmerRequest({this.id});

  FarmerRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}

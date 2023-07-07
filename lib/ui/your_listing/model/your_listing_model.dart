class YourListingsResponse {
  String? id;
  String? farmerId;
  String? fishType;
  int? avgFishWeight;
  int? totalWeight;
  String? yieldDate;
  int? fishTypeId;
  List<BuyerRequest>? buyerRequest;

  YourListingsResponse(
      {this.id,
      this.farmerId,
      this.fishType,
      this.avgFishWeight,
      this.totalWeight,
      this.yieldDate,
      this.fishTypeId,
      this.buyerRequest});

  YourListingsResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    farmerId = json['farmerId'];
    fishType = json['fishType'];
    avgFishWeight = json['avgFishWeight'];
    totalWeight = json['totalWeight'];
    yieldDate = json['yieldDate'];
    fishTypeId = json['fishTypeId'];
    if (json['BuyerRequest'] != null) {
      buyerRequest = <BuyerRequest>[];
      json['BuyerRequest'].forEach((v) {
        buyerRequest!.add(new BuyerRequest.fromJson(v));
      });
    }
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
    if (this.buyerRequest != null) {
      data['BuyerRequest'] = this.buyerRequest!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BuyerRequest {
  String? id;

  BuyerRequest({this.id});

  BuyerRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}

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
        buyerRequest!.add(BuyerRequest.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['farmerId'] = farmerId;
    data['fishType'] = fishType;
    data['avgFishWeight'] = avgFishWeight;
    data['totalWeight'] = totalWeight;
    data['yieldDate'] = yieldDate;
    data['fishTypeId'] = fishTypeId;
    if (buyerRequest != null) {
      data['BuyerRequest'] = buyerRequest!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}

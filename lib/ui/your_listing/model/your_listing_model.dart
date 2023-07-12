import 'package:fish_shop/ui/order_history/model/order_history_response.dart';

class YourListingsResponse {
  String? id;
  String? farmerId;
  FishType? fishType;
  num? avgFishWeight;
  num? totalWeight;
  String? yieldDate;
  String? fishTypeId;
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

    avgFishWeight = json['avgFishWeight'];
    totalWeight = json['totalWeight'];
    yieldDate = json['yieldDate'];
    fishTypeId = json['fishTypeId'];
    fishType = json['FishType'] != null
        ? new FishType.fromJson(json['FishType'])
        : null;
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

    data['avgFishWeight'] = avgFishWeight;
    data['totalWeight'] = totalWeight;
    data['yieldDate'] = yieldDate;
    data['fishTypeId'] = fishTypeId;
    if (buyerRequest != null) {
      data['BuyerRequest'] = buyerRequest!.map((v) => v.toJson()).toList();
    }
    if (this.fishType != null) {
      data['FishType'] = this.fishType!.toJson();
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

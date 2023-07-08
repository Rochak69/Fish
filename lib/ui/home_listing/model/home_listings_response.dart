import 'package:fish_shop/ui/order_history/model/order_history_response.dart';

class HomeListingsResponse {
  String? id;
  String? buyerId;
  FishType? fishType;
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
    avgFishWeight = json['avgFishWeight'];
    totalWeight = json['totalWeight'];
    deadline = json['deadline'];
    yieldDate = json['yieldDate'];
    fishType = json['FishType'] != null
        ? FishType.fromJson(json['FishType'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['buyerId'] = buyerId;
    data['avgFishWeight'] = avgFishWeight;
    data['totalWeight'] = totalWeight;
    data['deadline'] = deadline;
    data['yieldDate'] = yieldDate;
    if (fishType != null) {
      data['FishType'] = fishType!.toJson();
    }
    return data;
  }
}

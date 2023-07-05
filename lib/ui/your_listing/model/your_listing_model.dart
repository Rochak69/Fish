import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class YourListingsResponse {
  String? id;
  String? farmerId;
  String? fishType;
  int? avgFishWeight;
  int? totalWeight;
  String? yieldDate;
  List<BuyerRequestReposne>? buyerRequest;

  YourListingsResponse(
      {this.id,
      this.farmerId,
      this.fishType,
      this.avgFishWeight,
      this.totalWeight,
      this.yieldDate,
      this.buyerRequest});

  YourListingsResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    farmerId = json['farmerId'];
    fishType = json['fishType'];
    avgFishWeight = json['avgFishWeight'];
    totalWeight = json['totalWeight'];
    yieldDate = json['yieldDate'];
    if (json['BuyerRequest'] != null) {
      buyerRequest = <BuyerRequestReposne>[];
      json['BuyerRequest'].forEach((v) {
        buyerRequest!.add(BuyerRequestReposne.fromJson(v));
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
    if (buyerRequest != null) {
      data['BuyerRequest'] = buyerRequest!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BuyerRequestReposne {
  String? id;
  BuyerRequestReposne({this.id});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
    };
  }

  factory BuyerRequestReposne.fromMap(Map<String, dynamic> map) {
    return BuyerRequestReposne(
      id: map['id'] != null ? map['id'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BuyerRequestReposne.fromJson(String source) =>
      BuyerRequestReposne.fromMap(json.decode(source) as Map<String, dynamic>);
}

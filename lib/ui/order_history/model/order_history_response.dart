class OrderHistoryResponse {
  String? id;
  String? buyerDemandId;
  String? farmerId;
  bool? isApproved;
  num? supplyWeight;
  String? phoneNumber;
  String? createdAt;
  bool? completed;
  bool? cancelled;
  BuyerDemand? buyerDemand;

  OrderHistoryResponse(
      {this.id,
      this.buyerDemandId,
      this.farmerId,
      this.isApproved,
      this.supplyWeight,
      this.phoneNumber,
      this.createdAt,
      this.completed,
      this.cancelled,
      this.buyerDemand});

  OrderHistoryResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    buyerDemandId = json['buyerDemandId'];
    farmerId = json['farmerId'];
    isApproved = json['isApproved'];
    supplyWeight = json['supplyWeight'];
    phoneNumber = json['phoneNumber'];
    createdAt = json['createdAt'];
    completed = json['completed'];
    cancelled = json['cancelled'];
    buyerDemand = json['buyerDemand'] != null
        ? BuyerDemand.fromJson(json['buyerDemand'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['buyerDemandId'] = buyerDemandId;
    data['farmerId'] = farmerId;
    data['isApproved'] = isApproved;
    data['supplyWeight'] = supplyWeight;
    data['phoneNumber'] = phoneNumber;
    data['createdAt'] = createdAt;
    data['completed'] = completed;
    data['cancelled'] = cancelled;
    if (buyerDemand != null) {
      data['buyerDemand'] = buyerDemand!.toJson();
    }
    return data;
  }
}

class BuyerDemand {
  String? id;
  String? buyerId;
  num? avgFishWeight;
  num? totalWeight;
  String? deadline;
  String? yieldDate;
  String? fishTypeId;
  bool? fulfill;
  String? createdAt;
  FishType? fishType;
  Buyer? buyer;

  BuyerDemand(
      {this.id,
      this.buyerId,
      this.avgFishWeight,
      this.totalWeight,
      this.deadline,
      this.yieldDate,
      this.fishTypeId,
      this.fulfill,
      this.createdAt,
      this.fishType,
      this.buyer});

  BuyerDemand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    buyerId = json['buyerId'];
    avgFishWeight = json['avgFishWeight'];
    totalWeight = json['totalWeight'];
    deadline = json['deadline'];
    yieldDate = json['yieldDate'];
    fishTypeId = json['fishTypeId'];
    fulfill = json['fulfill'];
    createdAt = json['createdAt'];

    buyer = json['Buyer'] != null ? Buyer.fromJson(json['Buyer']) : null;
    fishType = json['FishType'] != null
        ? new FishType.fromJson(json['FishType'])
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
    data['fishTypeId'] = fishTypeId;
    data['fulfill'] = fulfill;
    data['createdAt'] = createdAt;

    if (buyer != null) {
      data['Buyer'] = buyer!.toJson();
    }

    if (this.fishType != null) {
      data['FishType'] = this.fishType!.toJson();
    }
    return data;
  }
}

class Buyer {
  String? id;
  String? userId;
  String? bussinessName;
  String? bussinessPhone;
  String? website;
  String? bussinessEmail;
  String? fullName;
  String? mobileNumber;
  String? citizenshipName;
  String? citizenshipNumber;
  String? citizenshipIssueDistrictId;
  String? streetName;
  String? facebookPage;
  bool? active;
  bool? approved;
  String? districtId;
  String? municipalityId;
  String? wardId;
  String? provinceId;
  String? createdAt;
  User? user;

  Buyer(
      {this.id,
      this.userId,
      this.bussinessName,
      this.bussinessPhone,
      this.website,
      this.bussinessEmail,
      this.fullName,
      this.mobileNumber,
      this.citizenshipName,
      this.citizenshipNumber,
      this.citizenshipIssueDistrictId,
      this.streetName,
      this.facebookPage,
      this.active,
      this.approved,
      this.districtId,
      this.municipalityId,
      this.wardId,
      this.provinceId,
      this.createdAt,
      this.user});

  Buyer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    bussinessName = json['bussinessName'];
    bussinessPhone = json['bussinessPhone'];
    website = json['website'];
    bussinessEmail = json['bussinessEmail'];
    fullName = json['fullName'];
    mobileNumber = json['mobileNumber'];
    citizenshipName = json['citizenshipName'];
    citizenshipNumber = json['citizenshipNumber'];
    citizenshipIssueDistrictId = json['citizenshipIssueDistrictId'];
    streetName = json['streetName'];
    facebookPage = json['facebookPage'];
    active = json['active'];
    approved = json['approved'];
    districtId = json['districtId'];
    municipalityId = json['municipalityId'];
    wardId = json['wardId'];
    provinceId = json['provinceId'];
    createdAt = json['createdAt'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['bussinessName'] = bussinessName;
    data['bussinessPhone'] = bussinessPhone;
    data['website'] = website;
    data['bussinessEmail'] = bussinessEmail;
    data['fullName'] = fullName;
    data['mobileNumber'] = mobileNumber;
    data['citizenshipName'] = citizenshipName;
    data['citizenshipNumber'] = citizenshipNumber;
    data['citizenshipIssueDistrictId'] = citizenshipIssueDistrictId;
    data['streetName'] = streetName;
    data['facebookPage'] = facebookPage;
    data['active'] = active;
    data['approved'] = approved;
    data['districtId'] = districtId;
    data['municipalityId'] = municipalityId;
    data['wardId'] = wardId;
    data['provinceId'] = provinceId;
    data['createdAt'] = createdAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? phoneNumber;

  User({this.phoneNumber});

  User.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phoneNumber'] = phoneNumber;
    return data;
  }
}

class FishType {
  String? name;

  FishType({this.name});

  FishType.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}

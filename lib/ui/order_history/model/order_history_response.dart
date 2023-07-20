class OrderHistoryResponse {
  num? avgFishWeight;
  String? createdAt;
  num? requestedWeight;
  String? yieldDate;
  String? fishType;
  String? buyerName;
  String? phoneNumber;
  Municipality? municipality;
  Ward? ward;
  String? streetName;
  String? facebookPage;
  String? website;

  OrderHistoryResponse(
      {this.avgFishWeight,
      this.createdAt,
      this.requestedWeight,
      this.yieldDate,
      this.streetName,
      this.fishType,
      this.buyerName,
      this.phoneNumber,
      this.municipality,
      this.facebookPage,
      this.website,
      this.ward});

  OrderHistoryResponse.fromJson(Map<String, dynamic> json) {
    avgFishWeight = json['avgFishWeight'];
    createdAt = json['createdAt'];
    requestedWeight = json['requestedWeight'];
    yieldDate = json['yieldDate'];
    fishType = json['FishType'];
    buyerName = json['buyerName'];
    phoneNumber = json['phoneNumber'];
    website = json['website'];
    facebookPage = json['facebookId'];
    streetName = json['streetName'];
    municipality = json['municipality'] != null
        ? new Municipality.fromJson(json['municipality'])
        : null;
    ward = json['Ward'] != null ? new Ward.fromJson(json['Ward']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avgFishWeight'] = this.avgFishWeight;
    data['createdAt'] = this.createdAt;
    data['requestedWeight'] = this.requestedWeight;
    data['yieldDate'] = this.yieldDate;
    data['FishType'] = this.fishType;
    data['buyerName'] = this.buyerName;
    data['streetName'] = this.streetName;
    data['phoneNumber'] = this.phoneNumber;
    if (this.municipality != null) {
      data['municipality'] = this.municipality!.toJson();
    }
    if (this.ward != null) {
      data['Ward'] = this.ward!.toJson();
    }
    return data;
  }
}

class Municipality {
  String? englishName;
  String? nepaliName;

  Municipality({this.englishName, this.nepaliName});

  Municipality.fromJson(Map<String, dynamic> json) {
    englishName = json['englishName'];
    nepaliName = json['nepaliName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['englishName'] = this.englishName;
    data['nepaliName'] = this.nepaliName;
    return data;
  }
}

class Ward {
  String? englishNumber;
  String? nepaliNumber;

  Ward({this.englishNumber, this.nepaliNumber});

  Ward.fromJson(Map<String, dynamic> json) {
    englishNumber = json['englishNumber'];
    nepaliNumber = json['nepaliNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['englishNumber'] = this.englishNumber;
    data['nepaliNumber'] = this.nepaliNumber;
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

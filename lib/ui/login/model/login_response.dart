class LoginResponse {
  String? sessionToken;
  String? id;
  String? userName;
  String? phoneNumber;
  bool? isFarmer;
  bool? isBuyer;
  FarmerStatus? farmerStatus;
  FarmerStatus? buyerStatus;

  LoginResponse(
      {this.sessionToken,
      this.id,
      this.userName,
      this.phoneNumber,
      this.isFarmer,
      this.isBuyer,
      this.farmerStatus,
      this.buyerStatus});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    sessionToken = json['session_token'];
    id = json['id'];
    userName = json['userName'];
    phoneNumber = json['phoneNumber'];
    isFarmer = json['isFarmer'];
    isBuyer = json['isBuyer'];
    farmerStatus = json['farmerStatus'] != null
        ? new FarmerStatus.fromJson(json['farmerStatus'])
        : null;
    buyerStatus = json['buyerStatus'] != null
        ? new FarmerStatus.fromJson(json['buyerStatus'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['session_token'] = this.sessionToken;
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['phoneNumber'] = this.phoneNumber;
    data['isFarmer'] = this.isFarmer;
    data['isBuyer'] = this.isBuyer;
    if (this.farmerStatus != null) {
      data['farmerStatus'] = this.farmerStatus!.toJson();
    }
    if (this.buyerStatus != null) {
      data['buyerStatus'] = this.buyerStatus!.toJson();
    }
    return data;
  }
}

class FarmerStatus {
  bool? active;
  bool? approved;

  FarmerStatus({this.active, this.approved});

  FarmerStatus.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    approved = json['approved'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    data['approved'] = this.approved;
    return data;
  }
}
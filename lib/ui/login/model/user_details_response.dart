class UserDetailsResponse {
  String? id;
  String? userId;
  String? fullName;
  String? farmName;
  String? mobileNumber;
  String? citizenshipName;
  String? citizenshipNumber;
  String? citizenshipIssueDistrictId;
  String? streetName;
  String? email;
  String? facebookPage;
  num? pondSize;
  bool? active;
  bool? approved;
  String? districtId;
  String? municipalityId;
  String? wardId;
  String? provinceId;
  String? createdAt;
  District? district;
  District? province;
  District? municipality;
  Ward? ward;
  Document? document;

  UserDetailsResponse(
      {this.id,
      this.userId,
      this.fullName,
      this.farmName,
      this.mobileNumber,
      this.citizenshipName,
      this.citizenshipNumber,
      this.citizenshipIssueDistrictId,
      this.streetName,
      this.email,
      this.facebookPage,
      this.pondSize,
      this.active,
      this.approved,
      this.districtId,
      this.municipalityId,
      this.wardId,
      this.provinceId,
      this.createdAt,
      this.district,
      this.province,
      this.municipality,
      this.ward,
      this.document});

  UserDetailsResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    fullName = json['fullName'];
    farmName = json['farmName'];
    mobileNumber = json['mobileNumber'];
    citizenshipName = json['citizenshipName'];
    citizenshipNumber = json['citizenshipNumber'];
    citizenshipIssueDistrictId = json['citizenshipIssueDistrictId'];
    streetName = json['streetName'];
    email = json['email'];
    facebookPage = json['facebookPage'];
    pondSize = json['pondSize'];
    active = json['active'];
    approved = json['approved'];
    districtId = json['districtId'];
    municipalityId = json['municipalityId'];
    wardId = json['wardId'];
    provinceId = json['provinceId'];
    createdAt = json['createdAt'];
    district = json['district'] != null
        ? new District.fromJson(json['district'])
        : null;
    province = json['Province'] != null
        ? new District.fromJson(json['Province'])
        : null;
    municipality = json['municipality'] != null
        ? new District.fromJson(json['municipality'])
        : null;
    ward = json['ward'] != null ? new Ward.fromJson(json['ward']) : null;
    document = json['Document'] != null
        ? new Document.fromJson(json['Document'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['fullName'] = this.fullName;
    data['farmName'] = this.farmName;
    data['mobileNumber'] = this.mobileNumber;
    data['citizenshipName'] = this.citizenshipName;
    data['citizenshipNumber'] = this.citizenshipNumber;
    data['citizenshipIssueDistrictId'] = this.citizenshipIssueDistrictId;
    data['streetName'] = this.streetName;
    data['email'] = this.email;
    data['facebookPage'] = this.facebookPage;
    data['pondSize'] = this.pondSize;
    data['active'] = this.active;
    data['approved'] = this.approved;
    data['districtId'] = this.districtId;
    data['municipalityId'] = this.municipalityId;
    data['wardId'] = this.wardId;
    data['provinceId'] = this.provinceId;
    data['createdAt'] = this.createdAt;
    if (this.district != null) {
      data['district'] = this.district!.toJson();
    }
    if (this.province != null) {
      data['Province'] = this.province!.toJson();
    }
    if (this.municipality != null) {
      data['municipality'] = this.municipality!.toJson();
    }
    if (this.ward != null) {
      data['ward'] = this.ward!.toJson();
    }
    if (this.document != null) {
      data['Document'] = this.document!.toJson();
    }
    return data;
  }
}

class District {
  String? englishName;
  String? nepaliName;

  District({this.englishName, this.nepaliName});

  District.fromJson(Map<String, dynamic> json) {
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

class Document {
  String? idenfication;
  String? registration;
  String? profilePicture;
  String? citizenship;

  Document(
      {this.idenfication,
      this.registration,
      this.profilePicture,
      this.citizenship});

  Document.fromJson(Map<String, dynamic> json) {
    idenfication = json['idenfication'];
    registration = json['registration'];
    profilePicture = json['profilePicture'];
    citizenship = json['citizenship'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idenfication'] = this.idenfication;
    data['registration'] = this.registration;
    data['profilePicture'] = this.profilePicture;
    data['citizenship'] = this.citizenship;
    return data;
  }
}

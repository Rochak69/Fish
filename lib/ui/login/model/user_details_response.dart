class UserDetailsResponse {
  String? id;
  String? userId;
  String? profilePicture;
  String? farmName;
  int? pondSize;
  String? fiscalYear;
  bool? active;
  bool? approved;
  Location? location;
  Document? document;

  UserDetailsResponse(
      {this.id,
      this.userId,
      this.profilePicture,
      this.farmName,
      this.pondSize,
      this.fiscalYear,
      this.active,
      this.approved,
      this.location,
      this.document});

  UserDetailsResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    profilePicture = json['profilePicture'];
    farmName = json['farmName'];
    pondSize = json['pondSize'];
    fiscalYear = json['fiscalYear'];
    active = json['active'];
    approved = json['approved'];
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    document =
        json['Document'] != null ? Document.fromJson(json['Document']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['profilePicture'] = profilePicture;
    data['farmName'] = farmName;
    data['pondSize'] = pondSize;
    data['fiscalYear'] = fiscalYear;
    data['active'] = active;
    data['approved'] = approved;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    if (document != null) {
      data['Document'] = document!.toJson();
    }
    return data;
  }
}

class Location {
  String? pradesh;
  String? district;
  String? mahaNagarpalika;
  String? upaMahaNagarpalika;
  String? gaupalika;
  String? nagarpalika;
  int? woda;

  Location(
      {this.pradesh,
      this.district,
      this.mahaNagarpalika,
      this.upaMahaNagarpalika,
      this.gaupalika,
      this.nagarpalika,
      this.woda});

  Location.fromJson(Map<String, dynamic> json) {
    pradesh = json['pradesh'];
    district = json['district'];
    mahaNagarpalika = json['mahaNagarpalika'];
    upaMahaNagarpalika = json['upaMahaNagarpalika'];
    gaupalika = json['gaupalika'];
    nagarpalika = json['nagarpalika'];
    woda = json['Woda'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pradesh'] = pradesh;
    data['district'] = district;
    data['mahaNagarpalika'] = mahaNagarpalika;
    data['upaMahaNagarpalika'] = upaMahaNagarpalika;
    data['gaupalika'] = gaupalika;
    data['nagarpalika'] = nagarpalika;
    data['Woda'] = woda;
    return data;
  }
}

class Document {
  List<String>? idenfication;
  List<String>? registration;

  Document({this.idenfication, this.registration});

  Document.fromJson(Map<String, dynamic> json) {
    idenfication = json['idenfication'].cast<String>();
    registration = json['registration'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idenfication'] = idenfication;
    data['registration'] = registration;
    return data;
  }
}

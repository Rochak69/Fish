class ContactResponse {
  String? photo;
  String? name;
  String? position;
  String? contact;

  ContactResponse({this.photo, this.name, this.position, this.contact});

  ContactResponse.fromJson(Map<String, dynamic> json) {
    photo = json['photo'];
    name = json['name'];
    position = json['position'];
    contact = json['contact'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['photo'] = this.photo;
    data['name'] = this.name;
    data['position'] = this.position;
    data['contact'] = this.contact;
    return data;
  }
}

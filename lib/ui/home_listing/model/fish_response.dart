class FishResponse {
  String? id;
  String? name;
  String? discription;
  String? createdAt;

  FishResponse({this.id, this.name, this.discription, this.createdAt});

  FishResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    discription = json['discription'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['discription'] = this.discription;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

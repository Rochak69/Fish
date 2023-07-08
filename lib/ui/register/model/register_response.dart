class RegisterResponse {
  String? userid;

  RegisterResponse({this.userid});

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    userid = json['userid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userid'] = this.userid;
    return data;
  }
}

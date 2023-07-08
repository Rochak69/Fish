class RegisterResponse {
  String? userid;

  RegisterResponse({this.userid});

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    userid = json['userid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userid'] = userid;
    return data;
  }
}

class ResetPasswordResponse {
  String? sessionToken;
  String? id;
  String? userName;

  ResetPasswordResponse({this.sessionToken, this.id, this.userName});

  ResetPasswordResponse.fromJson(Map<String, dynamic> json) {
    sessionToken = json['session_token'];
    id = json['id'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['session_token'] = sessionToken;
    data['id'] = id;
    data['userName'] = userName;
    return data;
  }
}

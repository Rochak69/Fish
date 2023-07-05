class LoginResponse {
  String? sessionToken;
  String? id;
  String? userName;
  String? phoneNumber;
  bool? isFarmer;
  bool? isBuyer;

  LoginResponse(
      {this.sessionToken,
      this.id,
      this.userName,
      this.phoneNumber,
      this.isFarmer,
      this.isBuyer});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    sessionToken = json['session_token'];
    id = json['id'];
    userName = json['userName'];
    phoneNumber = json['phoneNumber'];
    isFarmer = json['isFarmer'];
    isBuyer = json['isBuyer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['session_token'] = sessionToken;
    data['id'] = id;
    data['userName'] = userName;
    data['phoneNumber'] = phoneNumber;
    data['isFarmer'] = isFarmer;
    data['isBuyer'] = isBuyer;
    return data;
  }
}

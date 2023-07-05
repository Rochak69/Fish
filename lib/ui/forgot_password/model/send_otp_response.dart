class SendOtpResponse {
  String? code;
  bool? verified;
  String? userId;

  SendOtpResponse({this.code, this.verified, this.userId});

  SendOtpResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    verified = json['verified'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['verified'] = verified;
    data['userId'] = userId;
    return data;
  }
}

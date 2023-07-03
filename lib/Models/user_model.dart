class UserModel {
  int? id;
  String? firstName;
  String? lastName;
  String? code;
  String? mobile;
  String? loginType;
  int? verified;
  String? fcmToken;
  String? apiToken;

  UserModel(
      {this.id,
        this.firstName,
        this.lastName,
        this.code,
        this.mobile,
        this.loginType,
        this.verified,
        this.fcmToken,
        this.apiToken});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    code = json['code'];
    mobile = json['mobile'];
    loginType = json['login_type'];
    verified = json['verified'];
    fcmToken = json['fcm_token'];
    apiToken = json['api_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['code'] = code;
    data['mobile'] = mobile;
    data['login_type'] = loginType;
    data['verified'] = verified;
    data['fcm_token'] = fcmToken;
    data['api_token'] = apiToken;
    return data;
  }
}

class LoginTokensModel {
  String? accessToken;
  String? tokenType;
  Data? data;

  LoginTokensModel({this.accessToken, this.tokenType, this.data});

  LoginTokensModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? username;
  String? role;

  Data({this.username, this.role});

  Data.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['role'] = role;
    return data;
  }
}

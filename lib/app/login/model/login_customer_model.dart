class LoginCustomerModel {
  String? accessToken;
  String? tokenType;
  Data? data;

  LoginCustomerModel({this.accessToken, this.tokenType, this.data});

  LoginCustomerModel.fromJson(Map<String, dynamic> json) {
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
  KhachHang? khachHang;

  Data({this.username, this.role, this.khachHang});

  Data.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    role = json['role'];
    khachHang = json['KhachHang'] != null
        ? KhachHang.fromJson(json['KhachHang'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['role'] = role;
    if (khachHang != null) {
      data['KhachHang'] = khachHang!.toJson();
    }
    return data;
  }
}

class KhachHang {
  String? maKhachHang;
  String? tenKhachhang;
  String? diaChi;
  String? phone;
  String? email;
  String? website;
  String? maSothue;
  String? mota;
  bool? status;

  KhachHang(
      {this.maKhachHang,
      this.tenKhachhang,
      this.diaChi,
      this.phone,
      this.email,
      this.website,
      this.maSothue,
      this.mota,
      this.status});

  KhachHang.fromJson(Map<String, dynamic> json) {
    maKhachHang = json['maKhachHang'];
    tenKhachhang = json['tenKhachhang'];
    diaChi = json['diaChi'];
    phone = json['phone'];
    email = json['email'];
    website = json['website'];
    maSothue = json['maSothue'];
    mota = json['mota'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['maKhachHang'] = maKhachHang;
    data['tenKhachhang'] = tenKhachhang;
    data['diaChi'] = diaChi;
    data['phone'] = phone;
    data['email'] = email;
    data['website'] = website;
    data['maSothue'] = maSothue;
    data['mota'] = mota;
    data['status'] = status;
    return data;
  }
}

class LoginTokenModel {
  String? accessToken;
  String? tokenType;
  Data? data;

  LoginTokenModel({this.accessToken, this.tokenType, this.data});

  LoginTokenModel.fromJson(Map<String, dynamic> json) {
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
  Taixe? taixe;

  Data({this.username, this.role, this.taixe});

  Data.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    role = json['role'];
    taixe = json['taixe'] != null ? Taixe.fromJson(json['taixe']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['role'] = role;
    if (taixe != null) {
      data['taixe'] = taixe!.toJson();
    }
    return data;
  }
}

class Taixe {
  int? maTaixe;
  KhachhangRe? khachhangRe;
  String? tenTaixe;
  String? diaChi;
  String? email;
  String? phone;
  bool? status;

  Taixe(
      {this.maTaixe,
      this.khachhangRe,
      this.tenTaixe,
      this.diaChi,
      this.email,
      this.phone,
      this.status});

  Taixe.fromJson(Map<String, dynamic> json) {
    maTaixe = json['maTaixe'];
    khachhangRe = json['khachhang_re'] != null
        ? KhachhangRe.fromJson(json['khachhang_re'])
        : null;
    tenTaixe = json['tenTaixe'];
    diaChi = json['diaChi'];
    email = json['email'];
    phone = json['phone'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['maTaixe'] = maTaixe;
    if (khachhangRe != null) {
      data['khachhang_re'] = khachhangRe!.toJson();
    }
    data['tenTaixe'] = tenTaixe;
    data['diaChi'] = diaChi;
    data['email'] = email;
    data['phone'] = phone;
    data['status'] = status;
    return data;
  }
}

class KhachhangRe {
  String? maKhachHang;
  String? tenKhachhang;
  String? diaChi;
  String? phone;
  String? email;
  String? website;
  String? maSothue;
  String? mota;
  bool? status;

  KhachhangRe(
      {this.maKhachHang,
      this.tenKhachhang,
      this.diaChi,
      this.phone,
      this.email,
      this.website,
      this.maSothue,
      this.mota,
      this.status});

  KhachhangRe.fromJson(Map<String, dynamic> json) {
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

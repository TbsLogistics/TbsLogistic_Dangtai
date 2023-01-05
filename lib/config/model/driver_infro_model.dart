class DriverInfoModel {
  int? maTaixe;
  String? tenTaixe;
  String? diaChi;
  String? email;
  String? cCCD;
  String? phone;
  bool? status;

  DriverInfoModel(
      {this.maTaixe,
      this.tenTaixe,
      this.diaChi,
      this.email,
      this.cCCD,
      this.phone,
      this.status});

  DriverInfoModel.fromJson(Map<String, dynamic> json) {
    maTaixe = json['maTaixe'];
    tenTaixe = json['tenTaixe'];
    diaChi = json['diaChi'];
    email = json['email'];
    cCCD = json['CCCD'];
    phone = json['phone'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['maTaixe'] = maTaixe;
    data['tenTaixe'] = tenTaixe;
    data['diaChi'] = diaChi;
    data['email'] = email;
    data['CCCD'] = cCCD;
    data['phone'] = phone;
    data['status'] = status;
    return data;
  }
}

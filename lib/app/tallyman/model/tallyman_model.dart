class TallymanModel {
  String? usernameAccount;
  String? tenNV;
  bool? status;
  bool? isDelete;
  String? maBoPhan;
  String? maNv;
  String? soDienThoai;
  String? maKho;

  TallymanModel(
      {this.usernameAccount,
      this.tenNV,
      this.status,
      this.isDelete,
      this.maBoPhan,
      this.maNv,
      this.soDienThoai,
      this.maKho});

  TallymanModel.fromJson(Map<String, dynamic> json) {
    usernameAccount = json['usernameAccount'];
    tenNV = json['tenNV'];
    status = json['status'];
    isDelete = json['isDelete'];
    maBoPhan = json['maBoPhan'];
    maNv = json['maNv'];
    soDienThoai = json['soDienThoai'];
    maKho = json['maKho'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['usernameAccount'] = usernameAccount;
    data['tenNV'] = tenNV;
    data['status'] = status;
    data['isDelete'] = isDelete;
    data['maBoPhan'] = maBoPhan;
    data['maNv'] = maNv;
    data['soDienThoai'] = soDienThoai;
    data['maKho'] = maKho;
    return data;
  }
}

class ListOfEmployeesModel {
  String? maBoPhan;
  String? maNv;
  String? soDienThoai;
  String? maKho;
  String? usernameAccount;
  String? tenNV;
  bool? status;
  bool? isDelete;

  ListOfEmployeesModel(
      {this.maBoPhan,
      this.maNv,
      this.soDienThoai,
      this.maKho,
      this.usernameAccount,
      this.tenNV,
      this.status,
      this.isDelete});

  ListOfEmployeesModel.fromJson(Map<String, dynamic> json) {
    maBoPhan = json['maBoPhan'];
    maNv = json['maNv'];
    soDienThoai = json['soDienThoai'];
    maKho = json['maKho'];
    usernameAccount = json['usernameAccount'];
    tenNV = json['tenNV'];
    status = json['status'];
    isDelete = json['isDelete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['maBoPhan'] = maBoPhan;
    data['maNv'] = maNv;
    data['soDienThoai'] = soDienThoai;
    data['maKho'] = maKho;
    data['usernameAccount'] = usernameAccount;
    data['tenNV'] = tenNV;
    data['status'] = status;
    data['isDelete'] = isDelete;
    return data;
  }
}

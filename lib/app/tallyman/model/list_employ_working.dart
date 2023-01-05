class ListEmployeeWorkingModel {
  int? maDoiLamHang;
  String? tenDoiLamHang;
  String? maNv;
  String? tenNV;
  String? tenChucDanh;

  ListEmployeeWorkingModel(
      {this.maDoiLamHang,
      this.tenDoiLamHang,
      this.maNv,
      this.tenNV,
      this.tenChucDanh});

  ListEmployeeWorkingModel.fromJson(Map<String, dynamic> json) {
    maDoiLamHang = json['maDoiLamHang'];
    tenDoiLamHang = json['tenDoiLamHang'];
    maNv = json['maNv'];
    tenNV = json['tenNV'];
    tenChucDanh = json['tenChucDanh'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['maDoiLamHang'] = maDoiLamHang;
    data['tenDoiLamHang'] = tenDoiLamHang;
    data['maNv'] = maNv;
    data['tenNV'] = tenNV;
    data['tenChucDanh'] = tenChucDanh;
    return data;
  }
}

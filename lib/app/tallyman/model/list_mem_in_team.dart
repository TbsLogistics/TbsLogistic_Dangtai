class ListMemInTeamModel {
  String? maNv;
  String? tenNV;
  String? tenChucDanh;

  ListMemInTeamModel({this.maNv, this.tenNV, this.tenChucDanh});

  ListMemInTeamModel.fromJson(Map<String, dynamic> json) {
    maNv = json['maNv'];
    tenNV = json['tenNV'];
    tenChucDanh = json['tenChucDanh'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['maNv'] = maNv;
    data['tenNV'] = tenNV;
    data['tenChucDanh'] = tenChucDanh;
    return data;
  }
}

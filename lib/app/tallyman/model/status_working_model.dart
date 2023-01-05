class StatusWorkingModel {
  int? maPhieuLamHang;
  String? type;

  StatusWorkingModel({this.maPhieuLamHang, this.type});

  StatusWorkingModel.fromJson(Map<String, dynamic> json) {
    maPhieuLamHang = json['maPhieuLamHang'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['maPhieuLamHang'] = maPhieuLamHang;
    data['type'] = type;
    return data;
  }
}

class IDProduct {
  int? maPhieuLamHang;

  IDProduct({this.maPhieuLamHang});

  IDProduct.fromJson(Map<String, dynamic> json) {
    maPhieuLamHang = json['maPhieuLamHang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['maPhieuLamHang'] = maPhieuLamHang;
    return data;
  }
}

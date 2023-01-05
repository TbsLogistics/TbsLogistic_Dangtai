class ListTeamOfTallymanModel {
  int? id;
  int? maDoiLamHang;
  String? tenDoiLamHang;
  String? thoiGianBatDau;
  String? thoiGianKetThuc;
  String? thoiGianDuKienBatDau;
  String? thoiGianDuKienKetThuc;
  String? soxe;
  String? socont;
  double? soKien;
  double? soKhoi;
  String? soBook;

  ListTeamOfTallymanModel(
      {this.id,
      this.maDoiLamHang,
      this.tenDoiLamHang,
      this.thoiGianBatDau,
      this.thoiGianKetThuc,
      this.thoiGianDuKienBatDau,
      this.thoiGianDuKienKetThuc,
      this.soxe,
      this.socont,
      this.soKien,
      this.soKhoi,
      this.soBook});

  ListTeamOfTallymanModel.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    maDoiLamHang = json['maDoiLamHang'];
    tenDoiLamHang = json['tenDoiLamHang'];
    thoiGianBatDau = json['thoiGianBatDau'];
    thoiGianKetThuc = json['thoiGianKetThuc'];
    thoiGianDuKienBatDau = json['thoiGianDuKienBatDau'];
    thoiGianDuKienKetThuc = json['thoiGianDuKienKetThuc'];
    soxe = json['soxe'];
    socont = json['socont'];
    soKien = json['soKien'];
    soKhoi = json['soKhoi'];
    soBook = json['soBook'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['maDoiLamHang'] = maDoiLamHang;
    data['tenDoiLamHang'] = tenDoiLamHang;
    data['thoiGianBatDau'] = thoiGianBatDau;
    data['thoiGianKetThuc'] = thoiGianKetThuc;
    data['thoiGianDuKienBatDau'] = thoiGianDuKienBatDau;
    data['thoiGianDuKienKetThuc'] = thoiGianDuKienKetThuc;
    data['soxe'] = soxe;
    data['socont'] = socont;
    data['soKien'] = soKien;
    data['soKhoi'] = soKhoi;
    data['soBook'] = soBook;
    return data;
  }
}

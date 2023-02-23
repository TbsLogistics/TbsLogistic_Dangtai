class TickerWorkingModel {
  int? id;
  int? maPhieuvao;
  String? tenLoaiXe;
  String? soxe;
  String? tenLoaiHang;
  String? socont;
  double? soKien;
  double? soKhoi;
  String? soBook;
  String? thoiGianDuKienBatDau;
  String? thoiGianDuKienKetThuc;
  int? maDoiLamHang;
  String? thoiGianBatDau;
  String? thoiGianKetThuc;
  String? tenDock;
  String? tenCua;
  String? tenKho;

  TickerWorkingModel(
      {this.id,
      this.maPhieuvao,
      this.tenLoaiXe,
      this.soxe,
      this.tenLoaiHang,
      this.socont,
      this.soKien,
      this.soKhoi,
      this.soBook,
      this.thoiGianDuKienBatDau,
      this.thoiGianDuKienKetThuc,
      this.maDoiLamHang,
      this.thoiGianBatDau,
      this.thoiGianKetThuc,
      this.tenDock,
      this.tenCua,
      this.tenKho});

  TickerWorkingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    maPhieuvao = json['maPhieuvao'];
    tenLoaiXe = json['tenLoaiXe'];
    soxe = json['soxe'];
    tenLoaiHang = json['tenLoaiHang'];
    socont = json['socont'];
    soKien = json['soKien'];
    soKhoi = json['soKhoi'];
    soBook = json['soBook'];
    thoiGianDuKienBatDau = json['thoiGianDuKienBatDau'];
    thoiGianDuKienKetThuc = json['thoiGianDuKienKetThuc'];
    maDoiLamHang = json['maDoiLamHang'];
    thoiGianBatDau = json['thoiGianBatDau'];
    thoiGianKetThuc = json['thoiGianKetThuc'];
    tenDock = json['tenDock'];
    tenCua = json['tenCua'];
    tenKho = json['tenKho'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['maPhieuvao'] = maPhieuvao;
    data['tenLoaiXe'] = tenLoaiXe;
    data['soxe'] = soxe;
    data['tenLoaiHang'] = tenLoaiHang;
    data['socont'] = socont;
    data['soKien'] = soKien;
    data['soKhoi'] = soKhoi;
    data['soBook'] = soBook;
    data['thoiGianDuKienBatDau'] = thoiGianDuKienBatDau;
    data['thoiGianDuKienKetThuc'] = thoiGianDuKienKetThuc;
    data['maDoiLamHang'] = maDoiLamHang;
    data['thoiGianBatDau'] = thoiGianBatDau;
    data['thoiGianKetThuc'] = thoiGianKetThuc;
    data['tenDock'] = tenDock;
    data['tenCua'] = tenCua;
    data['tenKho'] = tenKho;
    return data;
  }
}

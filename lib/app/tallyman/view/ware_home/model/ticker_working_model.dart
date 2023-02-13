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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['maPhieuvao'] = this.maPhieuvao;
    data['tenLoaiXe'] = this.tenLoaiXe;
    data['soxe'] = this.soxe;
    data['tenLoaiHang'] = this.tenLoaiHang;
    data['socont'] = this.socont;
    data['soKien'] = this.soKien;
    data['soKhoi'] = this.soKhoi;
    data['soBook'] = this.soBook;
    data['thoiGianDuKienBatDau'] = this.thoiGianDuKienBatDau;
    data['thoiGianDuKienKetThuc'] = this.thoiGianDuKienKetThuc;
    data['maDoiLamHang'] = this.maDoiLamHang;
    data['thoiGianBatDau'] = this.thoiGianBatDau;
    data['thoiGianKetThuc'] = this.thoiGianKetThuc;
    data['tenDock'] = this.tenDock;
    data['tenCua'] = this.tenCua;
    data['tenKho'] = this.tenKho;
    return data;
  }
}

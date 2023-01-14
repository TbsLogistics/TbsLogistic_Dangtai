class ListEmployAwaitModel {
  List<DaLam>? daLam;
  List<ChuaLam>? chuaLam;

  ListEmployAwaitModel({this.daLam, this.chuaLam});

  ListEmployAwaitModel.fromJson(Map<String, dynamic> json) {
    if (json['daLam'] != null) {
      daLam = <DaLam>[];
      json['daLam'].forEach((v) {
        daLam!.add(DaLam.fromJson(v));
      });
    }
    if (json['chuaLam'] != null) {
      chuaLam = <ChuaLam>[];
      json['chuaLam'].forEach((v) {
        chuaLam!.add(ChuaLam.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (daLam != null) {
      data['daLam'] = daLam!.map((v) => v.toJson()).toList();
    }
    if (chuaLam != null) {
      data['chuaLam'] = chuaLam!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DaLam {
  int? id;
  String? thoiGianBatDau;
  String? thoiGianKetThuc;
  String? thoiGianDuKienKetThuc;
  String? soxe;
  double? soKien;
  String? soBook;
  int? maDock;
  int? maDoiLamHang;
  int? maPhieuvao;
  String? thoiGianDuKienBatDau;
  String? createDate;
  String? socont;
  double? soKhoi;
  String? loaiXe;

  DaLam(
      {this.id,
      this.thoiGianBatDau,
      this.thoiGianKetThuc,
      this.thoiGianDuKienKetThuc,
      this.soxe,
      this.soKien,
      this.soBook,
      this.maDock,
      this.maDoiLamHang,
      this.maPhieuvao,
      this.thoiGianDuKienBatDau,
      this.createDate,
      this.socont,
      this.soKhoi,
      this.loaiXe});

  DaLam.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    thoiGianBatDau = json['thoiGianBatDau'];
    thoiGianKetThuc = json['thoiGianKetThuc'];
    thoiGianDuKienKetThuc = json['thoiGianDuKienKetThuc'];
    soxe = json['soxe'];
    soKien = json['soKien'];
    soBook = json['soBook'];
    maDock = json['maDock'];
    maDoiLamHang = json['maDoiLamHang'];
    maPhieuvao = json['maPhieuvao'];
    thoiGianDuKienBatDau = json['thoiGianDuKienBatDau'];
    createDate = json['createDate'];
    socont = json['socont'];
    soKhoi = json['soKhoi'];
    loaiXe = json['loaiXe'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['thoiGianBatDau'] = thoiGianBatDau;
    data['thoiGianKetThuc'] = thoiGianKetThuc;
    data['thoiGianDuKienKetThuc'] = thoiGianDuKienKetThuc;
    data['soxe'] = soxe;
    data['soKien'] = soKien;
    data['soBook'] = soBook;
    data['maDock'] = maDock;
    data['maDoiLamHang'] = maDoiLamHang;
    data['maPhieuvao'] = maPhieuvao;
    data['thoiGianDuKienBatDau'] = thoiGianDuKienBatDau;
    data['createDate'] = createDate;
    data['socont'] = socont;
    data['soKhoi'] = soKhoi;
    data['loaiXe'] = loaiXe;
    return data;
  }
}

class ChuaLam {
  int? id;
  String? thoiGianBatDau;
  String? thoiGianKetThuc;
  String? thoiGianDuKienKetThuc;
  String? soxe;
  double? soKien;
  String? soBook;
  int? maDock;
  int? maDoiLamHang;
  int? maPhieuvao;
  String? thoiGianDuKienBatDau;
  String? createDate;
  String? socont;
  double? soKhoi;
  String? loaiXe;

  ChuaLam(
      {this.id,
      this.thoiGianBatDau,
      this.thoiGianKetThuc,
      this.thoiGianDuKienKetThuc,
      this.soxe,
      this.soKien,
      this.soBook,
      this.maDock,
      this.maDoiLamHang,
      this.maPhieuvao,
      this.thoiGianDuKienBatDau,
      this.createDate,
      this.socont,
      this.soKhoi,
      this.loaiXe});

  ChuaLam.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    thoiGianBatDau = json['thoiGianBatDau'];
    thoiGianKetThuc = json['thoiGianKetThuc'];
    thoiGianDuKienKetThuc = json['thoiGianDuKienKetThuc'];
    soxe = json['soxe'];
    soKien = json['soKien'];
    soBook = json['soBook'];
    maDock = json['maDock'];
    maDoiLamHang = json['maDoiLamHang'];
    maPhieuvao = json['maPhieuvao'];
    thoiGianDuKienBatDau = json['thoiGianDuKienBatDau'];
    createDate = json['createDate'];
    socont = json['socont'];
    soKhoi = json['soKhoi'];
    loaiXe = json['loaiXe'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['thoiGianBatDau'] = thoiGianBatDau;
    data['thoiGianKetThuc'] = thoiGianKetThuc;
    data['thoiGianDuKienKetThuc'] = thoiGianDuKienKetThuc;
    data['soxe'] = soxe;
    data['soKien'] = soKien;
    data['soBook'] = soBook;
    data['maDock'] = maDock;
    data['maDoiLamHang'] = maDoiLamHang;
    data['maPhieuvao'] = maPhieuvao;
    data['thoiGianDuKienBatDau'] = thoiGianDuKienBatDau;
    data['createDate'] = createDate;
    data['socont'] = socont;
    data['soKhoi'] = soKhoi;
    data['loaiXe'] = loaiXe;
    return data;
  }
}

class TickerDetailsDockModel {
  int? id;
  int? maDoiLamHang;
  String? tenDoiLamHang;
  int? maPhieuvao;
  String? thoiGianBatDau;
  String? thoiGianKetThuc;
  String? thoiGianDuKienBatDau;
  String? thoiGianDuKienKetThuc;
  String? createDate;
  String? soxe;
  String? socont;
  double? soKien;
  double? soKhoi;
  String? soBook;
  bool? status;
  DockRe? dockRe;

  TickerDetailsDockModel(
      {this.id,
      this.maDoiLamHang,
      this.tenDoiLamHang,
      this.maPhieuvao,
      this.thoiGianBatDau,
      this.thoiGianKetThuc,
      this.thoiGianDuKienBatDau,
      this.thoiGianDuKienKetThuc,
      this.createDate,
      this.soxe,
      this.socont,
      this.soKien,
      this.soKhoi,
      this.soBook,
      this.status,
      this.dockRe});

  TickerDetailsDockModel.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    maDoiLamHang = json['maDoiLamHang'];
    tenDoiLamHang = json['tenDoiLamHang'];
    maPhieuvao = json['maPhieuvao'];
    thoiGianBatDau = json['thoiGianBatDau'];
    thoiGianKetThuc = json['thoiGianKetThuc'];
    thoiGianDuKienBatDau = json['thoiGianDuKienBatDau'];
    thoiGianDuKienKetThuc = json['thoiGianDuKienKetThuc'];
    createDate = json['createDate'];
    soxe = json['soxe'];
    socont = json['socont'];
    soKien = json['soKien'];
    soKhoi = json['soKhoi'];
    soBook = json['soBook'];
    status = json['status'];
    dockRe = json['dock_re'] != null ? DockRe.fromJson(json['dock_re']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['maDoiLamHang'] = maDoiLamHang;
    data['tenDoiLamHang'] = tenDoiLamHang;
    data['maPhieuvao'] = maPhieuvao;
    data['thoiGianBatDau'] = thoiGianBatDau;
    data['thoiGianKetThuc'] = thoiGianKetThuc;
    data['thoiGianDuKienBatDau'] = thoiGianDuKienBatDau;
    data['thoiGianDuKienKetThuc'] = thoiGianDuKienKetThuc;
    data['createDate'] = createDate;
    data['soxe'] = soxe;
    data['socont'] = socont;
    data['soKien'] = soKien;
    data['soKhoi'] = soKhoi;
    data['soBook'] = soBook;
    data['status'] = status;
    if (dockRe != null) {
      data['dock_re'] = dockRe!.toJson();
    }
    return data;
  }
}

class DockRe {
  int? maDock;
  String? tenDock;
  String? tenCua;
  String? local;
  String? tenKho;

  DockRe({this.maDock, this.tenDock, this.tenCua, this.local, this.tenKho});

  DockRe.fromJson(Map<String, dynamic> json) {
    maDock = json['maDock'];
    tenDock = json['tenDock'];
    tenCua = json['tenCua'];
    local = json['local'];
    tenKho = json['tenKho'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['maDock'] = maDock;
    data['tenDock'] = tenDock;
    data['tenCua'] = tenCua;
    data['local'] = local;
    data['tenKho'] = tenKho;
    return data;
  }
}

class RegisterForDriverModel {
  String? maKhachHang;
  String? giodukien;
  String? kho;
  String? loaixe;
  String? soxe;
  String? socont1;
  String? socont2;
  String? cont1seal1;
  String? cont1seal2;
  double? soKien;
  double? sokhoi;
  String? soBook;
  bool? trangthaihang;
  bool? trangthaikhoa;
  String? cont2seal1;
  String? cont2seal2;
  double? sokien1;
  double? sokhoi1;
  String? soBook1;
  bool? trangthaihang1;
  bool? trangthaikhoa1;
  String? maloaiHang;

  RegisterForDriverModel(
      {this.maKhachHang,
      this.giodukien,
      this.kho,
      this.loaixe,
      this.soxe,
      this.socont1,
      this.socont2,
      this.cont1seal1,
      this.cont1seal2,
      this.soKien,
      this.sokhoi,
      this.soBook,
      this.trangthaihang,
      this.trangthaikhoa,
      this.cont2seal1,
      this.cont2seal2,
      this.sokien1,
      this.sokhoi1,
      this.soBook1,
      this.trangthaihang1,
      this.trangthaikhoa1,
      this.maloaiHang});

  RegisterForDriverModel.fromJson(Map<String, dynamic> json) {
    maKhachHang = json['maKhachHang'];
    giodukien = json['giodukien'];
    kho = json['kho'];
    loaixe = json['loaixe'];
    soxe = json['soxe'];
    socont1 = json['socont1'];
    socont2 = json['socont2'];
    cont1seal1 = json['cont1seal1'];
    cont1seal2 = json['cont1seal2'];
    soKien = json['SoKien'];
    sokhoi = json['sokhoi'];
    soBook = json['soBook'];
    trangthaihang = json['trangthaihang'];
    trangthaikhoa = json['trangthaikhoa'];
    cont2seal1 = json['cont2seal1'];
    cont2seal2 = json['cont2seal2'];
    sokien1 = json['Sokien1'];
    sokhoi1 = json['sokhoi1'];
    soBook1 = json['soBook1'];
    trangthaihang1 = json['trangthaihang1'];
    trangthaikhoa1 = json['trangthaikhoa1'];
    maloaiHang = json['maloaiHang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['maKhachHang'] = this.maKhachHang;
    data['giodukien'] = this.giodukien;
    data['kho'] = this.kho;
    data['loaixe'] = this.loaixe;
    data['soxe'] = this.soxe;
    data['socont1'] = this.socont1;
    data['socont2'] = this.socont2;
    data['cont1seal1'] = this.cont1seal1;
    data['cont1seal2'] = this.cont1seal2;
    data['SoKien'] = this.soKien;
    data['sokhoi'] = this.sokhoi;
    data['soBook'] = this.soBook;
    data['trangthaihang'] = this.trangthaihang;
    data['trangthaikhoa'] = this.trangthaikhoa;
    data['cont2seal1'] = this.cont2seal1;
    data['cont2seal2'] = this.cont2seal2;
    data['Sokien1'] = this.sokien1;
    data['sokhoi1'] = this.sokhoi1;
    data['soBook1'] = this.soBook1;
    data['trangthaihang1'] = this.trangthaihang1;
    data['trangthaikhoa1'] = this.trangthaikhoa1;
    data['maloaiHang'] = this.maloaiHang;
    return data;
  }
}

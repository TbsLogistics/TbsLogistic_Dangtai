class RegisterForCustomerModel {
  String? giodukien;
  String? kho;
  String? loaixe;
  String? soxe;
  String? socont1;
  String? socont2;
  String? cont1seal1;
  String? cont1seal2;
  int? soKien;
  int? sokhoi;
  String? soBook;
  bool? trangthaihang;
  bool? trangthaikhoa;
  String? cont2seal1;
  String? cont2seal2;
  int? sokien1;
  int? sokhoi1;
  String? soBook1;
  bool? trangthaihang1;
  bool? trangthaikhoa1;
  String? maloaiHang;
  int? maTaixe;

  RegisterForCustomerModel(
      {required this.giodukien,
      required this.kho,
      required this.loaixe,
      required this.soxe,
      required this.socont1,
      required this.socont2,
      required this.cont1seal1,
      required this.cont1seal2,
      required this.soKien,
      required this.sokhoi,
      required this.soBook,
      required this.trangthaihang,
      required this.trangthaikhoa,
      required this.cont2seal1,
      required this.cont2seal2,
      required this.sokien1,
      required this.sokhoi1,
      required this.soBook1,
      required this.trangthaihang1,
      required this.trangthaikhoa1,
      required this.maloaiHang,
      required this.maTaixe});

  RegisterForCustomerModel.fromJson(Map<String, dynamic> json) {
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
    maTaixe = json['maTaixe'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['giodukien'] = giodukien;
    data['kho'] = kho;
    data['loaixe'] = loaixe;
    data['soxe'] = soxe;
    data['socont1'] = socont1;
    data['socont2'] = socont2;
    data['cont1seal1'] = cont1seal1;
    data['cont1seal2'] = cont1seal2;
    data['SoKien'] = soKien;
    data['sokhoi'] = sokhoi;
    data['soBook'] = soBook;
    data['trangthaihang'] = trangthaihang;
    data['trangthaikhoa'] = trangthaikhoa;
    data['cont2seal1'] = cont2seal1;
    data['cont2seal2'] = cont2seal2;
    data['Sokien1'] = sokien1;
    data['sokhoi1'] = sokhoi1;
    data['soBook1'] = soBook1;
    data['trangthaihang1'] = trangthaihang1;
    data['trangthaikhoa1'] = trangthaikhoa1;
    data['maloaiHang'] = maloaiHang;
    data['maTaixe'] = maTaixe;
    return data;
  }
}

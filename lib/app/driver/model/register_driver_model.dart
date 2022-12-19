class RegisterForDriverModel {
  String? giodukien;
  String? kho;
  String? loaixe;
  String? soxe;
  String? socont1;
  String? socont2;
  String? cont1seal1;
  String? cont1seal2;
  String? cont1seal3;
  String? soKien;
  String? sokhoi;
  String? soPO;
  bool? trangthaihang;
  bool? trangthaiseal;
  bool? trangthaikhoa;
  bool? trangthaichi;
  String? cont2seal1;
  String? cont2seal2;
  String? cont2seal3;
  String? sokien1;
  String? sokhoi1;
  String? soPO1;
  bool? trangthaihang1;
  bool? trangthaiseal1;
  bool? trangthaikhoa1;
  bool? trangthaichi1;
  String? maKhachHang;

  RegisterForDriverModel({
    required this.giodukien,
    required this.kho,
    required this.loaixe,
    required this.soxe,
    required this.socont1,
    required this.socont2,
    required this.cont1seal1,
    required this.cont1seal2,
    required this.cont1seal3,
    required this.soKien,
    required this.sokhoi,
    required this.soPO,
    required this.trangthaihang,
    required this.trangthaiseal,
    required this.trangthaikhoa,
    required this.trangthaichi,
    required this.cont2seal1,
    required this.cont2seal2,
    required this.cont2seal3,
    required this.sokien1,
    required this.sokhoi1,
    required this.soPO1,
    required this.trangthaihang1,
    required this.trangthaiseal1,
    required this.trangthaikhoa1,
    required this.trangthaichi1,
    required this.maKhachHang,
  });

  RegisterForDriverModel.fromJson(Map<String, dynamic> json) {
    giodukien = json['giodukien'];
    kho = json['kho'];
    loaixe = json['loaixe'];
    soxe = json['soxe'];
    socont1 = json['socont1'];
    socont2 = json['socont2'];
    cont1seal1 = json['cont1seal1'];
    cont1seal2 = json['cont1seal2'];
    cont1seal3 = json['cont1seal3'];
    soKien = json['SoKien'];
    sokhoi = json['sokhoi'];
    soPO = json['soPO'];
    trangthaihang = json['trangthaihang'];
    trangthaiseal = json['trangthaiseal'];
    trangthaikhoa = json['trangthaikhoa'];
    trangthaichi = json['trangthaichi'];
    cont2seal1 = json['cont2seal1'];
    cont2seal2 = json['cont2seal2'];
    cont2seal3 = json['cont2seal3'];
    sokien1 = json['Sokien1'];
    sokhoi1 = json['sokhoi1'];
    soPO1 = json['soPO1'];
    trangthaihang1 = json['trangthaihang1'];
    trangthaiseal1 = json['trangthaiseal1'];
    trangthaikhoa1 = json['trangthaikhoa1'];
    trangthaichi1 = json['trangthaichi1'];
    maKhachHang = json['maKhachHang'];
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
    data['cont1seal3'] = cont1seal3;
    data['SoKien'] = soKien;
    data['sokhoi'] = sokhoi;
    data['soPO'] = soPO;
    data['trangthaihang'] = trangthaihang;
    data['trangthaiseal'] = trangthaiseal;
    data['trangthaikhoa'] = trangthaikhoa;
    data['trangthaichi'] = trangthaichi;
    data['cont2seal1'] = cont2seal1;
    data['cont2seal2'] = cont2seal2;
    data['cont2seal3'] = cont2seal3;
    data['Sokien1'] = sokien1;
    data['sokhoi1'] = sokhoi1;
    data['soPO1'] = soPO1;
    data['trangthaihang1'] = trangthaihang1;
    data['trangthaiseal1'] = trangthaiseal1;
    data['trangthaikhoa1'] = trangthaikhoa1;
    data['trangthaichi1'] = trangthaichi1;
    data['maKhachHang'] = maKhachHang;
    return data;
  }
}

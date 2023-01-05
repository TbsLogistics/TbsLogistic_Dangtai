// ignore_for_file: unnecessary_this

class ListDriverModel {
  int? maTaixe;
  KhachhangRe? khachhangRe;
  String? tenTaixe;
  String? diaChi;
  String? email;
  String? phone;
  bool? status;

  ListDriverModel(
      {required this.maTaixe,
      required this.khachhangRe,
      required this.tenTaixe,
      required this.diaChi,
      required this.email,
      required this.phone,
      required this.status});
  //     factory UserModel.fromJson(Map<String, dynamic> json) {
  //   return UserModel(
  //     id: json["id"],
  //     createdAt:
  //         json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
  //     name: json["name"],
  //     avatar: json["avatar"],
  //   );
  // }
  factory ListDriverModel.fromJson(Map<String, dynamic> json) {
    return ListDriverModel(
      maTaixe: json["maTaixe"],
      khachhangRe: json["khachhang_re"] == null
          ? null
          : KhachhangRe.fromJson(json["khachhang_re"]),
      tenTaixe: json["tenTaixe"],
      diaChi: json["diaChi"],
      email: json["email"],
      phone: json["phone"],
      status: json["status"],
    );
  }

  // ListDriverModel.fromJson(Map<String, dynamic> json) {
  //   maTaixe = json['maTaixe'];
  //   khachhangRe = json['khachhang_re'] != null
  //       ? KhachhangRe.fromJson(json['khachhang_re'])
  //       : null;
  //   tenTaixe = json['tenTaixe'];
  //   diaChi = json['diaChi'];
  //   email = json['email'];
  //   phone = json['phone'];
  //   status = json['status'];
  // }
  static List<ListDriverModel> fromJsonList(List list) {
    return list.map((item) => ListDriverModel.fromJson(item)).toList();
  }

  String userAsString() {
    return '#${this.maTaixe} ${this.tenTaixe}';
  }

  ///custom comparing function to check if two users are equal
  bool isEqual(ListDriverModel model) {
    return this.maTaixe == model.maTaixe;
  }

  @override
  String toString() => tenTaixe!;
}

class KhachhangRe {
  String? maKhachHang;
  String? tenKhachhang;
  String? diaChi;
  String? phone;
  String? email;
  String? website;
  String? maSothue;
  String? mota;
  bool? status;

  KhachhangRe(
      {required this.maKhachHang,
      required this.tenKhachhang,
      required this.diaChi,
      required this.phone,
      required this.email,
      required this.website,
      required this.maSothue,
      required this.mota,
      required this.status});

  // KhachhangRe.fromJson(Map<String, dynamic> json) {
  //   maKhachHang = json['maKhachHang'];
  //   tenKhachhang = json['tenKhachhang'];
  //   diaChi = json['diaChi'];
  //   phone = json['phone'];
  //   email = json['email'];
  //   website = json['website'];
  //   maSothue = json['maSothue'];
  //   mota = json['mota'];
  //   status = json['status'];
  // }
  factory KhachhangRe.fromJson(Map<String, dynamic> json) {
    return KhachhangRe(
        maKhachHang: json["maKhachHang"],
        tenKhachhang: json["tenKhachhang"],
        diaChi: json["diaChi"],
        phone: json["phone"],
        email: json["email"],
        website: json["website"],
        maSothue: json["maSothue"],
        mota: json["mota"],
        status: json["status"]);
  }
}

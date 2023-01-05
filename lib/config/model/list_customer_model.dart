class ListCustomerModel {
  String? maKhachHang;
  String? tenKhachhang;
  String? diaChi;
  String? phone;
  String? email;
  String? website;
  String? maSothue;
  String? mota;
  bool? status;

  ListCustomerModel({
    required this.maKhachHang,
    required this.tenKhachhang,
    required this.diaChi,
    required this.phone,
    required this.email,
    required this.website,
    required this.maSothue,
    required this.mota,
    required this.status,
  });

  factory ListCustomerModel.fromJson(Map<String, dynamic> json) {
    return ListCustomerModel(
      maKhachHang: json['maKhachHang'],
      tenKhachhang: json['tenKhachhang'],
      diaChi: json['diaChi'],
      phone: json['phone'],
      email: json['email'],
      website: json['website'],
      maSothue: json['maSothue'],
      mota: json['mota'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['maKhachHang'] = maKhachHang;
    data['tenKhachhang'] = tenKhachhang;
    data['diaChi'] = diaChi;
    data['phone'] = phone;
    data['email'] = email;
    data['website'] = website;
    data['maSothue'] = maSothue;
    data['mota'] = mota;
    data['status'] = status;
    return data;
  }

  static List<ListCustomerModel> fromJsonList(List list) {
    return list.map((item) => ListCustomerModel.fromJson(item)).toList();
  }

  String userAsString() {
    // ignore: unnecessary_this
    return "#${this.maKhachHang} ${this.tenKhachhang}";
  }

  bool isEqual(ListCustomerModel model) {
    // ignore: unnecessary_this
    return this.maKhachHang == model.maKhachHang;
  }

  @override
  String toString() => tenKhachhang!;
}

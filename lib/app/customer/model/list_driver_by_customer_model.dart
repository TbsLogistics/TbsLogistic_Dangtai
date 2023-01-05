// ignore_for_file: unnecessary_this

class ListDriverByCustomerModel {
  int? maTaixe;
  String? tenTaixe;
  String? diaChi;
  String? email;
  String? cCCD;
  String? phone;
  bool? status;

  ListDriverByCustomerModel(
      {this.maTaixe,
      this.tenTaixe,
      this.diaChi,
      this.email,
      this.cCCD,
      this.phone,
      this.status});

  ListDriverByCustomerModel.fromJson(Map<String, dynamic> json) {
    maTaixe = json['maTaixe'];
    tenTaixe = json['tenTaixe'];
    diaChi = json['diaChi'];
    email = json['email'];
    cCCD = json['CCCD'];
    phone = json['phone'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['maTaixe'] = maTaixe;
    data['tenTaixe'] = tenTaixe;
    data['diaChi'] = diaChi;
    data['email'] = email;
    data['CCCD'] = cCCD;
    data['phone'] = phone;
    data['status'] = status;
    return data;
  }

  static List<ListDriverByCustomerModel> fromJsonList(List list) {
    return list
        .map((item) => ListDriverByCustomerModel.fromJson(item))
        .toList();
  }

  String userAsString() {
    return "#${this.maTaixe} ${this.tenTaixe}";
  }

  bool isEqual(ListDriverByCustomerModel model) {
    return this.maTaixe == model.maTaixe;
  }

  @override
  String toString() => tenTaixe!;
}

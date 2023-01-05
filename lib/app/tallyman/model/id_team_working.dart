class IDTeamWorking {
  String? maDoiLamHang;

  IDTeamWorking({this.maDoiLamHang});

  IDTeamWorking.fromJson(Map<String, dynamic> json) {
    maDoiLamHang = json['maDoiLamHang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['maDoiLamHang'] = maDoiLamHang;
    return data;
  }
}

class IDNhanVienModel {
  String? maNv;

  IDNhanVienModel({required this.maNv});

  IDNhanVienModel.fromJson(Map<String, dynamic> json) {
    maNv = json['maNv'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['maNv'] = maNv;
    return data;
  }
}

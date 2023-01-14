class IDDock {
  int? maDock;

  IDDock({this.maDock});

  IDDock.fromJson(Map<String, dynamic> json) {
    maDock = json['maDock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['maDock'] = maDock;
    return data;
  }
}

class ListLineWareHomeModel {
  String? maKho;
  String? tenKho;
  bool? status;
  List<Door>? cuatrai;
  List<Door>? cuaphai;

  ListLineWareHomeModel(
      {this.maKho, this.tenKho, this.status, this.cuatrai, this.cuaphai});

  ListLineWareHomeModel.fromJson(Map<String, dynamic> json) {
    maKho = json['maKho'];
    tenKho = json['tenKho'];
    status = json['status'];
    if (json['cuatrai'] != null) {
      cuatrai = <Door>[];
      json['cuatrai'].forEach((v) {
        cuatrai!.add(Door.fromJson(v));
      });
    }
    if (json['cuaphai'] != null) {
      cuaphai = <Door>[];
      json['cuaphai'].forEach((v) {
        cuaphai!.add(Door.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['maKho'] = maKho;
    data['tenKho'] = tenKho;
    data['status'] = status;
    if (cuatrai != null) {
      data['cuatrai'] = cuatrai!.map((v) => v.toJson()).toList();
    }
    if (cuaphai != null) {
      data['cuaphai'] = cuaphai!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Door {
  int? maCua;
  String? tenCua;
  bool? status;
  String? local;
  List<Dock>? dock;

  Door({this.maCua, this.tenCua, this.status, this.local, this.dock});

  Door.fromJson(Map<String, dynamic> json) {
    maCua = json['maCua'];
    tenCua = json['tenCua'];
    status = json['status'];
    local = json['local'];
    if (json['dock'] != null) {
      dock = <Dock>[];
      json['dock'].forEach((v) {
        dock!.add(Dock.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['maCua'] = maCua;
    data['tenCua'] = tenCua;
    data['status'] = status;
    data['local'] = local;
    if (dock != null) {
      data['dock'] = dock!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Dock {
  int? maDock;
  String? tenDock;
  bool? status;
  Cua? cua;

  Dock({this.maDock, this.tenDock, this.status, this.cua});

  Dock.fromJson(Map<String, dynamic> json) {
    maDock = json['maDock'];
    tenDock = json['tenDock'];
    status = json['status'];
    cua = json['cua'] != null ? Cua.fromJson(json['cua']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['maDock'] = maDock;
    data['tenDock'] = tenDock;
    data['status'] = status;
    if (cua != null) {
      data['cua'] = cua!.toJson();
    }
    return data;
  }
}

class Cua {
  int? maCua;
  String? tenCua;
  Kho? kho;

  Cua({this.maCua, this.tenCua, this.kho});

  Cua.fromJson(Map<String, dynamic> json) {
    maCua = json['maCua'];
    tenCua = json['tenCua'];
    kho = json['kho'] != null ? Kho.fromJson(json['kho']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['maCua'] = maCua;
    data['tenCua'] = tenCua;
    if (kho != null) {
      data['kho'] = kho!.toJson();
    }
    return data;
  }
}

class Kho {
  String? maKho;
  String? tenKho;

  Kho({this.maKho, this.tenKho});

  Kho.fromJson(Map<String, dynamic> json) {
    maKho = json['maKho'];
    tenKho = json['tenKho'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['maKho'] = maKho;
    data['tenKho'] = tenKho;
    return data;
  }
}

// ignore_for_file: constant_identifier_names

class AppConstants {
  static const String THEME_KEY = "dark";

  //api
  static const int RESPONSE_CODE_SUCCESS = 200;
  static const int RESPONSE_CODE_ERROR = 400;
  static const int RESPONSE_CODE_SERVER_ERROR = 500;
  static const String KEY_ACCESS_TOKEN = "access_token";

  //Role
  static const String KEY_ROLE = "role";
  static const String KEY_IMAGE = "image";
  static const String KEY_ID_USER = "id_user";
  static const String KEY_ID_KH = "id_kh";
  static const String KEY_ID_MABOPHAN = "id_bophan";
  static const String KEY_ID_MANV = "id_NV";

  // Url
  static const String urlBase = "https://103.149.28.137:200";
  // static const String urlBase = "http://192.168.3.59:200";
  // static const String urlBase = "http://192.168.0.89:200";
  // static const String urlBase = "http://192.168.0.100:200";
  // static const String urlBase = "http://192.168.0.42:200";
  // static const String urlBase = "https://192.168.0.21:200";

  // Url Client
  //Tài xế
  static const String login = "login";
  static const String createPhieuvao = "createphieuvaocong";
  static const String getListTiker = "danhSachPhieuVaoCuaTaiXe";
  static const String postDetails = "postChitiet";
  static const String LayThongTinPhieuVaoHienTaiCuaTaiXe =
      "LayThongTinPhieuVaoHienTaiCuaTaiXe";
  static const String getdetailByUsername = "getdetailByUsername";
  static const String taixetaophieura = "taixetaophieura";
  static const String LayThongTinPhieuVaoBangMaTaiXe =
      "LayThongTinPhieuVaoBangMaTaiXe";
  static const String danhSachPhieuVaoDaHoanThanh =
      "danhSachPhieuVaoDaHoanThanh";
  static const String LayDanhSachPhieuVaoCuaKhachHang =
      "LayDanhSachPhieuVaoCuaKhachHang";
  static const String doituongkhactaophieuvaocong =
      "doituongkhactaophieuvaocong";
  static const String getdriverbycustomer = "getdriverbycustomer";
  static const String LayDanhSachXeDaPhanDock = "LayDanhSachXeDaPhanDock";
  static const String LayDanhSachXeDangLamHang = "LayDanhSachXeDangLamHang";
  static const String DanhSachPhieuLamHangCuaDoiLamHangByTallyman =
      "DanhSachPhieuLamHangCuaDoiLamHangByTallyman";
  static const String DanhSachNhanVienCoTrongDoiLamHang =
      "DanhSachNhanVienCoTrongDoiLamHang";
  static const String chitietphieulamhang = "chi-tiet-phieu-lam-hang";
  static const String Capnhattrangthailamhang = "Capnhattrangthailamhang";
  static const String getAllLine = "getAllLine";
  static const String CapNhatTrangThaiDock = "CapNhatTrangThaiDock";
}

class Validate {
  String username(String? value) {
    if (value!.isEmpty) {
      return "Nhập tài khoản";
    } else {
      return "";
    }
  }

  String password(String? value) {
    if (value!.isEmpty) {
      return "Nhập mật khẩu";
    } else {
      return "";
    }
  }
}

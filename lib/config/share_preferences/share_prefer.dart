import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tbs_logistics_dangtai/config/core/constants/constants.dart';

class SharePerApi {
  Future<dynamic> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString(AppConstants.KEY_ACCESS_TOKEN);
    return token;
  }

  Future<String> getRole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var role = prefs.getString(AppConstants.KEY_ROLE);
    return role.toString();
  }

  Future<String> getIdUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var idUser = prefs.getString(AppConstants.KEY_ID_USER);
    return idUser.toString();
  }

  Future<String> getIdKH() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var idKH = prefs.getString(AppConstants.KEY_ID_KH);
    return idKH.toString();
  }

  Future<String> getIdBophan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var idBoPhan = prefs.getString(AppConstants.KEY_ID_MABOPHAN);
    return idBoPhan.toString();
  }

  Future<String> getidNV() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var maNv = prefs.getString(AppConstants.KEY_ID_MANV);
    return maNv.toString();
  }

  Future<void> postLogout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove(AppConstants.KEY_ACCESS_TOKEN);

    Get.toNamed("/LOGIN_PAGE");
  }
}

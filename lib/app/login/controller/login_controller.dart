import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tbs_logistics_dangtai/app/login/model/login_user_model.dart';
import 'package:tbs_logistics_dangtai/config/core/constants/constants.dart';
import 'package:tbs_logistics_dangtai/config/model/login_model.dart';
import 'package:tbs_logistics_dangtai/config/routes/pages.dart';

class LoginController extends GetxController {
  RxBool obcureText = true.obs;
  void updateObcureText() {
    obcureText.value = !obcureText.value;
    update();
  }

  Future<void> getLogin(
    String? username,
    String? password,
  ) async {
    // ignore: prefer_typing_uninitialized_variables
    var jsonRespone;
    Response response;

    var dio = Dio();
    var user = LoginModel(
      username: username,
      password: password,
    );
    var jsonData = user.toJson();
    String url = "${AppConstants.urlBase}/login";
    try {
      response = await dio.post(
        url,
        data: jsonData,
        options: Options(
          validateStatus: (_) => true,
        ),
      );
      if (response.statusCode == AppConstants.RESPONSE_CODE_SERVER_ERROR) {
        Get.defaultDialog(
            title: "Thông báo",
            middleText: "Lỗi máy chủ",
            textConfirm: "Xác nhận",
            confirmTextColor: Colors.white,
            backgroundColor: Colors.white,
            onConfirm: () {
              Get.back();
            });
      } else if (response.statusCode == AppConstants.RESPONSE_CODE_ERROR) {
        Get.defaultDialog(
          title: "Thông báo",
          middleText: "Tên đăng nhập hoặc mật khẩu không đúng",
          confirmTextColor: Colors.white,
          backgroundColor: Colors.white,
          onConfirm: () {
            Get.back();
          },
        );
      } else if (response.statusCode == AppConstants.RESPONSE_CODE_SUCCESS) {
        jsonRespone = response.data;
        var tokens = LoginUserModel.fromJson(jsonRespone);
        // tokens_KH = LoginCustomerModel.fromJson(jsonData);

        SharedPreferences prefs = await SharedPreferences.getInstance();
        // ignore: unused_local_variable
        var accessToken = await prefs.setString(
            AppConstants.KEY_ACCESS_TOKEN, "${tokens.accessToken}");
        //ignore: unused_local_variable
        var roleName = await prefs.setString(
            AppConstants.KEY_ROLE, "${tokens.data!.role}");
        var roles = tokens.data!.role;
        switch (roles) {
          case "TX":
            // ignore: unused_local_variable
            var idUser = await prefs.setString(
                AppConstants.KEY_ID_USER, "${tokens.data!.taixe!.maTaixe}");
            getDialog();
            Future.delayed(const Duration(seconds: 1), () {
              Get.toNamed(
                Routes.DRIVER_PAGE,
                arguments: tokens.data!.taixe as Taixe,
              );
            });
            break;
          case "KH":
            // ignore: unused_local_variable
            var idKH = await prefs.setString(AppConstants.KEY_ID_KH,
                "${tokens.data!.khachHang!.maKhachHang}");
            getDialog();
            Future.delayed(const Duration(seconds: 1), () {
              Get.toNamed(Routes.CUSTOMER_PAGE);
            });
            break;
          case "NV":
            // ignore: unused_local_variable
            var idBoPhan = prefs.setString(
              AppConstants.KEY_ID_MABOPHAN,
              "${tokens.data!.nhanvien!.maBoPhan}",
            );
            print("${tokens.data!.nhanvien!.maBoPhan}");
            if (tokens.data!.nhanvien!.maBoPhan == "BV") {
              getDialog();
              Future.delayed(const Duration(seconds: 1), () {
                Get.toNamed(Routes.SERCURITY_PAGE);
              });
            } else if (tokens.data!.nhanvien!.maBoPhan == "DP") {
              getDialog();
              Future.delayed(const Duration(seconds: 1), () {
                Get.toNamed(Routes.COORDINATOR_PAGE);
              });
            }
            if (tokens.data!.nhanvien!.maBoPhan == "TL") {
              // ignore: unused_local_variable
              var maNV = prefs.setString(
                  AppConstants.KEY_ID_MANV, "${tokens.data!.nhanvien!.maNv}");
              getDialog();
              Future.delayed(const Duration(seconds: 1), () {
                Get.toNamed(Routes.TALLYMAN_PAGE);
              });
            }
            break;
          default:
            if (kDebugMode) {
              print("Lỗi sai account");
            }
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void getDialog() {
    Get.defaultDialog(
      title: "Loading",
      confirm: CircularProgressIndicator(
        color: Colors.orangeAccent.withOpacity(0.7),
      ),
      middleText: "",
      textConfirm: null,
      confirmTextColor: Colors.white,
      backgroundColor: Colors.white,
      onConfirm: () {
        Get.back();
      },
      buttonColor: Colors.orangeAccent.withOpacity(0.4),
    );
  }
}

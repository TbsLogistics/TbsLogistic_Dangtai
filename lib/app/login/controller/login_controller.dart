import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tbs_logistics_dangtai/app/login/model/login_customer_model.dart';
import 'package:tbs_logistics_dangtai/app/login/model/login_model.dart';
import 'package:tbs_logistics_dangtai/config/core/constants/constants.dart';
import 'package:tbs_logistics_dangtai/config/model/login_model.dart';
import 'package:tbs_logistics_dangtai/config/model/user_model.dart';
import 'package:tbs_logistics_dangtai/config/model/user_token_model.dart';
import 'package:tbs_logistics_dangtai/config/routes/pages.dart';

class LoginController extends GetxController {
  TextEditingController accountController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> getLogin(
    String? username,
    String? password,
  ) async {
    var jsonRespone;
    Response response;

    LoginTokensModel tokens;

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
        tokens = LoginTokensModel.fromJson(jsonRespone);
        // tokens_KH = LoginCustomerModel.fromJson(jsonData);

        SharedPreferences prefs = await SharedPreferences.getInstance();
        var accessToken = await prefs.setString(
            AppConstants.KEY_ACCESS_TOKEN, "${tokens.accessToken}");
        var roleName = await prefs.setString(
            AppConstants.KEY_ROLE, "${tokens.data!.role}");
        // var idKH = await prefs.setString(AppConstants.KEY_ID_KH,
        //     "${tokens_KH.data!.khachHang!.maKhachHang}");

        var roles = tokens.data!.role;
        // print(idKH);

        switch (roles) {
          case "TX":
            getDialog();
            Future.delayed(const Duration(seconds: 1), () {
              Get.toNamed(Routes.DRIVER_PAGE);
            });
            break;
          case "KH":
            getDialog();
            Future.delayed(const Duration(seconds: 1), () {
              Get.toNamed(Routes.CUSTOMER_PAGE);
            });
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

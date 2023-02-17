import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:get_storage/get_storage.dart';
import 'package:tbs_logistics_dangtai/config/core/constants/constants.dart';
import 'package:tbs_logistics_dangtai/config/model/driver_model.dart';
import 'package:tbs_logistics_dangtai/config/share_preferences/share_prefer.dart';

class SettingDriverController extends GetxController {
  RxBool hideShowMode = true.obs;
  final user = DriverModel().obs;
  RxBool switchValue = true.obs;
  RxBool switchLanguage = true.obs;
  @override
  void onInit() {
    getInfor();
    super.onInit();
  }

  void switchHideShow() {
    hideShowMode.value = !hideShowMode.value;
    update();
  }

  void switchLight(bool value) {
    GetStorage("MyStorage").write(AppConstants.THEME_KEY, value);
    Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
    switchValue.value;
    update();
  }

  void switchLanguag() {
    switchLanguage.value;
    update();
  }

  //lấy thông tin user
  Future<DriverModel> getInfor() async {
    var dio = Dio();
    Response response;
    var tokens = await SharePerApi().getToken();
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $tokens"
    };

    var url = "${AppConstants.urlBase}/getdetailByUsername";

    try {
      response = await dio.get(url, options: Options(headers: headers));
      if (response.statusCode == 200) {
        var data = DriverModel.fromJson(response.data);
        // print(data);
        user.value = data;
        return data;
      } else {
        return response.data;
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  void onClose() {
    Get.deleteAll();
    super.onClose();
  }
}

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:get_storage/get_storage.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/model/tallyman_model.dart';
import 'package:tbs_logistics_dangtai/config/core/constants/constants.dart';
import 'package:tbs_logistics_dangtai/config/share_preferences/share_prefer.dart';

class TallymanSettingsController extends GetxController {
  RxBool switchValue = true.obs;
  RxBool switchLanguage = true.obs;
  RxBool hideShowMode = true.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    getUser();
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
    print("switchValue ${switchValue.value}");
    update();
  }

  void switchLanguag() {
    switchLanguage.value;
    update();
  }

  var dio = Dio();
  late Response response;
  final tallyman = TallymanModel().obs;
  //lấy thông tin user
  Future<TallymanModel> getUser() async {
    var tokens = await SharePerApi().getToken();
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $tokens"
    };

    var url = "${AppConstants.urlBase}/getdetailByUsername";

    try {
      response = await dio.get(
        url,
        options: Options(headers: headers),
      );
      if (response.statusCode == 200) {
        var data = TallymanModel.fromJson(response.data);
        tallyman.value = data;
        update();
        // print(data);
        // ignore: unnecessary_cast
        return data as TallymanModel;
      } else {
        return response.data;
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    Get.deleteAll();
    super.onClose();
  }
}

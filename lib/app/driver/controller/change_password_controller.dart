import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:tbs_logistics_dangtai/config/core/constants/constants.dart';
import 'package:tbs_logistics_dangtai/config/model/form_change_password_model.dart';
import 'package:tbs_logistics_dangtai/config/share_preferences/share_prefer.dart';

class ChangePasswordDriverController extends GetxController {
  var dio = Dio();
  late Response response;

  TextEditingController passwordNew = TextEditingController(text: "");
  TextEditingController passwordOld = TextEditingController(text: "");
  TextEditingController rePasswordNew = TextEditingController(text: "");

  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    var tokens = await SharePerApi().getToken();

    const url = "${AppConstants.urlBase}/account/change-password-use-token";

    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $tokens"
    };

    var changePassword = FormChangePasswordModel(
      oldPassword: oldPassword,
      newPassword: newPassword,
      confirmPassword: confirmPassword,
    );
    var jsonData = changePassword.toJson();
    try {
      response = await dio.put(
        url,
        options: Options(headers: headers),
        data: jsonData,
      );

      if (response.statusCode == AppConstants.RESPONSE_CODE_SUCCESS) {
        var data = response.data;
        Get.snackbar(
          "",
          "",
          backgroundColor: Colors.white,
          titleText: const Text(
            "Thông báo !",
            style: TextStyle(
              color: Colors.red,
            ),
          ),
          messageText: Text(
            "${data["detail"]}",
            style: const TextStyle(
              color: Colors.green,
            ),
          ),
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (e) {
      rethrow;
    }
  }
}

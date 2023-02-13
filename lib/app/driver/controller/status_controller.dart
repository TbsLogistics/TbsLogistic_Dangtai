import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:tbs_logistics_dangtai/app/driver/model/status_driver_model.dart';
import 'package:tbs_logistics_dangtai/config/core/constants/constants.dart';
import 'package:tbs_logistics_dangtai/config/share_preferences/share_prefer.dart';

class StatusDriverCotroller extends GetxController {
  Rx<StatusDriverModel> getStatusDriver = StatusDriverModel().obs;
  RxBool showForm = false.obs;

  @override
  void onInit() async {
    await getStatus();
    super.onInit();
  }

  void showFormStatus() {
    showForm.value = !showForm.value;
    update();
  }

  Future<StatusDriverModel> getStatus() async {
    var dio = Dio();
    Response response;
    var tokens = await SharePerApi().getToken();
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $tokens"
    };
    const url = "${AppConstants.urlBase}/LayThongTinPhieuVaoHienTaiCuaTaiXe";
    try {
      response = await dio.get(
        url,
        options: Options(
          headers: headers, followRedirects: false,
          // will not throw errors
          validateStatus: (status) => true,
        ),
      );
      if (response.statusCode == AppConstants.RESPONSE_CODE_SUCCESS) {
        var data = StatusDriverModel.fromJson(response.data);
        // print(data);
        getStatusDriver.value = data;

        return data;
      }
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}

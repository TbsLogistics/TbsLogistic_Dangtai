import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart' hide Response;
import 'package:tbs_logistics_dangtai/app/coordinators/model/ware_home_model.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/model/id_dock.dart';
import 'package:tbs_logistics_dangtai/config/core/constants/constants.dart';
import 'package:tbs_logistics_dangtai/config/routes/pages.dart';
import 'package:tbs_logistics_dangtai/config/share_preferences/share_prefer.dart';

class WareHomeController extends GetxController {
  var dio = Dio();

  late Response response;
  //Lấy thông tin kho /lines
  Future<List<WareHomeModel>> getWareHome() async {
    // ignore: unused_local_variable
    var tokens = await SharePerApi().getToken();
    const url = "${AppConstants.urlBase}/getAllLine";
    Response response;
    try {
      response = await dio.get(url);
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((e) => WareHomeModel.fromJson(e)).toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }

  //Put dock
  Future<void> putDock({
    required int maDock,
  }) async {
    const url = "${AppConstants.urlBase}/CapNhatTrangThaiDock";
    var IdDock = IDDock(maDock: maDock);
    var jsonData = IdDock.toJson();
    try {
      response = await dio.put(url, data: jsonData);
      if (response.statusCode == AppConstants.RESPONSE_CODE_SUCCESS) {
        var data = response.data;

        update();
        if (data["detail"] ==
            "Cập nhật dock không thành công có xe đang chờ làm hàng") {
          Get.defaultDialog(
            title: "Thông báo",
            content: Text(data["detail"], textAlign: TextAlign.center),
            confirm: TextButton(
              onPressed: () {
                // Get.toNamed(Routes.TALLYMAN_WAREHOME_SCREEN);
                Get.back();
              },
              child: const Text("Oke"),
            ),
          );
        } else {
          Get.defaultDialog(
            title: "Thông báo",
            content: Text(data["detail"], textAlign: TextAlign.center),
            confirm: TextButton(
              onPressed: () {
                Get.toNamed(Routes.TALLYMAN_WAREHOME_SCREEN);
                // Get.back();
              },
              child: const Text("Oke"),
            ),
          );
        }
      }
    } catch (e) {
      rethrow;
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

  @override
  void onClose() {
    // TODO: implement onClose
    Get.deleteAll();
    super.onClose();
  }
}

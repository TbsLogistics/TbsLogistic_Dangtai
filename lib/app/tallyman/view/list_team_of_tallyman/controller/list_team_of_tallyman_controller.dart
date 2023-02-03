import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:tbs_logistics_dangtai/app/tallyman/model/id_team_working.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/model/list_employ_await.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/model/list_employ_working.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/model/status_working_model.dart';
import 'package:tbs_logistics_dangtai/config/core/constants/constants.dart';
import 'package:tbs_logistics_dangtai/config/routes/pages.dart';
import 'package:tbs_logistics_dangtai/config/share_preferences/share_prefer.dart';

class ListTeamOfTallymanController extends GetxController {
  RxBool isLoadWoking = true.obs;
  var dio = Dio();
  late Response response;
  Rx<ListEmployAwaitModel> listEmployAwait = ListEmployAwaitModel().obs;
  RxList listEmploy = <ListEmployeeWorkingModel>[].obs;
  @override
  void onInit() {
    getEmployAwait();
    super.onInit();
  }

  Future<ListEmployAwaitModel> getEmployAwait() async {
    var tokens = await SharePerApi().getToken();
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $tokens"
    };
    const url =
        "${AppConstants.urlBase}/DanhSachPhieuLamHangCuaDoiLamHangByTallyman";

    try {
      isLoadWoking(true);
      response = await dio.get(url, options: Options(headers: headers));
      if (response.statusCode == 200) {
        var data = ListEmployAwaitModel.fromJson(response.data);

        listEmployAwait.value = data;

        return data;
      } else {
        return response.data;
      }
    } finally {
      isLoadWoking(false);
    }
  }

  //ListEmployeeWorking
  Future<List<ListEmployeeWorkingModel>> postListEmployee(
      {required String maDoiLamHang,
      required int maPhieuLamHang,
      required String routes,
      required String time}) async {
    // ignore: unused_local_variable
    var tokens = await SharePerApi().getToken();
    var teamWorking = IDTeamWorking(maDoiLamHang: maDoiLamHang);
    var jsonData = teamWorking.toJson();

    const url = "${AppConstants.urlBase}/DanhSachNhanVienCoTrongDoiLamHang";
    try {
      response = await dio.post(url, data: jsonData);
      if (response.statusCode == AppConstants.RESPONSE_CODE_SUCCESS) {
        List<dynamic> data = response.data;
        List<ListEmployeeWorkingModel> results =
            data.map((e) => ListEmployeeWorkingModel.fromJson(e)).toList();
        listEmploy.value = results;
        update();
        // print(listEmploy);
        Get.toNamed(
          routes,
          arguments: [results, maPhieuLamHang, time],
        );
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateStartWorking({required int maPhieuLamHang}) async {
    var statusWorking = StatusWorkingModel(
      maPhieuLamHang: maPhieuLamHang,
      type: "start",
    );
    var jsonData = statusWorking.toJson();
    const url = "${AppConstants.urlBase}/Capnhattrangthailamhang";
    try {
      response = await dio.post(
        url,
        data: jsonData,
      );
      if (response.statusCode == AppConstants.RESPONSE_CODE_SUCCESS) {
        var data = response.data;
        getEmployAwait();
        Get.defaultDialog(
          title: "Thông báo",
          content: Text(data["detail"]),
          confirm: TextButton(
            onPressed: () {
              Get.back();
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.orangeAccent.withOpacity(0.6)),
            ),
            child: const Text(
              "Xác nhận",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateStopWorking({
    required int maPhieuLamHang,
  }) async {
    var statusWorking = StatusWorkingModel(
      maPhieuLamHang: maPhieuLamHang,
      type: "end",
    );
    var jsonData = statusWorking.toJson();
    const url = "${AppConstants.urlBase}/Capnhattrangthailamhang";
    try {
      response = await dio.post(
        url,
        data: jsonData,
      );
      if (response.statusCode == AppConstants.RESPONSE_CODE_SUCCESS) {
        // ignore: unused_local_variable
        var data = response.data;

        Get.toNamed(Routes.LIST_TEAM_OF_TALLYMAN);
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

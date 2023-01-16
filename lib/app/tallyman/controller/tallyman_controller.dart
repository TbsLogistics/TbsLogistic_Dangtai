import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:tbs_logistics_dangtai/app/coordinators/model/ware_home_model.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/model/id_dock.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/model/id_product_model.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/model/id_team_working.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/model/list_employ_await.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/model/list_employ_working.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/model/list_of_emfloy.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/model/status_working_model.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/model/tallyman_model.dart';

import 'package:tbs_logistics_dangtai/config/core/constants/constants.dart';
import 'package:tbs_logistics_dangtai/config/model/list_traking_model.dart';
import 'package:tbs_logistics_dangtai/config/routes/pages.dart';
import 'package:tbs_logistics_dangtai/config/share_preferences/share_prefer.dart';

class TallymanController extends GetxController {
  var dio = Dio();

  late Response response;
  RxBool hideshowButtonLeft = true.obs;
  RxBool hideshowButtonRight = false.obs;
  RxBool statusDock = false.obs;

  RxBool switchValue = true.obs;
  RxBool switchLanguage = true.obs;
  RxBool hideShowMode = false.obs;
  @override
  void onInit() {
    getUser();
    getEmployAwait();

    super.onInit();
  }

  void switchHideShow() {
    hideShowMode.value = !hideShowMode.value;
    update();
  }

  void switchLight() {
    switchValue.value;
    update();
  }

  void switchLanguag() {
    switchLanguage.value;
    update();
  }

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

  final listEmployAwait = ListEmployAwaitModel().obs;

  Future<ListEmployAwaitModel> getEmployAwait() async {
    var tokens = await SharePerApi().getToken();
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $tokens"
    };
    const url =
        "${AppConstants.urlBase}/DanhSachPhieuLamHangCuaDoiLamHangByTallyman";

    try {
      response = await dio.get(url, options: Options(headers: headers));
      if (response.statusCode == 200) {
        var data = ListEmployAwaitModel.fromJson(response.data);
        print("data $data");
        ListEmployAwaitModel results =
            ListEmployAwaitModel.fromJson(response.data);
        listEmployAwait.value = data;
        update();
        return data;
      } else {
        return response.data;
      }
    } catch (e) {
      rethrow;
    }
  }

  RxList listEmploy = <ListEmployeeWorkingModel>[].obs;

  //ListEmployeeWorking
  Future<List<ListEmployeeWorkingModel>> postListEmployee(
      {required String maDoiLamHang,
      required int maPhieuLamHang,
      required String routes,
      required String time}) async {
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
        print(listEmploy);
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

  RxList listOfEmploy = <ListOfEmployeesModel>[].obs;

  Future<List<ListOfEmployeesModel>> postDetailTicker({
    required int maPhieuLamHang,
    required String routes,
  }) async {
    var tokens = await SharePerApi().getToken();
    var teamWorking = IDProduct(maPhieuLamHang: maPhieuLamHang);
    var jsonData = teamWorking.toJson();

    const url = "${AppConstants.urlBase}/chi-tiet-phieu-lam-hang";
    try {
      response = await dio.post(url, data: jsonData);
      if (response.statusCode == AppConstants.RESPONSE_CODE_SUCCESS) {
        List<dynamic> data = response.data;
        List<ListOfEmployeesModel> results =
            data.map((e) => ListOfEmployeesModel.fromJson(e)).toList();
        listOfEmploy.value = results;
        print(listEmploy);
        Get.toNamed(
          routes,
          arguments: results,
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
        var data = response.data;

        Get.toNamed(Routes.LIST_TEAM_OF_TALLYMAN);
      }
    } catch (e) {
      rethrow;
    }
  }

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
              child: Text("Oke"),
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
              child: Text("Oke"),
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
}

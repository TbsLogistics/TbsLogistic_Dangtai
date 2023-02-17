import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:tbs_logistics_dangtai/app/driver/model/register_out_model.dart';
import 'package:tbs_logistics_dangtai/app/driver/model/status_driver_model.dart';
import 'package:tbs_logistics_dangtai/config/core/constants/constants.dart';
import 'package:tbs_logistics_dangtai/config/routes/pages.dart';
import 'package:tbs_logistics_dangtai/config/share_preferences/share_prefer.dart';

class StatusDriverController extends GetxController {
  Rx<StatusDriverModel> getStatusDriver = StatusDriverModel().obs;
  RxBool showForm = false.obs;

  //tikerin
  TextEditingController numberCar = TextEditingController();
  TextEditingController numberCont1 = TextEditingController();
  TextEditingController numberCont2 = TextEditingController();
  TextEditingController numberCont1Seal1 = TextEditingController();
  TextEditingController numberCont1Seal2 = TextEditingController();

  TextEditingController numberCont2Seal1 = TextEditingController();
  TextEditingController numberCont2Seal2 = TextEditingController();

  TextEditingController numberKien = TextEditingController(text: "0");
  TextEditingController numberKien1 = TextEditingController(text: "0");

  TextEditingController numberKhoi = TextEditingController(text: "0");
  TextEditingController numberKhoi1 = TextEditingController(text: "0");

  TextEditingController numberBook = TextEditingController();
  TextEditingController numberBook1 = TextEditingController();
  // tickerout
  TextEditingController contRa1 = TextEditingController();
  TextEditingController contRa2 = TextEditingController();
  TextEditingController contRa1seal1 = TextEditingController();
  TextEditingController contRa1seal2 = TextEditingController();
  TextEditingController contRa2seal1 = TextEditingController();
  TextEditingController contRa2seal2 = TextEditingController();

  int numberSelectCont = 0;
  var selectedKhachhang = "";
  String? selectedNumberCont;

  void changelNumberCont(String? value) {
    selectedNumberCont = value.toString();
    numberSelectCont = int.parse("$selectedNumberCont");
    update();
  }

  void saveNumberCont(String? value) {
    selectedNumberCont = value.toString();
    update();
  }

  @override
  void onInit() {
    getStatus();
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

  Future<void> postRegisterOut({
    required String contRa1,
    required String contRa2,
    required String contRa1seal1,
    required String contRa1seal2,
    required String contRa2seal1,
    required String contRa2seal2,
    required int soKienra,
    required int soKienra1,
    required int sokhoira,
    required int sokhoira1,
    required String soBookra,
    required String soBookra1,
    required int maphieuvao,
    required StatusDriverModel items,
  }) async {
    var dio = Dio();
    Response response;
    var tokens = await SharePerApi().getToken();
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $tokens"
    };
    var data = RegisterOutModel(
      phieura: PhieuraModel(
        contRa1: contRa1,
        contRa2: contRa2,
        contRa1seal1: contRa1seal1,
        contRa1seal2: contRa1seal2,
        contRa2seal1: contRa2seal1,
        contRa2seal2: contRa2seal2,
        trangthaihangra: false,
        trangthaikhoara: false,
        trangthaihangra1: false,
        trangthaikhoara1: false,
        soKienra: soKienra,
        sokhoira: sokhoira,
        soBookra: soBookra,
        soKienra1: soKienra1,
        sokhoira1: sokhoira1,
        soBookra1: soBookra1,
      ),
      maphieuvao: Maphieuvao(maphieuvao: maphieuvao),
    );
    var jsonData = data.toJson();
    const url = "${AppConstants.urlBase}/taophieura";
    try {
      response = await dio.post(
        url,
        options: Options(headers: headers),
        data: jsonData,
      );
      if (response.statusCode == AppConstants.RESPONSE_CODE_SUCCESS) {
        var data = response.data;
        if (data["message"] != null) {
          Get.defaultDialog(
            title: "Thông báo",
            content: const Text(
              "Phiếu đăng ký đã tồn tại",
            ),
            confirm: TextButton(
              onPressed: () {
                Get.toNamed(Routes.DRIVER_PAGE);
              },
              child: const Text("Xác nhận"),
            ),
          );
          // print(data["message"]);
        } else {
          Get.toNamed(Routes.REGISTER_OUT_DETAILS_SCREEN, arguments: [
            PhieuraModel(
              contRa1: contRa1,
              contRa1seal1: contRa1seal1,
              contRa1seal2: contRa1seal2,
              contRa2: contRa2,
              contRa2seal1: contRa2seal1,
              contRa2seal2: contRa2seal2,
              soBookra: soBookra,
              soBookra1: soBookra1,
              soKienra: soKienra,
              soKienra1: soKienra1,
              sokhoira: sokhoira,
              sokhoira1: sokhoira1,
              trangthaihangra: false,
              trangthaihangra1: false,
              trangthaikhoara: false,
              trangthaikhoara1: false,
            ),
            items
          ]);
        }
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

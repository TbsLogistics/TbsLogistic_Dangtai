import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart' hide Response;
import 'package:intl/intl.dart';
import 'package:tbs_logistics_dangtai/app/coordinators/model/ware_home_model.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/model/id_dock.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/view/ware_home/model/list_dock_by_warehome_model.dart';

import 'package:tbs_logistics_dangtai/config/core/constants/constants.dart';
import 'package:tbs_logistics_dangtai/config/share_preferences/share_prefer.dart';

class WareHomeController extends GetxController {
  var dio = Dio();
  var time = DateFormat("dd-MM-yyyy hh:mm a");

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

  Future<List<ListDockByWareHomeModel>> getLisDock() async {
    // ignore: unused_local_variable
    var tokens = await SharePerApi().getToken();
    const url = "${AppConstants.urlBase}/danhsachdockbykho";
    Response response;
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $tokens"
    };
    try {
      response = await dio.get(url,
          options: Options(
            headers: headers,
          ));
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((e) => ListDockByWareHomeModel.fromJson(e)).toList();
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
    const url = "${AppConstants.urlBase}/curentDockDetail";
    // ignore: non_constant_identifier_names
    var IdDock = IDDock(maDock: maDock);
    var jsonData = IdDock.toJson();
    try {
      response = await dio.post(url, data: jsonData);
      if (response.statusCode == AppConstants.RESPONSE_CODE_SUCCESS) {
        var data = response.data["PhieuLamHang"];

        if (data == null) {
          Get.defaultDialog(
            title: "Thông báo",
            content: const Text("Lỗi máy chủ", textAlign: TextAlign.center),
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
            title: "Chi tiết Dock",
            titleStyle: const TextStyle(
              color: Colors.green,
            ),
            content: SizedBox(
              height: 400,
              width: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 40),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: const BorderSide(
                                  color: Colors.orangeAccent,
                                  width: 1,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Tên đội làm hàng : ${data[index]["tenDoiLamHang"]}",
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Số xe : ${data[index]["soxe"]}",
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        data[index]["socont"] != null
                                            ? Text(
                                                "Số cont : ${data[index]["socont"]}",
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              )
                                            : const Text(
                                                "Số cont :",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Số kiện : ${data[index]["soKien"]}",
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Số khối : ${data[index]["soKhoi"]}",
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        data[index]["thoiGianBatDau"] != null
                                            ? Text(
                                                "Thời gian bắt đầu : ${time.format(
                                                  DateTime.parse(data[index]
                                                      ["thoiGianBatDau"]),
                                                )}",
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              )
                                            : const Text(
                                                "Thời gian bắt đầu : Chưa làm",
                                                style: TextStyle(fontSize: 14),
                                              )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        data[index]["thoiGianKetThuc"] != null
                                            ? Text(
                                                "Thời gian kết thúc : ${time.format(
                                                  DateTime.parse(data[index]
                                                      ["thoiGianKetThuc"]),
                                                )}",
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              )
                                            : const Text(
                                                "Thời gian kết thúc : Chưa làm",
                                                style: TextStyle(fontSize: 14),
                                              )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
            confirm: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.orangeAccent,
                ),
              ),
              onPressed: () {
                // Get.toNamed(Routes.TALLYMAN_WAREHOME_SCREEN);
                Get.back();
              },
              child: const Text(
                "Oke",
                style: TextStyle(color: Colors.white),
              ),
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
    Get.deleteAll();
    super.onClose();
  }
}

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:tbs_logistics_dangtai/app/tallyman/model/id_nhanvien_model.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/model/id_team_working.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/model/list_employ_working.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/model/list_team_of_tallyman_model.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/model/status_working_model.dart';

import 'package:tbs_logistics_dangtai/config/core/constants/constants.dart';
import 'package:tbs_logistics_dangtai/config/model/list_traking_model.dart';
import 'package:tbs_logistics_dangtai/config/routes/pages.dart';
import 'package:tbs_logistics_dangtai/config/share_preferences/share_prefer.dart';

class TallymanController extends GetxController {
  var dio = Dio();
  late Response response;
  RxBool hideshowButtonLeft = true.obs;
  RxBool hideshowButtonRight = false.obs;
  RxBool changeColorStop = false.obs;
  Future<List<ListTrackingModel>> searchTracking(String? query) async {
    var token = await SharePerApi().getToken();
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $token"
    };
    List<ListTrackingModel> results = [];

    const url = "${AppConstants.urlBase}/LayDanhSachXeDaPhanDock";

    try {
      response = await dio.get(url, options: Options(headers: headers));
      if (response.statusCode == 200) {
        List<dynamic> tracking = response.data;

        results = tracking.map((e) => ListTrackingModel.fromJson(e)).toList();
        if (query != null) {
          results = results
              .where(
                (element) => element.taixeRe!.tenTaixe!.toLowerCase().contains(
                      (query.toLowerCase()),
                    ),
              )
              .toList();
        }
      } else {
        return response.data;
      }
    } catch (e) {
      rethrow;
    }
    return results;
  }

  Future<List<ListTrackingModel>> searchTracking1(String? query) async {
    var token = await SharePerApi().getToken();
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $token"
    };
    List<ListTrackingModel> results = [];

    const url = "${AppConstants.urlBase}/LayDanhSachXeDangLamHang";

    try {
      response = await dio.get(url, options: Options(headers: headers));
      if (response.statusCode == 200) {
        List<dynamic> tracking = response.data;

        results = tracking.map((e) => ListTrackingModel.fromJson(e)).toList();
        if (query != null) {
          results = results
              .where(
                (element) => element.taixeRe!.tenTaixe!.toLowerCase().contains(
                      (query.toLowerCase()),
                    ),
              )
              .toList();
        }
      } else {
        return response.data;
      }
    } catch (e) {
      rethrow;
    }
    return results;
  }

  //lấy thông tin user
  Future<Map<String, dynamic>> getUser() async {
    var tokens = await SharePerApi().getToken();
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $tokens"
    };

    var url = "${AppConstants.urlBase}/getdetailByUsername";

    try {
      response = await dio.get(url, options: Options(headers: headers));
      if (response.statusCode == 200) {
        var data = response.data;
        // print(data);
        return data;
      } else {
        return response.data;
      }
    } catch (e) {
      rethrow;
    }
  }

  //Lấy list team of tallyman
  Future<List<ListTeamOfTallymanModel>> getListTeam() async {
    var tokens = await SharePerApi().getToken();
    var maNV = await SharePerApi().getidNV();

    var manhanvien = IDNhanVienModel(maNv: maNV);
    var jsonData = manhanvien.toJson();
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $tokens"
    };

    const url = "${AppConstants.urlBase}/TallyManLayDanhSachPhieuLamHang";
    try {
      response = await dio.post(
        url,
        options: Options(headers: headers),
        data: jsonData,
      );
      if (response.statusCode == AppConstants.RESPONSE_CODE_SUCCESS) {
        List<dynamic> data = response.data;
        return data.map((e) => ListTeamOfTallymanModel.fromJson(e)).toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }

  //ListEmployeeWorking
  Future<List<ListEmployeeWorkingModel>> postListEmployee(
      {required String maDoiLamHang, required int maPhieuLamHang}) async {
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
        Get.toNamed(
          Routes.LIST_TEAM_DETAILS_OF_TALLYMAN,
          arguments: [results, maPhieuLamHang],
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
}

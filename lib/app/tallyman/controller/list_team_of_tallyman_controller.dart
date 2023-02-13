import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:tbs_logistics_dangtai/app/tallyman/model/id_product_model.dart';

import 'package:tbs_logistics_dangtai/app/tallyman/model/list_employ_await.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/model/list_mem_in_team.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/view/ware_home/model/ticker_working_model.dart';
import 'package:tbs_logistics_dangtai/config/core/constants/constants.dart';
import 'package:tbs_logistics_dangtai/config/share_preferences/share_prefer.dart';

class ListTeamOfTallymanController extends GetxController {
  RxBool isLoadWoking = true.obs;
  var dio = Dio();
  late Response response;
  Rx<ListEmployAwaitModel> listEmployAwait = ListEmployAwaitModel().obs;
  RxList<ListMemInTeamModel> listEmploy = <ListMemInTeamModel>[].obs;
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
  Future<List<TickerWorkingModel>> postListEmployee({
    required int maPhieuLamHang,
    required String routes,
    required String time,
  }) async {
    // ignore: unused_local_variable
    // var tokens = await SharePerApi().getToken();
    var teamWorking = IDProduct(maPhieuLamHang: maPhieuLamHang);
    var jsonData = teamWorking.toJson();

    const url = "${AppConstants.urlBase}/chi-tiet-phieu-lam-hang-vs02";
    try {
      response = await dio.post(url, data: jsonData);
      if (response.statusCode == AppConstants.RESPONSE_CODE_SUCCESS) {
        var data = response.data;
        var phieulamhang = TickerWorkingModel.fromJson(data["phieulamhang"]);
        List team = data["doilamhang"];
        var listTeam = team.map((e) => ListMemInTeamModel.fromJson(e)).toList();
        Get.toNamed(
          routes,
          arguments: [
            phieulamhang,
            maPhieuLamHang,
            time,
            listTeam,
          ],
        );
      }
      return [];
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

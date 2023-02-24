import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:tbs_logistics_dangtai/app/tallyman/model/id_product_model.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/model/list_employ_await.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/model/list_mem_in_team.dart';
import 'package:tbs_logistics_dangtai/config/core/constants/constants.dart';
import 'package:tbs_logistics_dangtai/config/share_preferences/share_prefer.dart';

class ListFinishedWorkingController extends GetxController {
  var dio = Dio();
  Rx<ListEmployAwaitModel> listEmployAwait = ListEmployAwaitModel().obs;
  RxList<ListMemInTeamModel> listOfEmploy = <ListMemInTeamModel>[].obs;
  late Response response;

  RxBool isFinalling = true.obs;
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
      response = await dio.get(url, options: Options(headers: headers));

      if (response.statusCode == 200) {
        var data = ListEmployAwaitModel.fromJson(response.data);
        // print(data);

        return data;
      } else {
        return response.data;
      }
    } finally {}
  }

  Future<List<ListMemInTeamModel>> postDetailTicker({
    required int maPhieuLamHang,
    required String routes,
  }) async {
    // ignore: unused_local_variable
    var tokens = await SharePerApi().getToken();
    var teamWorking = IDProduct(maPhieuLamHang: maPhieuLamHang);
    var jsonData = teamWorking.toJson();

    const url = "${AppConstants.urlBase}/chi-tiet-phieu-lam-hang-vs02";
    try {
      response = await dio.post(url, data: jsonData);
      if (response.statusCode == AppConstants.RESPONSE_CODE_SUCCESS) {
        List<dynamic> data = response.data["doilamhang"];
        List<ListMemInTeamModel> results =
            data.map((e) => ListMemInTeamModel.fromJson(e)).toList();
        listOfEmploy.value = results;
        // print(listOfEmploy);
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

  @override
  void onClose() {
    Get.deleteAll();
    super.onClose();
  }
}

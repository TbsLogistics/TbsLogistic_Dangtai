import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response ;
import 'package:tbs_logistics_dangtai/app/driver/model/list_tiker_for_driver.dart';
import 'package:tbs_logistics_dangtai/config/core/constants/constants.dart';
import 'package:tbs_logistics_dangtai/config/model/details_user_model.dart';
import 'package:tbs_logistics_dangtai/config/routes/pages.dart';
import 'package:tbs_logistics_dangtai/config/share_preferences/share_prefer.dart';

class StatusTickerController extends GetxController {
  Future<List<ListTicketForDriver>> getListTiker() async {
    var dio = Dio();
    Response response;
    const url = "${AppConstants.urlBase}/danhSachPhieuVaoCuaTaiXe";
    var token = await SharePerApi().getToken();
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $token"
    };
    try {
      response = await dio.get(url, options: Options(headers: headers));
      if (response.statusCode == AppConstants.RESPONSE_CODE_SUCCESS) {
        List<dynamic> data = response.data;
        // print(data);
        return data.map((e) => ListTicketForDriver.fromJson(e)).toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }
  Future<void> postDetails() async {
    var dio = Dio();
    Response response;
    var token = await SharePerApi().getToken();
    var idTaixe = await SharePerApi().getIdUser();
    var role = await SharePerApi().getRole();
    const url = "${AppConstants.urlBase}/postChitiet";
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $token"
    };
    var detailsUser = DetailsUserModel(
      role: role,
      userid: idTaixe,
    );
    var jsonData = detailsUser.toJson();
    try {
      response = await dio.post(
        url,
        options: Options(headers: headers),
        data: jsonData,
      );
      if (response.statusCode == 200) {
        var data = response.data;
        // print(data);
        Get.toNamed(Routes.QR_CODE_SCREEN, arguments: data);
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

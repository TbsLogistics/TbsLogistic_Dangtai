import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:tbs_logistics_dangtai/app/coordinators/model/ware_home_model.dart';
import 'package:tbs_logistics_dangtai/config/core/constants/constants.dart';
import 'package:tbs_logistics_dangtai/config/model/list_traking_model.dart';

import '../../../config/share_preferences/share_prefer.dart';

class CoordinatorController extends GetxController {
  var dio = Dio();
  Future<List<ListTrackingModel>> getListCarIn() async {
    var token = await SharePerApi().getToken();
    Response response;
    const url = "${AppConstants.urlBase}/LayDanhSachXeDaVaoCong";
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $token"
    };
    try {
      response = await dio.get(
        url,
        options: Options(headers: headers),
      );
      if (response.statusCode == AppConstants.RESPONSE_CODE_SUCCESS) {
        List<dynamic> data = response.data;

        return data.map((e) => ListTrackingModel.fromJson(e)).toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ListTrackingModel>> getListCarDook() async {
    var token = await SharePerApi().getToken();
    Response response;
    const url = "${AppConstants.urlBase}/LayDanhSachXeDaPhanDock";
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $token"
    };
    try {
      response = await dio.get(
        url,
        options: Options(headers: headers),
      );
      if (response.statusCode == AppConstants.RESPONSE_CODE_SUCCESS) {
        List<dynamic> data = response.data;

        return data.map((e) => ListTrackingModel.fromJson(e)).toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }

  //lấy thông tin user
  Future<Map<String, dynamic>> getUser() async {
    var tokens = await SharePerApi().getToken();
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $tokens"
    };
    Response response;
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
}

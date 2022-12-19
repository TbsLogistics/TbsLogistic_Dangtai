import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';
import 'package:tbs_logistics_dangtai/app/driver/model/register_driver_model.dart';
import 'package:tbs_logistics_dangtai/config/core/constants/constants.dart';
import 'package:tbs_logistics_dangtai/config/model/list_customer_model.dart';
import 'package:tbs_logistics_dangtai/config/share_preferences/share_prefer.dart';

class DriverController extends GetxController {
  TextEditingController numberCar = TextEditingController();
  TextEditingController numberCont1 = TextEditingController();
  TextEditingController numberCont2 = TextEditingController();
  TextEditingController numberCont1Seal1 = TextEditingController();
  TextEditingController numberCont1Seal2 = TextEditingController();

  TextEditingController numberCont1Seal3 = TextEditingController();
  TextEditingController numberCont2Seal1 = TextEditingController();
  TextEditingController numberCont2Seal2 = TextEditingController();
  TextEditingController numberCont2Seal3 = TextEditingController();
  TextEditingController numberKien = TextEditingController();

  TextEditingController numberKien1 = TextEditingController();
  TextEditingController numberKhoi = TextEditingController();
  TextEditingController numberKhoi1 = TextEditingController();
  TextEditingController numberPO = TextEditingController();
  TextEditingController numberPO1 = TextEditingController();

  Future<List<ListCustomerModel>> getData(query) async {
    var dio = Dio();

    const url = '${AppConstants.urlBase}/getAllKhachhang';

    try {
      final response = await dio.get(
        url,
        queryParameters: {"query": query},
      );

      if (response.statusCode == 200) {
        var customer = response.data;
        if (customer != null) {
          return ListCustomerModel.fromJsonList(customer);
        }
        return [];
      } else {
        return [];
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<void> postRegisterDriver({
    required String? numberCar,
    required String? numberCont1,
    required String? numberCont2,
    required String? numberCont1Seal1,
    required String? numberCont1Seal2,
    required String? numberCont1Seal3,
    required String? numberCont2Seal1,
    required String? numberCont2Seal2,
    required String? numberCont2Seal3,
    required String? numberKien,
    required String? numberKien1,
    required String? numberKhoi,
    required String? numberKhoi1,
    required String? numberPO,
    required String? numberPO1,
    required String? time,
    required String? idKho,
    required String? idCar,
    required String? idKhachhang,
  }) async {
    var _dio = Dio();
    Response response;
    var token = await SharePerApi().getToken();
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $token"
    };
    const url = "${AppConstants.urlBase}/createphieuvaocong";
    var create = RegisterForDriverModel(
        giodukien: time,
        kho: idKho,
        loaixe: idCar,
        soxe: numberCar,
        socont1: numberCont1,
        socont2: numberCont2,
        cont1seal1: numberCont1Seal1,
        cont1seal2: numberCont1Seal2,
        cont1seal3: numberCont1Seal3,
        soKien: numberKien,
        sokhoi: numberKhoi,
        soPO: numberPO,
        trangthaihang: false,
        trangthaiseal: false,
        trangthaikhoa: false,
        trangthaichi: false,
        cont2seal1: numberCont2Seal1,
        cont2seal2: numberCont2Seal2,
        cont2seal3: numberCont2Seal3,
        sokien1: numberKien1,
        sokhoi1: numberKhoi1,
        soPO1: numberPO1,
        trangthaihang1: false,
        trangthaiseal1: false,
        trangthaikhoa1: false,
        trangthaichi1: false,
        maKhachHang: idKhachhang);
    var jsonData = create.toJson();
    try {
      response = await _dio.post(
        url,
        options: Options(headers: headers),
        data: jsonData,
      );
      if (response.statusCode == 200) {
        print("Thành công");
      }
    } catch (e) {
      print(e);
    }
  }
}

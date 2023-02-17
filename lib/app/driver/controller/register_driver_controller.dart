import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:tbs_logistics_dangtai/app/driver/model/list_customer_for_driver_model.dart';
import 'package:tbs_logistics_dangtai/app/driver/model/register_driver_model.dart';
import 'package:tbs_logistics_dangtai/config/core/constants/constants.dart';
import 'package:tbs_logistics_dangtai/config/routes/pages.dart';
import 'package:tbs_logistics_dangtai/config/share_preferences/share_prefer.dart';

class RegisterDriverController extends GetxController {
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

  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    formKey;
    super.onInit();
  }

  var selectedKhachhang = "";

  Future<void> postRegisterDriver({
    required String? time,
    required String? idWarehome,
    required String? idCar,
    required String? numberCar,
    required String? numberCont1,
    required String? numberCont2,
    required String? numberCont1Seal1,
    required String? numberCont1Seal2,
    required double? numberKien,
    required double? numberKhoi,
    required String? numberBook,
    required String? numberCont2Seal1,
    required String? numberCont2Seal2,
    required double? numberKien1,
    required double? numberKhoi1,
    required String? numberBook1,
    required String? idProduct,
    required String maKhachHang,
  }) async {
    var dio = Dio();
    Response response;
    var token = await SharePerApi().getToken();
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $token"
    };
    const url = "${AppConstants.urlBase}/createphieuvaocong";
    var create = RegisterForDriverModel(
      giodukien: time,
      kho: idWarehome,
      loaixe: idCar,
      soxe: numberCar,
      socont1: numberCont1,
      socont2: numberCont2,
      cont1seal1: numberCont1Seal1,
      cont1seal2: numberCont1Seal2,
      soKien: numberKien ?? 0,
      sokhoi: numberKhoi ?? 0,
      soBook: numberBook,
      trangthaihang: false,
      trangthaikhoa: false,
      cont2seal1: numberCont2Seal1,
      cont2seal2: numberCont2Seal2,
      sokien1: numberKien1 ?? 0,
      sokhoi1: numberKhoi1 ?? 0,
      soBook1: numberBook1,
      trangthaihang1: false,
      trangthaikhoa1: false,
      maloaiHang: idProduct,
      maKhachHang: maKhachHang,
    );
    var jsonData = create.toJson();
    try {
      response = await dio.post(
        url,
        options: Options(headers: headers),
        data: jsonData,
      );
      if (response.statusCode == 200) {
        var data = response.data;
        if (data["status"] == 204) {
          Get.snackbar(
            "Thông báo",
            "${data["detail"]}",
            titleText: const Text(
              "Thông báo",
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            messageText: Text(
              "${data["detail"]}",
              style: const TextStyle(
                color: Colors.green,
              ),
              textAlign: TextAlign.center,
            ),
            snackPosition: SnackPosition.TOP,
          );
        } else {
          Get.toNamed(
            Routes.DETAILS_FORM_REGISTER_DRIVER,
            arguments: RegisterForDriverModel(
              giodukien: time,
              kho: idWarehome,
              loaixe: idCar,
              soxe: numberCar,
              socont1: numberCont1,
              socont2: numberCont2,
              cont1seal1: numberCont1Seal1,
              cont1seal2: numberCont1Seal2,
              soKien: numberKien,
              sokhoi: numberKhoi,
              soBook: numberBook,
              trangthaihang: false,
              trangthaikhoa: false,
              cont2seal1: numberCont2Seal1,
              cont2seal2: numberCont2Seal2,
              sokien1: numberKien1,
              sokhoi1: numberKhoi1,
              soBook1: numberBook1,
              trangthaihang1: false,
              trangthaikhoa1: false,
              maloaiHang: idProduct,
              maKhachHang: maKhachHang,
            ),
          );
        }
      }
    } catch (e) {
      // print(e);
      rethrow;
    }
  }

  Future<List<ListCustomerForDriverModel>> getData(query) async {
    var dio = Dio();
    Response response;
    var token = await SharePerApi().getToken();

    const url = '${AppConstants.urlBase}/danh-sach-khach-hang';
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $token"
    };
    try {
      response = await dio.get(
        url,
        options: Options(headers: headers),
        queryParameters: {"query": query},
      );

      if (response.statusCode == AppConstants.RESPONSE_CODE_SUCCESS) {
        var customer = response.data["data"];
        if (customer != null) {
          return ListCustomerForDriverModel.fromJsonList(customer);
        }
        return [];
      } else {
        return [];
      }
    } catch (error) {
      rethrow;
    }
  }
}

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:tbs_logistics_dangtai/app/customer/model/list_driver_by_customer_model.dart';
import 'package:tbs_logistics_dangtai/app/customer/model/register_customer_model.dart';
import 'package:tbs_logistics_dangtai/app/sercurity/model/id_taixe_model.dart';
import 'package:tbs_logistics_dangtai/config/core/constants/constants.dart';
import 'package:tbs_logistics_dangtai/config/model/list_traking_model.dart';
import 'package:tbs_logistics_dangtai/config/routes/pages.dart';
import 'package:tbs_logistics_dangtai/config/share_preferences/share_prefer.dart';

class CustomerController extends GetxController {
  var dio = Dio();

  TextEditingController numberCar = TextEditingController();
  TextEditingController numberCont1 = TextEditingController();
  TextEditingController numberCont2 = TextEditingController();
  TextEditingController numberCont1Seal1 = TextEditingController();
  TextEditingController numberCont1Seal2 = TextEditingController();

  TextEditingController numberCont1Seal3 = TextEditingController();
  TextEditingController numberCont2Seal1 = TextEditingController();
  TextEditingController numberCont2Seal2 = TextEditingController();
  TextEditingController numberCont2Seal3 = TextEditingController();
  TextEditingController numberKien = TextEditingController(text: "0");

  TextEditingController numberKien1 = TextEditingController(text: "0");
  TextEditingController numberKhoi = TextEditingController(text: "0");
  TextEditingController numberKhoi1 = TextEditingController(text: "0");
  TextEditingController numberBook = TextEditingController();
  TextEditingController numberBook1 = TextEditingController();

  Future<List<ListDriverByCustomerModel>> getListCustomer() async {
    Response response;
    var token = await SharePerApi().getToken();
    const url = "${AppConstants.urlBase}/getdriverbycustomer";
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
        return data.map((e) => ListDriverByCustomerModel.fromJson(e)).toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ListDriverByCustomerModel>> getData(query) async {
    Response response;
    var token = await SharePerApi().getToken();

    const url = '${AppConstants.urlBase}/getdriverbycustomer';
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
        var customer = response.data;
        if (customer != null) {
          return ListDriverByCustomerModel.fromJsonList(customer);
        }
        return [];
      } else {
        return [];
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<void> postRegisterCustomer({
    required String? numberCar,
    required String? numberCont1,
    required String? numberCont2,
    required String? numberCont1Seal1,
    required String? numberCont1Seal2,
    required String? numberCont2Seal1,
    required String? numberCont2Seal2,
    required int? numberKien,
    required int? numberKien1,
    required int? numberKhoi,
    required int? numberKhoi1,
    required String? numberBook,
    required String? numberBook1,
    required String? time,
    required String? idKho,
    required String? idCar,
    required int? idTaixe,
    required String? idProduct,
  }) async {
    Response response;
    var token = await SharePerApi().getToken();
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $token"
    };
    const url = "${AppConstants.urlBase}/doituongkhactaophieuvaocong";
    var create = RegisterForCustomerModel(
        giodukien: time,
        kho: idKho,
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
        maTaixe: idTaixe,
        maloaiHang: idProduct);
    var jsonData = create.toJson();
    try {
      response = await dio.post(
        url,
        options: Options(headers: headers),
        data: jsonData,
      );
      if (response.statusCode == 200) {
        var data = response.data;
        if (data["status_code"] == 204) {
          Get.defaultDialog(
            title: "Thông báo",
            content: Center(child: Text("${data["detail"]}")),
            confirm: TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("Quay lại"),
            ),
          );
        } else {
          Get.toNamed(
            Routes.DETAILS_REGISTER_CUSTOMER,
            arguments: RegisterForCustomerModel(
              giodukien: time,
              kho: idKho,
              loaixe: idCar,
              soxe: numberCar,
              socont1: numberCont1,
              socont2: numberCont2,
              cont1seal1: numberCont1Seal1,
              cont1seal2: numberCont1Seal1,
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
              maTaixe: idTaixe,
            ),
          );
        }
      }
    } catch (e) {
      // print(e);
      rethrow;
    }
  }

  Future<List<ListDriverByCustomerModel>> getListTickerCustomer() async {
    Response response;
    const url = "${AppConstants.urlBase}/LayDanhSachPhieuVaoCuaKhachHang";
    var token = await SharePerApi().getToken();
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $token"
    };
    try {
      response = await dio.get(url, options: Options(headers: headers));
      if (response.statusCode == AppConstants.RESPONSE_CODE_SUCCESS) {
        List<dynamic> data = response.data;
        // print(data);
        return data.map((e) => ListDriverByCustomerModel.fromJson(e)).toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }

  //DateTime
  //Danh sách phiếu vào của khách hàng
  Future<List<ListTrackingModel>> getListRegistedCustomer() async {
    var tokens = await SharePerApi().getToken();
    Response response;
    const url = "${AppConstants.urlBase}/danhSachPhieuVaoDaHoanThanh";
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $tokens"
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

  Future<void> postInforDriver({required int? idTaixe}) async {
    Response response;
    const url = "${AppConstants.urlBase}/LayThongTinPhieuVaoBangMaTaiXe";
    var mataixe = idTaixeModel(maTaixe: idTaixe);
    var jsonData = mataixe.toJson();
    try {
      response = await dio.post(
        url,
        data: jsonData,
      );
      if (response.statusCode == AppConstants.RESPONSE_CODE_SUCCESS) {
        var data = response.data;

        if (data["status_code"] == 204) {
          Get.defaultDialog(
            title: "Thông báo",
            content: Text("${data["detail"]}"),
            confirm: TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("Xác nhận"),
            ),
          );
        } else {
          Get.toNamed(
            Routes.CUSTOMER_DETAILS_INFO_DRIVER,
            arguments: data,
          );
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  // lấy thông tin user
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

  @override
  void onClose() {
    getUser();
    super.onClose();
  }
}

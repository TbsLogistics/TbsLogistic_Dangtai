import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:tbs_logistics_dangtai/app/customer/model/list_driver_by_customer_model.dart';
import 'package:tbs_logistics_dangtai/app/customer/model/register_customer_model.dart';
import 'package:tbs_logistics_dangtai/config/core/constants/constants.dart';
import 'package:tbs_logistics_dangtai/config/share_preferences/share_prefer.dart';

class CustomerController extends GetxController {
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

  Future<List<ListDriverByCustomerModel>> getListCustomer() async {
    var _dio = Dio();
    Response response;
    var token = await SharePerApi().getToken();
    const url = "${AppConstants.urlBase}/getdriverbycustomer";
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $token"
    };
    try {
      response = await _dio.get(
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
    var dio = Dio();
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
    required String? numberKien,
    required String? numberKien1,
    required String? numberKhoi,
    required String? numberKhoi1,
    required String? numberPO,
    required String? numberPO1,
    required String? time,
    required String? idKho,
    required String? idCar,
    required int? idTaixe,
  }) async {
    var _dio = Dio();
    Response response;
    var token = await SharePerApi().getToken();
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $token"
    };
    const url = "${AppConstants.urlBase}/createphieuvaocong";
    var create = RegisterForCustomerModel(
        giodukien: time,
        kho: idKho,
        loaixe: idCar,
        soxe: numberCar,
        socont1: numberCont1,
        socont2: numberCont2,
        cont1seal1: numberCont1Seal1,
        cont1seal2: numberCont1Seal2,
        soKien: numberKien,
        sokhoi: numberKhoi,
        soPO: numberPO,
        trangthaihang: false,
        trangthaikhoa: false,
        cont2seal1: numberCont2Seal1,
        cont2seal2: numberCont2Seal2,
        sokien1: numberKien1,
        sokhoi1: numberKhoi1,
        soPO1: numberPO1,
        trangthaihang1: false,
        trangthaikhoa1: false,
        maTaixe: idTaixe);
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

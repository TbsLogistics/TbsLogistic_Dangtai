import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:tbs_logistics_dangtai/app/driver/model/list_tiker_for_driver.dart';
import 'package:tbs_logistics_dangtai/app/driver/model/register_driver_model.dart';
import 'package:tbs_logistics_dangtai/app/driver/model/register_out_model.dart';
import 'package:tbs_logistics_dangtai/app/driver/model/status_driver_model.dart';
import 'package:tbs_logistics_dangtai/config/core/constants/constants.dart';
import 'package:tbs_logistics_dangtai/config/model/details_user_model.dart';
import 'package:tbs_logistics_dangtai/config/model/driver_model.dart';
import 'package:tbs_logistics_dangtai/config/routes/pages.dart';
import 'package:tbs_logistics_dangtai/config/share_preferences/share_prefer.dart';

class DriverController extends GetxController {
  RxBool switchValue = true.obs;
  RxBool switchLanguage = true.obs;
  RxBool hideShowMode = false.obs;
  RxBool showForm = false.obs;
  final getStatusDriver = StatusDriverModel().obs;
  String? selectedNumberCont;
  int numberSelectCont = 0;

  @override
  void onInit() {
    getInfor();
    getStatus();
    getListTiker();
    super.onInit();
  }

  void changelNumberCont(String? value) {
    selectedNumberCont = value.toString();
    numberSelectCont = int.parse("${selectedNumberCont}");
    update();
  }

  void saveNumberCont(String? value) {
    selectedNumberCont = value.toString();
    update();
  }

  void showFormStatus() {
    showForm.value = !showForm.value;
    update();
  }

  void switchHideShow() {
    hideShowMode.value = !hideShowMode.value;
    update();
  }

  void switchLight() {
    switchValue.value;
    update();
  }

  void switchLanguag() {
    switchLanguage.value;
    update();
  }

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
              textAlign: TextAlign.center,
            ),
            snackPosition: SnackPosition.BOTTOM,
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
            ),
          );
        }
      }
    } catch (e) {
      // print(e);
      rethrow;
    }
  }

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

  Future<StatusDriverModel> getStatus() async {
    var dio = Dio();
    Response response;
    var tokens = await SharePerApi().getToken();
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $tokens"
    };
    const url = "${AppConstants.urlBase}/LayThongTinPhieuVaoHienTaiCuaTaiXe";
    try {
      response = await dio.get(
        url,
        options: Options(
          headers: headers, followRedirects: false,
          // will not throw errors
          validateStatus: (status) => true,
        ),
      );
      if (response.statusCode == AppConstants.RESPONSE_CODE_SUCCESS) {
        var data = StatusDriverModel.fromJson(response.data);
        // print(data);
        getStatusDriver.value = data;
        update();
        return data;
      }
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  final user = DriverModel().obs;

  //lấy thông tin user
  Future<DriverModel> getInfor() async {
    var dio = Dio();
    Response response;
    var tokens = await SharePerApi().getToken();
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $tokens"
    };

    var url = "${AppConstants.urlBase}/getdetailByUsername";

    try {
      response = await dio.get(url, options: Options(headers: headers));
      if (response.statusCode == 200) {
        var data = DriverModel.fromJson(response.data);
        // print(data);
        user.value = data;
        return data;
      } else {
        return response.data;
      }
    } catch (e) {
      rethrow;
    }
  }
  //Đăng ký phiếu ra

  Future<void> postRegisterOut({
    required String contRa1,
    required String contRa2,
    required String contRa1seal1,
    required String contRa1seal2,
    required String contRa2seal1,
    required String contRa2seal2,
    required double soKienra,
    required double soKienra1,
    required double sokhoira,
    required double sokhoira1,
    required String soBookra,
    required String soBookra1,
    required int maphieuvao,
  }) async {
    var dio = Dio();
    Response response;
    var tokens = await SharePerApi().getToken();
    Map<String, dynamic> headers = {
      HttpHeaders.authorizationHeader: "Bearer $tokens"
    };
    var data = RegisterOutModel(
      phieura: PhieuraModel(
        contRa1: contRa1,
        contRa2: contRa2,
        contRa1seal1: contRa1seal1,
        contRa1seal2: contRa1seal2,
        contRa2seal1: contRa2seal1,
        contRa2seal2: contRa2seal2,
        trangthaihangra: false,
        trangthaikhoara: false,
        trangthaihangra1: false,
        trangthaikhoara1: false,
        soKienra: soKienra,
        sokhoira: sokhoira,
        soBookra: soBookra,
        soKienra1: soKienra1,
        sokhoira1: sokhoira1,
        soBookra1: soBookra1,
      ),
      maphieuvao: Maphieuvao(maphieuvao: maphieuvao),
    );
    var jsonData = data.toJson();
    const url = "${AppConstants.urlBase}/taophieura";
    try {
      response = await dio.post(
        url,
        options: Options(headers: headers),
        data: jsonData,
      );
      if (response.statusCode == AppConstants.RESPONSE_CODE_SUCCESS) {
        var data = response.data;
        if (data["message"] != null) {
          Get.defaultDialog(
            title: "Thông báo",
            content: const Text(
              "Phiếu đăng ký đã tồn tại",
            ),
            confirm: TextButton(
              onPressed: () {
                Get.toNamed(Routes.DRIVER_PAGE);
              },
              child: const Text("Xác nhận"),
            ),
          );
          // print(data["message"]);
        } else {
          Get.toNamed(Routes.REGISTER_OUT_DETAILS_SCREEN);
        }
      }
    } catch (e) {
      rethrow;
    }
  }
}

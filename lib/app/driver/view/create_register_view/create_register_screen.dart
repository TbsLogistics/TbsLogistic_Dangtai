import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tbs_logistics_dangtai/app/driver/controller/driver_controller.dart';
import 'package:tbs_logistics_dangtai/app/driver/model/chage_page_model.dart';
import 'package:tbs_logistics_dangtai/config/core/data/color.dart';
import 'package:tbs_logistics_dangtai/config/core/data/text_style.dart';
import 'package:tbs_logistics_dangtai/config/model/list_customer_model.dart';
import 'package:tbs_logistics_dangtai/config/routes/pages.dart';
import 'package:tbs_logistics_dangtai/config/widget/buttom_form_submit.dart';
import 'package:tbs_logistics_dangtai/config/widget/custom_text_form_fiels.dart';
import 'package:tbs_logistics_dangtai/config/widget/drop_button.dart';

class RegisterFormScreen extends StatefulWidget {
  const RegisterFormScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterFormScreenState createState() => _RegisterFormScreenState();
}

class _RegisterFormScreenState extends State<RegisterFormScreen> {
  final formKey = GlobalKey<FormState>();
  String? selectedTeamCar;
  String? selectedCar;
  String? selectedWarehome;
  String? selectedNumberCont;
  ListCustomerModel? selectedKhachhang;
  bool isCheckProduct = false;
  bool isCheckNotProduct = true;
  String valueTime = "";
  int numberSelectCont = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<DriverController>(
      init: DriverController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColor.backgroundAppbar,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 25,
              color: Colors.white,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          title: const Text(
            'Đăng ký phiếu vào',
            style: CustomTextStyle.tilteAppbar,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CustomDropdownButton(
                    items: idKho
                        .map((item) => DropdownMenuItem<String>(
                              value: item["value"],
                              child: Text(
                                item["name"],
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    onChanged: (value) {
                      //Do something when changing the item if you want.
                      selectedWarehome = value;
                    },
                    onSaved: (value) {
                      selectedWarehome = value.toString();
                    },
                    text: 'Kho',
                  ),
                  CustomFormFiels(
                    title: "Số xe",
                    controller: controller.numberCar,
                    hintText: "Nhập số xe",
                    icon: Icons.abc,
                  ),
                  ButtonFormSubmit(
                      onPressed: () {
                        print([
                          selectedWarehome,
                          selectedKhachhang!.maKhachHang.toString(),
                          selectedTeamCar,
                          controller.numberCar.text
                        ]);
                        Get.toNamed(
                          Routes.REGISTER_DRIVER_SECOND_SCREEN,
                          arguments: ChangePageRegister(
                              idKho: selectedWarehome,
                              idKhachhang:
                                  selectedKhachhang!.maKhachHang.toString(),
                              idTeamCar: selectedTeamCar,
                              numberCar: controller.numberCar.text),
                        );
                      },
                      text: "Tiếp")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _contFirt(DriverController controller) {
    return Column(
      children: [
        const Divider(),
        CustomFormFiels(
          title: "Số cont 1",
          controller: controller.numberCar,
          hintText: "Nhập số cont",
          icon: Icons.abc,
        ),
        CustomFormFiels(
          title: "Số seal 1",
          controller: controller.numberCar,
          hintText: "Nhập số seal",
          icon: Icons.abc,
        ),
        CustomFormFiels(
          title: "Số seal 2",
          controller: controller.numberCar,
          hintText: "Nhập số seal",
          icon: Icons.abc,
        ),
        CustomFormFiels(
          title: "Số seal 3",
          controller: controller.numberCar,
          hintText: "Nhập số seal",
          icon: Icons.abc,
        ),
        CustomFormFiels(
          title: "Số book",
          controller: controller.numberCar,
          hintText: "Nhập số book",
          icon: Icons.abc,
        ),
        CustomFormFiels(
          title: "Số kiện",
          controller: controller.numberCar,
          hintText: "Nhập số kiện",
          icon: Icons.abc,
        ),
        CustomFormFiels(
          title: "Số khối",
          controller: controller.numberCar,
          hintText: "Nhập số khối",
          icon: Icons.abc,
        ),
      ],
    );
  }

  Widget _contSecond(DriverController controller) {
    return Column(
      children: [
        Divider(),
        CustomFormFiels(
          title: "Số cont 2",
          controller: controller.numberCar,
          hintText: "Nhập số cont",
          icon: Icons.abc,
        ),
        CustomFormFiels(
          title: "Số seal 1",
          controller: controller.numberCar,
          hintText: "Nhập số seal",
          icon: Icons.abc,
        ),
        CustomFormFiels(
          title: "Số seal 2",
          controller: controller.numberCar,
          hintText: "Nhập số seal",
          icon: Icons.abc,
        ),
        CustomFormFiels(
          title: "Số seal 3",
          controller: controller.numberCar,
          hintText: "Nhập số seal",
          icon: Icons.abc,
        ),
        CustomFormFiels(
          title: "Số book",
          controller: controller.numberCar,
          hintText: "Nhập số book",
          icon: Icons.abc,
        ),
        CustomFormFiels(
          title: "Số kiện",
          controller: controller.numberCar,
          hintText: "Nhập số kiện",
          icon: Icons.abc,
        ),
        CustomFormFiels(
          title: "Số khối",
          controller: controller.numberCar,
          hintText: "Nhập số khối",
          icon: Icons.abc,
        ),
      ],
    );
  }

  final List<Map<String, dynamic>> genderItems = [
    {"value": "tai", "name": "Xe tải"},
    {"value": "con", "name": "Xe container"},
  ];

  final List<Map<String, dynamic>> numberCont = [
    {'value': "0", "name": "0"},
    {'value': "1", "name": "1"},
    {'value': "2", "name": "2"},
  ];

  final List<Map<String, dynamic>> idKho = [
    {"value": "K1", "name": "Kho 1"},
    {"value": "K2", "name": "Kho 2"},
    {"value": "K3", "name": "Kho 3"},
    {"value": "K4", "name": "Kho 4"},
    {"value": "K5", "name": "Kho 5"},
  ];
}

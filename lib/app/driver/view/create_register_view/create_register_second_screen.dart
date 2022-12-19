import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:tbs_logistics_dangtai/app/driver/controller/driver_controller.dart';
import 'package:tbs_logistics_dangtai/app/driver/model/chage_page_model.dart';
import 'package:tbs_logistics_dangtai/config/core/data/color.dart';
import 'package:tbs_logistics_dangtai/config/widget/buttom_form_submit.dart';
import 'package:tbs_logistics_dangtai/config/widget/custom_text_form_fiels.dart';
import 'package:tbs_logistics_dangtai/config/widget/drop_button.dart';

class CreateRegisterSecondScreen extends StatefulWidget {
  const CreateRegisterSecondScreen({Key? key}) : super(key: key);

  @override
  State<CreateRegisterSecondScreen> createState() =>
      _CreateRegisterSecondScreenState();
}

class _CreateRegisterSecondScreenState
    extends State<CreateRegisterSecondScreen> {
  final String routes = "/REGISTER_DRIVER_SECOND_SCREEN";
  String? selectedTeamCar;
  String? selectedCar;
  String? selectedWarehome;
  String? selectedNumberCont;
  bool isCheckProduct = false;
  bool isCheckNotProduct = true;
  String valueTime = "";
  int numberSelectCont = 0;
  @override
  Widget build(BuildContext context) {
    var items = Get.arguments as ChangePageRegister;
    print(items);
    return GetBuilder<DriverController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColor.backgroundAppbar,
          title: Text("Nhập số liệu"),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 24,
              color: Colors.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomDropdownButton(
                  items: genderItems
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
                    setState(() {
                      selectedCar = value;
                    });
                    print(selectedCar);
                  },
                  onSaved: (value) {
                    setState(() {
                      selectedCar = value.toString();
                    });
                  },
                  text: 'Loại xe',
                ),
                selectedCar == "tai"
                    ? CustomFormFiels(
                        title: "Số seal",
                        controller: controller.numberCar,
                        hintText: "Nhập số seal",
                        icon: Icons.abc,
                      )
                    : CustomDropdownButton(
                        items: numberCont
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
                          setState(() {
                            selectedNumberCont = value;
                            numberSelectCont =
                                int.parse("${selectedNumberCont}");
                          });
                          print(selectedCar);
                        },
                        onSaved: (value) {
                          setState(() {
                            selectedNumberCont = value.toString();
                          });
                        },
                        text: 'Chọn tổng số cont',
                      ),
                numberSelectCont >= 1 ? _contFirt(controller) : Container(),
                numberSelectCont >= 2 ? _contFirt(controller) : Container(),
                ButtonFormSubmit(
                    onPressed: () {
                      controller.postRegisterDriver(
                        numberCar: items.numberCar,
                        numberCont1: controller.numberCont1.text,
                        numberCont1Seal1: controller.numberCont1Seal1.text,
                        numberCont1Seal2: controller.numberCont1Seal2.text,
                        numberCont1Seal3: controller.numberCont1Seal3.text,
                        numberCont2: controller.numberCont2.text,
                        numberCont2Seal1: controller.numberCont2Seal1.text,
                        numberCont2Seal2: controller.numberCont2Seal2.text,
                        numberCont2Seal3: controller.numberCont2Seal3.text,
                        numberKhoi: controller.numberKhoi.text,
                        numberKhoi1: controller.numberKhoi1.text,
                        numberKien: controller.numberKien.text,
                        numberKien1: controller.numberKien1.text,
                        numberPO: controller.numberPO.text,
                        numberPO1: controller.numberPO1.text,
                        idCar: selectedCar,
                        idKhachhang: items.idKhachhang,
                        idKho: items.idKho,
                        time: '2022-12-16T03:12:15.644Z',
                      );
                    },
                    text: "Đăng ký")
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _contFirt(DriverController controller) {
    return Column(
      children: [
        Divider(),
        CustomFormFiels(
          title: "Số cont 1",
          controller: controller.numberCont1,
          hintText: "Nhập số cont",
          icon: Icons.abc,
        ),
        CustomFormFiels(
          title: "Số seal 1",
          controller: controller.numberCont1Seal1,
          hintText: "Nhập số seal",
          icon: Icons.abc,
        ),
        CustomFormFiels(
          title: "Số seal 2",
          controller: controller.numberCont1Seal2,
          hintText: "Nhập số seal",
          icon: Icons.abc,
        ),
        CustomFormFiels(
          title: "Số seal 3",
          controller: controller.numberCont1Seal2,
          hintText: "Nhập số seal",
          icon: Icons.abc,
        ),
        CustomFormFiels(
          title: "Số book",
          controller: controller.numberPO,
          hintText: "Nhập số book",
          icon: Icons.abc,
        ),
        CustomFormFiels(
          title: "Số kiện",
          controller: controller.numberKien,
          hintText: "Nhập số kiện",
          icon: Icons.abc,
        ),
        CustomFormFiels(
          title: "Số khối",
          controller: controller.numberKhoi,
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
          controller: controller.numberCont2,
          hintText: "Nhập số cont",
          icon: Icons.abc,
        ),
        CustomFormFiels(
          title: "Số seal 1",
          controller: controller.numberCont2Seal1,
          hintText: "Nhập số seal",
          icon: Icons.abc,
        ),
        CustomFormFiels(
          title: "Số seal 2",
          controller: controller.numberCont2Seal2,
          hintText: "Nhập số seal",
          icon: Icons.abc,
        ),
        CustomFormFiels(
          title: "Số seal 3",
          controller: controller.numberCont2Seal3,
          hintText: "Nhập số seal",
          icon: Icons.abc,
        ),
        CustomFormFiels(
          title: "Số book",
          controller: controller.numberPO1,
          hintText: "Nhập số book",
          icon: Icons.abc,
        ),
        CustomFormFiels(
          title: "Số kiện",
          controller: controller.numberKien1,
          hintText: "Nhập số kiện",
          icon: Icons.abc,
        ),
        CustomFormFiels(
          title: "Số khối",
          controller: controller.numberKhoi1,
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
}

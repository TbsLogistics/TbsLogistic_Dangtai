import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tbs_logistics_dangtai/app/driver/controller/driver_controller.dart';

import 'package:tbs_logistics_dangtai/config/widget/buttom_form_submit.dart';
import 'package:tbs_logistics_dangtai/config/widget/custom_text_form_fiels.dart';
import 'package:tbs_logistics_dangtai/config/widget/drop_button.dart';

// ignore: must_be_immutable
class RegisterOutScreen extends GetView<DriverController> {
  final String routes = "/REGISTER_OUT_SCREEN";
  // String? selectedNumberCont;
  // int numberSelectCont = 0;

  RegisterOutScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var items = Get.arguments;
    var maPhieu = items[0] as int;
    print(maPhieu);
    var loaixe = items[1];

    return GetBuilder<DriverController>(
      init: DriverController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(
            "Đăng ký phiếu ra",
            style: TextStyle(color: Theme.of(context).primaryColorLight),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Theme.of(context).primaryColorLight,
              size: 25,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: loaixe == "con"
              ? _buildContainer(controller, maPhieu, context)
              : _buildTai(controller, maPhieu, context),
        ),
      ),
    );
  }

  Widget _buildTai(
    DriverController controller,
    int item,
    BuildContext context,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Column(
        children: [
          const Divider(),
          CustomFormFiels(
            title: "Số seal 1",
            controller: controller.contRa1seal1,
            hintText: "Nhập số seal",
            icon: Icons.abc,
            color: Theme.of(context).primaryColorLight,
          ),
          CustomFormFiels(
            title: "Số book",
            controller: controller.numberBook,
            hintText: "Nhập số book",
            icon: Icons.abc,
            color: Theme.of(context).primaryColorLight,
          ),
          CustomFormFiels(
            title: "Số kiện",
            controller: controller.numberKien,
            hintText: "Nhập số kiện",
            icon: Icons.abc,
            color: Theme.of(context).primaryColorLight,
          ),
          CustomFormFiels(
            title: "Số khối",
            controller: controller.numberKhoi,
            hintText: "Nhập số khối",
            icon: Icons.abc,
            color: Theme.of(context).primaryColorLight,
          ),
          ButtonFormSubmit(
            onPressed: () {
              controller.postRegisterOut(
                contRa1: controller.contRa1.text,
                contRa1seal1: controller.contRa1seal1.text,
                contRa1seal2: controller.contRa1seal2.text,
                contRa2: controller.contRa1.text,
                contRa2seal1: controller.contRa2seal1.text,
                contRa2seal2: controller.contRa2seal1.text,
                soBookra: controller.numberBook.text,
                maphieuvao: item,
                soBookra1: controller.numberBook1.text,
                soKienra: double.parse(controller.numberKien.text),
                soKienra1: double.parse(controller.numberKien1.text),
                sokhoira: double.parse(controller.numberKhoi.text),
                sokhoira1: double.parse(controller.numberKhoi1.text),
              );
            },
            text: "Đăng ký",
          ),
        ],
      ),
    );
  }

  Widget _buildContainer(
      DriverController controller, int item, BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Column(
        children: [
          CustomDropdownButton(
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
              controller.changelNumberCont(value);
            },
            onSaved: (value) {
              controller.saveNumberCont(value);
            },
            text: 'Chọn tổng số cont',
          ),
          const Divider(),
          controller.numberSelectCont >= 1
              ? _contFirt(controller, context)
              : Container(),
          const SizedBox(height: 10),
          controller.numberSelectCont >= 2
              ? _contSecond(controller, context)
              : Container(),
          const SizedBox(height: 10),
          ButtonFormSubmit(
            onPressed: () {
              // print(item);
              controller.postRegisterOut(
                contRa1: controller.contRa1.text,
                contRa1seal1: controller.contRa1seal1.text,
                contRa1seal2: controller.contRa1seal1.text,
                contRa2: controller.contRa1.text,
                contRa2seal1: controller.contRa2seal1.text,
                contRa2seal2: controller.contRa2seal1.text,
                soBookra: controller.numberBook.text,
                maphieuvao: item,
                soBookra1: controller.numberBook1.text,
                soKienra: double.parse(controller.numberKien.text),
                soKienra1: double.parse(controller.numberKien1.text),
                sokhoira: double.parse(controller.numberKhoi.text),
                sokhoira1: double.parse(controller.numberKhoi1.text),
              );
            },
            text: "Đăng ký",
          ),
        ],
      ),
    );
  }

  Widget _contFirt(DriverController controller, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.orangeAccent),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          const Divider(),
          CustomFormFiels(
            title: "Số cont 1",
            controller: controller.numberCont1,
            hintText: "Nhập số cont",
            icon: Icons.abc,
            color: Theme.of(context).primaryColorLight,
          ),
          CustomFormFiels(
            title: "Số seal 1",
            controller: controller.numberCont1Seal1,
            hintText: "Nhập số seal",
            icon: Icons.abc,
            color: Theme.of(context).primaryColorLight,
          ),
          CustomFormFiels(
            title: "Số seal 2",
            controller: controller.numberCont1Seal2,
            hintText: "Nhập số seal",
            icon: Icons.abc,
            color: Theme.of(context).primaryColorLight,
          ),
          CustomFormFiels(
            title: "Số book",
            controller: controller.numberBook,
            hintText: "Nhập số book",
            icon: Icons.abc,
            color: Theme.of(context).primaryColorLight,
          ),
          CustomFormFiels(
            title: "Số kiện",
            controller: controller.numberKien,
            hintText: "Nhập số kiện",
            icon: Icons.abc,
            color: Theme.of(context).primaryColorLight,
          ),
          CustomFormFiels(
            title: "Số khối",
            controller: controller.numberKhoi,
            hintText: "Nhập số khối",
            icon: Icons.abc,
            color: Theme.of(context).primaryColorLight,
          ),
        ],
      ),
    );
  }

  Widget _contSecond(DriverController controller, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.orangeAccent),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          const Divider(),
          CustomFormFiels(
            title: "Số cont 2",
            controller: controller.numberCont2,
            hintText: "Nhập số cont",
            icon: Icons.abc,
            color: Theme.of(context).primaryColorLight,
          ),
          CustomFormFiels(
            title: "Số seal 1",
            controller: controller.numberCont2Seal1,
            hintText: "Nhập số seal",
            icon: Icons.abc,
            color: Theme.of(context).primaryColorLight,
          ),
          CustomFormFiels(
            title: "Số seal 2",
            controller: controller.numberCont2Seal2,
            hintText: "Nhập số seal",
            icon: Icons.abc,
            color: Theme.of(context).primaryColorLight,
          ),
          CustomFormFiels(
            title: "Số book",
            controller: controller.numberBook1,
            hintText: "Nhập số book",
            icon: Icons.abc,
            color: Theme.of(context).primaryColorLight,
          ),
          CustomFormFiels(
            title: "Số kiện",
            controller: controller.numberKien1,
            hintText: "Nhập số kiện",
            icon: Icons.abc,
            color: Theme.of(context).primaryColorLight,
          ),
          CustomFormFiels(
            title: "Số khối",
            controller: controller.numberKhoi1,
            hintText: "Nhập số khối",
            icon: Icons.abc,
            color: Theme.of(context).primaryColorLight,
          ),
        ],
      ),
    );
  }

  final List<Map<String, dynamic>> numberCont = [
    {'value': "1", "name": "1"},
    {'value': "2", "name": "2"},
  ];
}

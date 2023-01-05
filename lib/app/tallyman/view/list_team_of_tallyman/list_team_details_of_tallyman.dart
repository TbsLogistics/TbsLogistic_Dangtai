import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/controller/tallyman_controller.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/model/list_employ_working.dart';

import 'package:tbs_logistics_dangtai/config/core/data/color.dart';
import 'package:tbs_logistics_dangtai/config/core/data/text_style.dart';

// ignore: must_be_immutable
class ListTeamDetailsOfTallyman extends GetView<TallymanController> {
  ListTeamDetailsOfTallyman({super.key});
  final String routes = "/LIST_TEAM_DETAILS_OF_TALLYMAN";
  bool isChangeColorLeft = false;
  bool isChangeColorRight = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var items = Get.arguments[0] as List<ListEmployeeWorkingModel>;
    var maPhieuLamHang = Get.arguments[1];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Danh sách thành viên",
          style: CustomTextStyle.tilteAppbar,
        ),
        centerTitle: true,
        backgroundColor: CustomColor.backgroundAppbar,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: CustomColor.gradient,
            ),
            width: size.width,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("$index")],
                    ),
                    title: Text("${items[index].tenNV}"),
                    subtitle: Text("${items[index].maNv}"),
                    trailing: Text("${items[index].tenChucDanh}"),
                  ),
                );
              },
              itemCount: items.length,
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              height: 60,
              child: Row(
                children: [
                  // ignore: unrelated_type_equality_checks
                  Obx(() {
                    print(controller.hideshowButtonLeft.value);
                    return controller.hideshowButtonLeft.value == true
                        ? Expanded(
                            child: Container(
                              height: 60,
                              color: Colors.orangeAccent.withOpacity(0.8),
                              child: TextButton(
                                onPressed: () {
                                  controller.updateStartWorking(
                                    maPhieuLamHang: maPhieuLamHang,
                                  );
                                  controller.hideshowButtonLeft.value =
                                      !controller.hideshowButtonLeft.value;
                                  controller.hideshowButtonRight.value =
                                      !controller.hideshowButtonRight.value;
                                },
                                child: const Text(
                                  "Bắt đầu",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Expanded(child: Container());
                  }),
                  // ignore: unrelated_type_equality_checks
                  Obx(() {
                    print(controller.hideshowButtonRight.value);
                    return controller.hideshowButtonRight.value == false
                        ? Expanded(
                            child: Container(),
                          )
                        : Expanded(
                            child: Container(
                              height: 60,
                              color: Colors.orangeAccent.withOpacity(0.8),
                              child: TextButton(
                                onPressed: () {
                                  controller.updateStopWorking(
                                      maPhieuLamHang: maPhieuLamHang);
                                  controller.hideshowButtonRight.value =
                                      !controller.hideshowButtonRight.value;
                                  controller.hideshowButtonLeft.value =
                                      !controller.hideshowButtonLeft.value;
                                },
                                child: const Text(
                                  "Kết thúc",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

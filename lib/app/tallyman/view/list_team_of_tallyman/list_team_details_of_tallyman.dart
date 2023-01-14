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
  var items;
  var maPhieuLamHang;
  var length;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (Get.arguments != null) {
      var items = Get.arguments[0] as List<ListEmployeeWorkingModel>;
      var maPhieuLamHang = Get.arguments[1];
      var timeBatdau = Get.arguments[2];
      var length = items.length;

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
                itemCount: length,
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

                    Expanded(
                      child: Container(
                        height: 60,
                        color: isChangeColorLeft
                            ? Colors.orangeAccent.withOpacity(0.8)
                            : Colors.black.withOpacity(0.4),
                        child: TextButton(
                          onPressed: () {
                            controller.updateStartWorking(
                              maPhieuLamHang: maPhieuLamHang,
                            );
                            isChangeColorLeft = !isChangeColorLeft;
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
                    ),
                    // ignore: unrelated_type_equality_checks

                    Expanded(
                      child: Container(
                        height: 60,
                        color: Colors.orangeAccent.withOpacity(0.8),
                        child: TextButton(
                          onPressed: () {
                            if (timeBatdau != "null") {
                              controller.updateStopWorking(
                                  maPhieuLamHang: maPhieuLamHang);
                            } else {
                              Get.defaultDialog(
                                title: "Thông báo",
                                content: Text("Chưa bắt đầu làm hàng"),
                                confirm: TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<
                                            Color>(
                                        Colors.orangeAccent.withOpacity(0.6)),
                                  ),
                                  child: const Text(
                                    "Xác nhận",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              );
                            }
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
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    } else {
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
        body: const Center(
          child: Text("Lỗi dữ liệu"),
        ),
      );
    }
  }
}

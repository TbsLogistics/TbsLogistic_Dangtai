import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/model/list_employ_working.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/view/list_team_of_tallyman/controller/list_team_of_tallyman_controller.dart';

import 'package:tbs_logistics_dangtai/config/core/data/color.dart';
import 'package:tbs_logistics_dangtai/config/core/data/text_style.dart';

// ignore: must_be_immutable
class ListTeamDetailsOfTallyman extends GetView<ListTeamOfTallymanController> {
  ListTeamDetailsOfTallyman({super.key});
  final String routes = "/LIST_TEAM_DETAILS_OF_TALLYMAN";
  bool isChangeColorLeft = false;
  bool isChangeColorRight = false;
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
          title: Text(
            "Danh sách thành viên",
            style: TextStyle(
              color: Theme.of(context).primaryColorLight,
            ),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new),
            color: Theme.of(context).primaryColorLight,
          ),
        ),
        body: Stack(
          children: [
            Container(
              // decoration: const BoxDecoration(
              //   gradient: CustomColor.gradient,
              // ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              width: size.width,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                        // borderRadius: BorderRadius.circular(80),
                        side: BorderSide(
                            color: Theme.of(context).primaryColorLight)
                        //set border radius more than 50% of height and width to make circle
                        ),
                    child: ListTile(
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text("$index")],
                      ),
                      title: Text(
                        "${items[index].tenNV}",
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      subtitle: Text(
                        "${items[index].maNv}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Text(
                        "${items[index].tenChucDanh}",
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
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
              child: SizedBox(
                height: 60,
                child: Row(
                  children: [
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
                                content: const Text("Chưa bắt đầu làm hàng"),
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/controller/list_finished_detail_working_controller.dart';

import 'package:tbs_logistics_dangtai/app/tallyman/model/list_mem_in_team.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/view/ware_home/model/ticker_working_model.dart';
import 'package:tbs_logistics_dangtai/config/core/data/color.dart';
import 'package:tbs_logistics_dangtai/config/core/data/text_style.dart';

// ignore: must_be_immutable
class ListFinishedDetailsWorking
    extends GetView<ListFinishedDetailsOfTallymanController> {
  ListFinishedDetailsWorking({super.key});
  final String routes = "/LIST_TEAM_DETAILS_OF_TALLYMAN";
  bool isChangeColorLeft = false;
  bool isChangeColorRight = false;
  @override
  var controller = Get.put(ListFinishedDetailsOfTallymanController());
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (Get.arguments != null) {
      var items = Get.arguments[0] as TickerWorkingModel;
      var maPhieuLamHang = Get.arguments[1];
      var timeBatdau = Get.arguments[2];
      var listTeam = Get.arguments[3] as List<ListMemInTeamModel>;
      var day = DateFormat("dd-MM-yyyy");
      var hour = DateFormat("hh:mm a");

      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Chi tiết đơn",
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
            SingleChildScrollView(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                width: size.width,
                height: size.height * 1.25,
                child: Column(
                  children: [
                    _buildDayTime(items, size, day, hour, context),
                    const SizedBox(height: 10),
                    _buildNumberCar(
                      items: items,
                      size: size,
                      context: context,
                      title1: "Loại xe",
                      content1: "${items.tenLoaiXe}",
                      title2: "Số xe",
                      content2: "${items.soxe}",
                    ),
                    _buildNumberCar(
                      items: items,
                      size: size,
                      context: context,
                      title1: "Tên loại hàng",
                      content1: "${items.tenLoaiHang}",
                      title2: "Số cont",
                      content2: items.socont != null ? "${items.socont}" : "",
                    ),
                    _buildNumberCar(
                      items: items,
                      size: size,
                      context: context,
                      title1: "Tên cửa",
                      content1: "${items.tenCua}",
                      title2: "Số dock",
                      content2: "${items.tenDock}",
                    ),
                    _buildNumberCar(
                      items: items,
                      size: size,
                      context: context,
                      title1: "Số kiện",
                      content1: "${items.soKien}",
                      title2: "Số khối",
                      content2: "${items.soKhoi}",
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: listTeam.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              leading: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.orangeAccent,
                                  ),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                height: 30,
                                width: 30,
                                child: Center(
                                  child: Text(
                                    "${index + 1}",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              title: Text("${listTeam[index].tenNV}"),
                              subtitle: Text("${listTeam[index].maNv}"),
                              trailing: Text("${listTeam[index].tenChucDanh}"),
                            ),
                          );
                        },
                      ),
                    ),
                    // const SizedBox(
                    //   height: 60,
                    // ),
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

  Widget _buildDayTime(TickerWorkingModel items, Size size, DateFormat day,
      DateFormat hour, BuildContext context) {
    return Card(
      child: Container(
        height: size.width * 0.15,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.orangeAccent,
          ),
          borderRadius: BorderRadius.circular(15),
          // color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  const Expanded(
                    flex: 2,
                    child: Center(
                      child: Text(
                        "Ngày dự kiến",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: Text(
                        day.format(DateTime.parse(items.thoiGianDuKienBatDau!)),
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).primaryColorLight,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const VerticalDivider(
              width: 1,
              indent: 10,
              endIndent: 10,
              color: Colors.orangeAccent,
              thickness: 1,
            ),
            Expanded(
              child: Column(
                children: [
                  const Expanded(
                    flex: 2,
                    child: Center(
                      child: Text(
                        "Thời gian bắt đầu dự kiến",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: Text(
                        hour.format(
                            DateTime.parse(items.thoiGianDuKienBatDau!)),
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).primaryColorLight,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNumberCar(
      {required TickerWorkingModel items,
      required Size size,
      required BuildContext context,
      required String title1,
      required String content1,
      required String title2,
      required String content2}) {
    return Card(
      child: Container(
        height: size.width * 0.15,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.orangeAccent,
          ),
          borderRadius: BorderRadius.circular(15),
          // color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Text(
                        title1,
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: Text(
                        content1,
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).primaryColorLight,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const VerticalDivider(
              width: 1,
              indent: 10,
              endIndent: 10,
              color: Colors.orangeAccent,
              thickness: 1,
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Text(
                        title2,
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: Text(
                        content2,
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).primaryColorLight,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

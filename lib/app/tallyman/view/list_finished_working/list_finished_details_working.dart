import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/controller/tallyman_controller.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/model/list_employ_working.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/model/list_of_emfloy.dart';

import 'package:tbs_logistics_dangtai/config/core/data/color.dart';
import 'package:tbs_logistics_dangtai/config/core/data/text_style.dart';

// ignore: must_be_immutable
class ListFinishedDetailsWorking extends GetView<TallymanController> {
  ListFinishedDetailsWorking({super.key});
  final String routes = "/LIST_FINISHED_DETAILS_WORKING";

  var items;
  var length;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (Get.arguments != null) {
      var items = Get.arguments as List<ListOfEmployeesModel>;

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
        body: Container(
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
                  trailing: Text("${items[index].soDienThoai}"),
                ),
              );
            },
            itemCount: items.length,
          ),
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
